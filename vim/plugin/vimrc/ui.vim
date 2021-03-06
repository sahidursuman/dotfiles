" Always show the status line
set laststatus=2

" Status Line
set statusline=%f    " Path.
set statusline+=%m   " Modified flag.
set statusline+=%r   " Readonly flag.
set statusline+=%w   " Preview window flag.

set statusline+=\    " Space.
set statusline+=%=   " Right align.
set statusline+=\    

" Fugitive
set statusline+=%{fugitive#statusline()}

" File format, encoding and type.  Ex: "(unix/utf-8/python)"
set statusline+=(
set statusline+=%{&ff}                        " Format (unix/DOS).
set statusline+=/
set statusline+=%{strlen(&fenc)?&fenc:&enc}   " Encoding (utf-8).
set statusline+=/
set statusline+=%{&ft}                        " Type (python).
set statusline+=)

" Line and column position and counts.
" (Like :h ruler)
set statusline+=\ (line\ %l\/%L,\ col\ %03c)

" Show tabpages if we have more than one tab
if exists('&showtabline')
  set showtabline=1
endif


" Disable Background Color Erase (BCE) so that color schemes
" work properly when Vim is used inside tmux and GNU screen.
" See  http://snk.tuxfamily.org/log/vim-256color-bce.html
if &term =~ '256color'
  set t_ut=
endif

" If I can use true colors, do so. Probably need to another guard to check if
" the terminal supports it. (iTerm and macOS Terminal.app do)
if has('termguicolors')
    set termguicolors
endif

if version >= 703 && exists("+syntax") && (has('gui_running') || has('macunix'))
  " Show a column marker for line length. text SHOULD not go past this
  set colorcolumn=+3

  " Highlight the line the cursor is on when in Normal mode.
  augroup cursorline
      au!
      au WinLeave,InsertEnter * set nocursorline
      au WinEnter,InsertLeave * set cursorline
  augroup END
endif

" Line Wrapping
if has('linebreak')
    if has('patch-7.4-388') 
        set breakindent
    endif 

    let &showbreak='↳ '
    " See :h linebreak
    "     :h breakindent
    "     :h breakindentopt
endif


" Close the preview window after you select an item from the completion menu
" Also, see: http://usevim.com/2013/01/25/preview-window/
if has('autocmd') && v:version >= 704
    augroup completedone
        au!
        au CompleteDone * pclose
    augroup END
endif
