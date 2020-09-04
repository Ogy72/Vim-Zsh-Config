set nocompatible            " be iMproved, required
filetype on                 " filetype must be 'on' before setting it 'off'
                            "   otherwise it exits with a bad status and breaks
                            "   git commit.
filetype off                " force reloading *after* pathogen loaded
set exrc

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugin
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'vim-syntastic/syntastic'
Plugin 'powerline/powerline'
Plugin 'itchyny/lightline.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'mattn/emmet-vim'
Plugin 'ap/vim-buftabline'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'Raimondi/delimitMate'
Plugin 'othree/html5.vim'

" css
Plugin 'ap/vim-css-color'
Plugin 'hail2u/vim-css3-syntax'

" Theme
Plugin 'morhetz/gruvbox'
Plugin 'ayu-theme/ayu-vim'
Plugin 'mhartington/oceanic-next'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'joshdick/onedark.vim'
Plugin 'dracula/vim',{'name':'dracula'}
" Plugin 'ryanoasis/vim-devicons'

" End All Plugin
call vundle#end()

syntax on
filetype plugin indent on   " enable detection, plugins and indent

" IndentLine {{
let g:indentLine_char = ''
let g:indentLine_first_char = ''
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
" }}


" Set UI
" ------------------
"let ayucolor="dark"
"colorscheme ayu
"colorscheme OceanicNext
"colorscheme onedark
colorscheme dracula
let g:airline_theme='onedark'
set guifont=Monospace\ 10
set encoding=utf-8 nobomb
set cursorline
set laststatus=2
set number
set numberwidth=4
set showmode                " Show the current mode.
set showcmd                 " show partial command on last line of screen.
set showmatch               " show matching parenthesis
set splitbelow splitright   " how to split new windows.
set title                   " Show the filename in the window title bar.

set scrolloff=5             " Start scrolling n lines before horizontal
                            "   border of window.
set sidescrolloff=7         " Start scrolling n chars before end of screen.
set sidescroll=1

if $COLORTERM == 'xfce4-terminal'
	set t_co=256
endif

if (has("termguicolors"))
  set termguicolors
endif

" -----------------


set t_Co=256
set ruler
set hidden
set relativenumber
set undofile
set ttyfast
set ttimeoutlen=0
set hlsearch
set filetype=html
set filetype=php

" --- command completion ---
set wildmenu                " Hitting TAB in command mode will
set wildchar=<TAB>          "   show possible completions.
set wildmode=list:longest
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/node_modules/*
set wildignore+=*.DS_STORE,*.db,node_modules/**,*.jpg,*.png,*.gif
set wildignore+=*/coverage

" -----------------------------------------------------------------------------
" INDENTATION AND TEXT-WRAP
" -----------------------------------------------------------------------------

set expandtab                   " Expand tabs to spaces
set autoindent smartindent      " auto/smart indent
set copyindent                  " copy previous indentation on auto indent
set softtabstop=4               " Tab key results in # spaces
set tabstop=4                   " Tab is # spaces
set shiftwidth=4                " The # of spaces for indenting.
set smarttab                    " At start of line, <Tab> inserts shift width
                                "   spaces, <Bs> deletes shift width spaces.

set wrap                        " wrap lines
set textwidth=120
set formatoptions=qrn1          " automatic formating.
set formatoptions-=o            " don't start new lines w/ comment leader on
                                "   pressing 'o'

set nomodeline                  " don't use modeline (security)

set pastetoggle=<leader>p       " paste mode: avoid auto indent, treat chars
                                "   as literal.


" ==== NERDTREE ====
" let NERDTreeIgnore = ['\.pyc$', '\.o$', '\.so$', '\.a$', '\.swp', '*\.swp', '\.swo', '\.swn', '\.swh', '\.swm', '\.swl', '\.swk', '\.sw*$', '[a-zA-Z]*egg[a-zA-Z]*', '[a-zA-Z]*cache[a-zA-Z]*']
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden=1
let NERDTreeWinSize=27
let g:NERDTreeWinPos="right"
" let g:NERDTreeDirArrows=0
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let mapleader = " "
map <C-\> :NERDTreeToggle<CR>
map <C-f> :NERDTreeRefreshRoot<CR>
" ====================

" +++++ MAPING NERDTREE +++++
map <C-h> <c-w>h
map <C-j> <c-w>j
map <C-k> <c-w>k
map <C-l> <c-w>l
" ++++++++++++++++++++++++++++

" +++++ MAPING BUFFER +++++
set hidden
nnoremap <C-P> :bnext<CR>
nnoremap <C-O> :bprev<CR>
"+++++++++++++++++++++++++

" +++ SET SYNASTIC +++
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" +++++++++++++++++++++

" +++ SET LIGHTLINE +++
set laststatus=2
set noshowmode
if !has('gui_running')
  set t_Co=256
let g:AutoClosePreservDotReg = 0
endif
let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ },
      \ }

function! LightlineFilename()
  return &filetype ==# 'vimfiler' ? vimfiler#get_status_string() :
        \ &filetype ==# 'unite' ? unite#get_status_string() :
        \ &filetype ==# 'vimshell' ? vimshell#get_status_string() :
        \ expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0
" ++++++++++++++++++++++

" +++++ SET MULTIPLE CURSOR +++++
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'
"++++++++++++++++++++++++++++++++++++++++++++++

" +++++ SET EDITOR CONFIG ++++++
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
" +++++++++++++++++++++++++++++++

" +++++ GIT GUTTER SETUP ++++
set updatetime=100
let g:gitgutter_set_sign_backgrounds=0
function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = 'm'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_removed_above_and_below = '{'
let g:gitgutter_sign_modified_removed = 'w'
++++++++++++++++++++++++++++++++++++++++++

:set fillchars=stlnc:=,vert:+,fold:-,diff:-
highlight VertSplit guibg=Blue ctermbg=6 ctermfg=0

" +++++ SETUP GIT NERDTREE ++++++
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
let g:NERDTreeGitStatusUntrackedFilesMode = 'all'
let g:NERDTreeGitStatusShowClean = 1
" +++++++++++++++++++++++++++++++++++

" +++++ SETUP ONE DARK +++++
let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=1
let g:ondedark_termcolors=256
" +++++++++++++++++++++++++++++

" +++++ EMMET SETUP +++++
let g:user_emmet_leader_key='<C-a>'
" +++++++++++++++++++++++

"Disable arrow key normal mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

hi Normal guibg=NONE ctermbg=NONE
