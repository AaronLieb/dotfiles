" Sets how many lines of history VIM has to remember
set history=500

" Syntax highlighting
syntax on

" Enable filetype plugins
filetype plugin on
filetype indent on

" allow for mouse control (cringe)
set mouse=a

" shows relative lines numbers, except on the current line
set number relativenumber

" indentation size
set tabstop=2
set softtabstop=2
set shiftwidth=2

set scrolloff=2

" converts tabs to spaces
set expandtab

" auto indentation
set ai

" smart indentation
set si

" do not wrap lines
set nowrap

" ignore case except when doing capitals explicitly
set ignorecase
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" magic regex
set magic

" Tab autocomplete for commmands
set wildmenu

" remap 0 to start at beginning of code instead of beginning of line
noremap ) 0
noremap 0 ^

" show current position
set ruler

" height of the command bar
set cmdheight=1

" matching brackets
set showmatch
set mat=2

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" add Alt+Backspace to delete a word in insert mode
imap <M-BS> <C-W>

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %HasPaste()%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

call plug#begin('~/.config/nvim/plugged')
" Smooths page scrolling
Plug 'psliwka/vim-smoothie'

" Adds a file tree
Plug 'preservim/nerdtree'

" More movement/motion utilities. Currently only use for global find char
Plug 'easymotion/vim-easymotion'

" Shows lines in diff 
Plug 'airblade/vim-gitgutter'

" Comment out lines
Plug 'tpope/vim-commentary'

" AutoMatch () {} []
Plug 'jiangmiao/auto-pairs'

" Live preview of markdown in the browser
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

" Better syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Add, change, delete surrouding characters
Plug 'tpope/vim-surround'

" Shows values in registers
Plug 'junegunn/vim-peekaboo'

" Closes html tags
Plug 'alvan/vim-closetag'

call plug#end()

" Setup comments
"lua require('Comment').setup()

" EasyMotion
let g:EasyMotion_smartcase = 1
map s <Plug>(easymotion-bd-f)


" Nerd Tree keybindings
noremap <C-k> :NERDTreeFocus<cr>
noremap <Tab> :NERDTreeToggle<cr>

" Helpers

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
