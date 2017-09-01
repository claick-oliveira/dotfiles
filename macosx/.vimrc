""" .vimrc from https://gist.github.com/joegoggins/8482408

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'flazz/vim-colorschemes'

" Make Git pervasive in vim ( :Gblame + Glog + many more )
Bundle 'tpope/vim-fugitive'

" file navigator gutter
Bundle "scrooloose/nerdtree.git"

" Command+T replacement (ctrl+P)
Bundle 'kien/ctrlp.vim'

" Rails plugin ( :A mapping! )
Bundle "tpope/vim-rails.git"

" comment lines out (gc in visual mode)
Bundle "tomtom/tcomment_vim.git"

" Make it look amazing
Bundle 'altercation/vim-colors-solarized'

" Pimped out bar at the bottom of current buffer
Bundle "bling/vim-airline.git"

" Highlights class names + methods more brightly
" Handy for seeing syntax shape before your eyes
Bundle "vim-scripts/TagHighlight.git"

" Search everything in the current dir via :Ack
Bundle "mileszs/ack.vim"

" Enable Markdown Preview + GitHub flavored markdown
Bundle "jtratner/vim-flavored-markdown.git"
Bundle "nelstrom/vim-markdown-preview"

" TODO: Figure out how to do indents intelligently
Bundle "austintaylor/vim-indentobject"

" Open a shell within vim via :ConqueTerm
Bundle "skwp/vim-conque"

" Syntax highlighting for .bats files
Bundle 'rosstimson/bats.vim'

" Open up a bash shell quickly in the current window
map <Leader>s <esc>:ConqueTermSplit bash<cr>

" Make Ctrl+w o, function with toggle niceness
Bundle "vim-scripts/ZoomWin"

Bundle 'kchmck/vim-coffee-script'

" requires exuberant ctags
Bundle 'majutsushi/tagbar'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax enable

colorscheme molokai

" ================ Indentation ======================
"
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually

set wrap       "Wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" For MacVim
set guifont=Monaco:h16


" NERDTree Mappins
" Open Nerd Tree with <Leader>n
map <Leader>n <esc>:NERDTreeToggle<cr>

" Reveal current file in NERDTree with <Leader>r
 map <Leader>r <esc>:NERDTreeFind<cr>

" ===== SYNTASTIC
" mark syntax errors with :signs
let g:syntastic_enable_signs=1
" automatically jump to the error when saving the file
let g:syntastic_auto_jump=0
" show the error list automatically
let g:syntastic_auto_loc_list=1
" don't care about warnings
let g:syntastic_quiet_warnings=0

" Coffee Script Compilation
" Compile the current file into a vertcally split screen
map <Leader>cs <esc>:CoffeeCompile vert<cr>

" ====== Make tabs be addressable via Apple+1 or 2 or 3, etc
" Use numbers to pick the tab you want (like iTerm)
map <silent> <D-1> :tabn 1<cr>
map <silent> <D-2> :tabn 2<cr>
map <silent> <D-3> :tabn 3<cr>
map <silent> <D-4> :tabn 4<cr>
map <silent> <D-5> :tabn 5<cr>
map <silent> <D-6> :tabn 6<cr>
map <silent> <D-7> :tabn 7<cr>
map <silent> <D-8> :tabn 8<cr>
map <silent> <D-9> :tabn 9<cr>

" ===== Add some shortcuts for ctags
map <Leader>tt <esc>:TagbarToggle<cr>
" TODO later, get open tag in new tab working
" http://stackoverflow.com/questions/563616/vim-and-ctags-tips-and-tricks
" map <C-\>:tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" map <A-]>:vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Support for github flavored markdown
" via https://github.com/jtratner/vim-flavored-markdown
" with .md extensions
augroup markdown
     au!
     au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END