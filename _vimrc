set nocompatible

set autoindent
set colorcolumn=80
set expandtab
set hlsearch
set backspace=indent,eol,start
set incsearch
set nonu
set scrolloff=3
set shiftwidth=4
set showcmd
set showmatch
set softtabstop=4 " makes spaces feel like tab to backspace
set tabstop=4
set tildeop

filetype plugin indent on
syntax on

au FileType C set makeprg=gcc\ %

" From eclim
let g:EclimHome = '/usr/share/vim/vimfiles/eclim'
let g:EclimEclipseHome = '/usr/share/eclipse'

" http://mark.jerde.org:13780/v1/comp/vim/
" introduced for /common/www/newsite, *.markdown files
augroup templates
    " Remove other autocommands
    au!

    autocmd BufNewFile *.markdown   source ./.template.markdown
    autocmd BufNewFile *.java       execute "normal Ipublic class " . expand('%:t:r') . "\n{\n}\<Esc>2G"
augroup END

au BufNewFile,BufRead *.rkt set filetype=scheme

map  :w!<CR>:!aspell -c %<CR>:e! %<CR>
