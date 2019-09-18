
" - pylint reports error when doing `vim ~/Github/vim-calc/build-up/calc.py`
"   instead of doing `cd ~/Github/vim-calc/build-up` and then do `vim calc.py`
" - hotkey to switch between light theme and dark theme (in progress, still
"   some bugs
"
"
"   Testing
"fnew
"call nvim_win_float_set_pos(0,5,10,20,5)
"hi Floating guibg=#00044
"set withhl=Normal:Floating


" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


let mapleader=" "
syntax on
set number
set norelativenumber
set cursorline
set wrap
set showcmd
set wildmenu

set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase


set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a
set encoding=utf-8
let &t_ut=''
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=5
set tw=0
set indentexpr=
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set laststatus=2
set autochdir
set relativenumber
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

noremap = nzz
noremap - Nzz
noremap <LEADER><CR> :nohlsearch<CR>

noremap j h
noremap i k
noremap k j
noremap l l
noremap I 5k
noremap K 5j
noremap J 7h
noremap L 7l
" N key: go to the start of the line
noremap <C-j> 0
" I key: go to the end of the line
noremap <C-l> $

noremap h i
noremap H I

inoremap jj <Esc>

map s <nop>
map S :w<CR>
map Q :q<CR>
map ; :

map sl :set splitright<CR>:vsplit<CR>
map sj :set nosplitright<CR>:vsplit<CR>
map si :set nosplitbelow<CR>:split<CR>
map sk :set splitbelow<CR>:split<CR>

map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

map tu :tabe<CR>
map tj :-tabnext<CR>
map tl :+tabnext<CR>
" move table
map tmj :-tabmove<CR>
map tml :+tabmove<CR>k

map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K

" ===
" === Window management
" ===
" Use <space> + new arrow keys for moving the cursor around windows
map <LEADER>w <C-w>w
map <LEADER>i <C-w>k
map <LEADER>k <C-w>j
map <LEADER>j <C-w>h
map <LEADER>l <C-w>l

" Open a terminal blow window
map <LEADER>/ :set splitbelow<CR>:sp<CR>:term<CR>

" Press space twice to jump to the next '<++>' and edit it
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4i

" Spelling Check with <space>sc
map <LEADER>sc :set spell!<CR>
noremap <C-x> ea<C-x>s
inoremap <C-x> <Esc>ea<C-x>s

" Press ` to change case (instead of ~)
map ` ~

imap <C-c> <Esc>zza
nmap <C-c> zz

" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h

" Call figlet
map tx :r !figlet

" compile function
map r :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cpp'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    set splitright
    :vsp
    :vertical resize-20
    :term python3 %
  elseif &filetype == 'html'
    exec "!chromium % &"
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  endif
endfunc


" map R :source $MYVIMRC<CR>
map R :call CompileBuildrrr()<CR>
func! CompileBuildrrr()
  exec "w"
  if &filetype == 'vim'
    exec "source $MYVIMRC"
  elseif &filetype == 'markdown'
    exec "echo"
  endif
endfunc

" ===
" === Install Plugins with vim-Plug
call plug#begin('~/.config/nvim/plugged')
" Pretty Dress
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'
Plug 'liuchengxu/space-vim-theme'

Plug 'connorholyday/vim-snazzy'

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }

" Taglist
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }

" Error checking
"Plug 'w0rp/ale'

" Auto Complete
"Plug 'Valloric/YouCompleteMe'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'davidhalter/jedi-vim'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-github'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-match-highlight'
Plug 'ncm2/ncm2-markdown-subscope'


" Language Server
Plug 'autozimu/LanguageClient-neovim', {
   \ 'branch': 'next',
   \ 'do': 'bash install.sh',
   \ }

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'

" Undo Tree
Plug 'mbbill/undotree/'

" Other visual enhancement
Plug 'nathanaelkane/vim-indent-guides'
"Plug 'itchyny/vim-cursorword'
"Plug 'tmhedberg/SimpylFold'
Plug 'mhinz/vim-startify'

" Git
Plug 'rhysd/conflict-marker.vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }

" HTML, CSS, JavaScript, PHP, JSON, etc.
Plug 'elzr/vim-json'
Plug 'hail2u/vim-css3-syntax'
Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
Plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'pangloss/vim-javascript', { 'for' :['javascript', 'vim-plug'] }
Plug 'mattn/emmet-vim'

" Python
Plug 'vim-scripts/indentpython.vim', { 'for' :['python', 'vim-plug'] }
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }

" For general writing
Plug 'reedes/vim-wordy'
Plug 'ron89/thesaurus_query.vim'

" Bookmarks
Plug 'kshenoy/vim-signature'

" Other useful utilities
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/goyo.vim' " distraction free writing mode
Plug 'tpope/vim-surround' " type ysks' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'godlygeek/tabular' " type ;Tabularize /= to align the =
Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} ip
" Plug 'scrooloose/nerdcommenter' " in <space>cc to comment a line
"Plug 'yuttie/comfortable-motion.vim'
Plug 'brooth/far.vim'
Plug 'tmhedberg/SimpylFold'
Plug 'kassio/neoterm'
Plug 'vim-scripts/restore_view.vim'

" Dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'kana/vim-textobj-user'
Plug 'roxma/nvim-yarp'

call plug#end()

" ===
" === Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location
" ===
let has_machine_specific_file = 1
if empty(glob('~/.config/nvim/_machine_specific.vim'))
  let has_machine_specific_file = 0
  silent! exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
endif
source ~/.config/nvim/_machine_specific.vim

" ===
" === Dress up my vim
" ===
let g:SnazzyTransparent = 1
colorscheme snazzy
set background=dark
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'jsformatter'
let g:airline_powerline_fonts = 0
let g:airline_theme='simple'

let g:lightline = {
  \     'active': {
  \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \     }
  \ }

" ===
" === NERDTree
" ===
map tt :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "l"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "n"
let NERDTreeMapChangeRoot = "y"

" ==
" == NERDTree-git
" ==
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" ===
" === NCM2
" ===
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>": "\<CR>")
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
let ncm2#popup_delay = 5
let g:ncm2#matcher = "substrfuzzy"
let g:ncm2_jedi#python_version = 3
let g:ncm2#match_highlight = 'sans-serif'

" Some testing features
set shortmess+=c
set notimeout

" ===
" === vim-indent-guide
" ===
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 1
silent! unmap <LEADER>ig
autocmd WinEnter * silent! unmap <LEADER>ig

" ===
" === MarkdownPreview
" ===
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = 'chromium'
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'

" ===
" === Python-syntax
" ===
" let g:python_highlight_all = 1

" ===
" === Taglist
" ===
map <silent> T :TagbarOpenAutoClose<CR>

" ===
" === vim-table-mode
" ===
map <LEADER>tm :TableModeToggle<CR>


" ===
" === Goyo
" ===
map <LEADER>gy :Goyo<CR>


" ===
" === CtrlP
" ===
map <C-p> :CtrlP<CR>
let g:ctrlp_prompt_mappings = {
  \ 'PrtSelectMove("j")':   ['<c-e>', '<down>'],
  \ 'PrtSelectMove("k")':   ['<c-u>', '<up>'],
  \ }


" ===
" === vim-signiture
" ===
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "dm-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "dm/",
        \ 'PurgeMarkers'       :  "dm?",
        \ 'GotoNextLineAlpha'  :  "m<LEADER>",
        \ 'GotoPrevLineAlpha'  :  "",
        \ 'GotoNextSpotAlpha'  :  "m<LEADER>",
        \ 'GotoPrevSpotAlpha'  :  "",
        \ 'GotoNextLineByPos'  :  "",
        \ 'GotoPrevLineByPos'  :  "",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "",
        \ 'GotoPrevMarker'     :  "",
        \ 'GotoNextMarkerAny'  :  "",
        \ 'GotoPrevMarkerAny'  :  "",
        \ 'ListLocalMarks'     :  "m/",
        \ 'ListLocalMarkers'   :  "m?"
        \ }


" ===
" === Undotree
" ===
let g:undotree_DiffAutoOpen = 0
map L :UndotreeToggle<CR>


" ==
" == vim-multiple-cursor
" ==
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<c-k>'
let g:multi_cursor_select_all_word_key = '<a-k>'
let g:multi_cursor_start_key           = 'g<c-k>'
let g:multi_cursor_select_all_key      = 'g<a-k>'
let g:multi_cursor_next_key            = '<c-k>'
let g:multi_cursor_prev_key            = '<c-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'


" My snippits
source ~/.config/nvim/snippits.vim


" Startify
let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

" Far.vim
nnoremap <silent> <LEADER>f :F  %<left><left>

" Testring my own plugin
if !empty(glob('~/Github/vim-calc/vim-calc.vim'))
  source ~/Github/vim-calc/vim-calc.vim
endif

let g:user_emmet_leader_key='<C-f>'
" Open the _machine_specific.vim file if it has just been created
if has_machine_specific_file == 0
  exec "e ~/.config/nvim/_machine_specific.vim"
endif


