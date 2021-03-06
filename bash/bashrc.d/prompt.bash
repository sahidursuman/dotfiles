# Credits to:
# http://blog.sanctum.geek.nz/bash-prompts/
# http://ithaca.arpinum.org/2013/01/02/git-prompt.html
# https://github.com/sindresorhus/pure
# https://github.com/gf3/dotfiles
# https://github.com/mathiasbynens/dotfiles/blob/master/.bash_prompt
# https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh

function prompt_git_dirty() {
	# check if we're in a git repo
  $(git rev-parse --is-inside-work-tree &>/dev/null) || return
	# check if it's dirty
  git diff --quiet --ignore-submodules HEAD &>/dev/null

	(($? == 1)) && echo '*'
}

function prompt_git_branch() {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(prompt_git_dirty)/"
}

function prompt_user_host() {
  # only show username & host for SSH
  [[ "$SSH_CONNECTION" != '' ]] && echo '\u@\h '
}


# use the contributed git prompt
if command -v brew -v >/dev/null 2>&1; then
	GIT_PROMPT="$(brew --prefix git)/etc/bash_completion.d/git-prompt.sh"
else
	GIT_PROMPT="$HOME/.etc/bash/git-prompt.sh"
fi

[ -r "$GIT_PROMPT" ] && [ -f "$GIT_PROMPT" ] && source "$GIT_PROMPT"

# If Bash 4.0 is available, trim very long paths in prompt
((BASH_VERSINFO[0] >= 4)) && PROMPT_DIRTRIM=3

GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_SHOWSTASHSTATE=1
PROMPT_COMMAND='__git_ps1 "$(prompt_user_host)\w" "\n\$ "'
