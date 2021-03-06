#source antigen.zsh

# Load the oh-my-zsh's library.
# antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
# antigen bundle git
# antigen bundle heroku
# antigen bundle pip
# antigen bundle lein
# antigen bundle command-not-found

# pure
antigen bundle sindresorhus/pure

# zsh-completions
antigen bundle zsh-users/zsh-completions src

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# History Search
antigen bundle zsh-users/zsh-history-substring-search

zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

## bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

## mac users bind UP and DOWN arrow keys
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Load the theme.
# antigen theme robbyrussell

# Tell antigen that you're done.
antigen apply

