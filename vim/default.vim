set backspace=indent,eol,start
set cursorline
set expandtab
set foldenable
set hlsearch
set incsearch
set lazyredraw
set modeline
set mouse=a
set nowritebackup
set number
set relativenumber
set scrolloff=5
set shiftwidth=4
set showcmd
set showmatch
set smartindent
set softtabstop=4
set tabstop=4
set wildmenu
"set whichwrap=h,l,<,>,[,]

" Permanent Undo Settings {{{
let $VIMDIR=".vim"
set undodir=~/.vim/undo    " undo file directory
set undofile                " permanent undo history
set undolevels=1000         " how many undos in history
set undoreload=10000        " max lines for saving undo before reload
"}}}

" Fold settings {{{
set foldenable
" set foldlevel=20
" set foldmethod=syntax
set foldmethod=marker
function! NeatFoldText()
    let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
    let lines_count = v:foldend - v:foldstart + 1
    let lines_count_text = '>> ' . printf("%5s", lines_count . ' lines') . ' <<'
    let foldchar = matchstr(&fillchars, 'fold:\zs.')
    let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
    let foldtextend = lines_count_text . repeat(foldchar, 8)
    let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
    return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
set foldtext=NeatFoldText()
" }}}


" Wild Ignore {{{
set wildignore+=*.a,*.o
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.svn
set wildignore+=*.swp,*.tmp
" }}}


