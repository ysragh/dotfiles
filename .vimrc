" There can be only one encoding and it's called UTF8
set encoding=utf-8


" Use Unix as the standard file type
set ff=unix


" I mostly use this in a terminal, so this will make things look pretty :)
set background=dark


" Automatically change the current directory
" Sometimes it is helpful if your working directory is always the same as the
" file you are editing.
" See: http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
"
" Removed this due to... it just fucks me up.. I am too used to the old
" fashioned way .. :) anyways I leave it here.. probably I will re-enable it
" someday ..
" set autochdir


" Disable arrow keys so you need to stick to hjkl
"
" I'm not using them anymore.. I just leave them in here, so my colleagues
" at work are forced to learn the proper vim way and later on I then can easily
" reassign them to something more useful.
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>


" Necesary to use use the awesome surround plugin by Tim Pope.
" If we dont specify it here it might work,
" but sometimes it just does't .. so why bother.. we do it here and
" make sure it will always work!
" https://github.com/tpope/vim-surround
noremap s S
nmap s S



autocmd Filetype java set makeprg=javac\ %
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#


" Necesary for lots of cool vim things
set nocompatible


" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.
set pastetoggle=<F2>
set clipboard=unnamed


" Mouse and backspace
set mouse=a " on OSX press ALT and click
set bs=2 " make backspace behave like normal again


" Rebind <Leader> key
" I like to have it here because it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","


" Quicksave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>


" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>


" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation


" Show whitespace
set listchars=tab:>-,trail:-
set list


" Color schemes stuff
set term=xterm
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"


" Color schemes / themes 
" =============================================================================

""" Wombat
""" ----------------------------------------------------
""" http://www.vim.org/scripts/script.php?script_id=2465
""" ===================================================
""" I can't really decide which one I like better.
""" Sometimes I go for wombat and be like: oh wtf.. this is the best
""" theme I can think of .. and then.. suddenly .. I just need a change..
""" .... and then I switch back to molokai .. which is also really good
""" mkdir -p ~/.vim/colors && cd ~/.vim/colors
""" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
""" colorscheme wombat256mod

""" Molokai
""" ----------------------------------------------------
""" https://github.com/tomasr/molokai"
""" ===================================================
""" I really like this theme too and I think powerline / airline
""" just looks awesome with it!
colorscheme molokai


" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on


" Showing line numbers and length
set number " show line numbers
set tw=79 " width of document (used by gd)
set nowrap " don't automatically wrap on load
set fo-=t " don't automatically wrap text when typing
if exists('+colorcolumn')
    set colorcolumn=80
    highlight ColorColumn ctermbg=233
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif


" Useful settings
set history=700
set undolevels=700


" Real programmers use spaces instead of tabs.
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab


" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile


if has('gui_running')
    set guifont=Sauce\ Code\ Powerline:h10
    set antialias
    "set mouseshape=n:pencil
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
endif


" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
call pathogen#infect()


" https://github.com/bling/vim-airline
" A better alternative for the powerline plugin
" Don't forget to download patched fonts and set them as default font
" in your terminal application or in the -has gui running- section.
" ===================================================================
" --- This is a fix for:
" --- vim-airline doesn't appear until i create a new split
set laststatus=2
" This will enable airline itself
let g:airline_powerline_fonts=1


" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*
set runtimepath^=~/.vim/bundle/ctrlp.vim


" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
"" set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction


inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>


call pathogen#helptags()


" Quickly turn search highlighting off.
nnoremap <leader>k :nohl<CR>

" Quickly switch between the actual and the last file in the buffer.
nnoremap <leader>, :b#<CR>
