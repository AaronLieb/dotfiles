" ~/.vim/colors/molokai.vim
colorscheme molokai

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
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


call plug#begin('~/.config/nvim/plugged')
Plug 'psliwka/vim-smoothie'
Plug 'sbdchd/neoformat'
Plug 'preservim/nerdtree'
"Plug 'numToStr/Comment.nvim'
call plug#end()

" Setup comments
"lua require('Comment').setup()

" Autoformat on save 
autocmd BufWritePre *.js,*.ts,*.html,*.css Neoformat

" Nerd Tree keybindings
noremap <C-k> :NERDTreeFocus<cr>
noremap <C-n> :NERDTreeToggle<cr>

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
