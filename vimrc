" leny/pwenvim - vimrc file
" started at 02/11/2016

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" ----- Leader configuration
let mapleader="\<Space>" " cf. http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/

" ----- Editor config
set backspace=indent,eol,start " Allow backspacing everything in insert mode
set nobackup " Do not keep a backup file
set noswapfile " Same as above
set history=250 " Command history size
set showcmd " Display incomplete commands
set incsearch " Incremental search
set hlsearch " Highlight search result
set hidden " Hide buffers instead of closing
set number " Show line numbers
set tabstop=4 " Tabs are 4 spaces
set softtabstop=4 " Soft tabs are 4 spaces
set shiftwidth=4 " Indenting matches tabs
set expandtab " Expand tabs into spaces
set laststatus=2 " Use two lines for status
set foldmethod=syntax " Use syntax code folding
set encoding=utf-8 " Use UTF-8 encoding by default
set ignorecase " Ignore case on searching…
set smartcase " …unless the search has capitals in it
set modelines=0 " Disable modelines (in-file vim configuration overrides)
set showmatch " Show matching parenthesis
set nrformats=hex,alpha " Increment hex and alpha with numeric command
set wildmenu " Display autocomplete options
set nowrap " Don't wrap long lines
set linebreak " Wrap lines at convenient points
set autoread " Reload files changed outside vim
set fileformat=unix " Use unix line endings
set fileformats=unix,dos " Try unix line endings prior to dos
:au FocusLost * :wa "Save on focus lost
set ttyfast " Improve terminal redraw speed
set foldlevel=250 " Unfold all at opening
set noerrorbells " No error bell

" ----- Color theme
colorscheme tomorrow-night-eighties

" ----- Plugins configuration
filetype off
set rtp+=~/.vim/bundle/Vundle.vim " setup vundle
call vundle#begin() " start vundle plugins list
Plugin 'VundleVim/Vundle.vim' " Vundle needs to manage itself
" --- Utils plugins
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'airblade/vim-gitgutter'
Plugin 'raimondi/delimitmate'
Plugin 'vim-scripts/gitignore'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'terryma/vim-expand-region'
Plugin 'ervandew/supertab'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'kshenoy/vim-signature'
Plugin 'henrik/CamelCaseMotion'
Plugin 'vim-syntastic/syntastic'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'ap/vim-css-color'
Plugin 'letientai299/vim-react-snippets', { 'branch': 'es6' }
Plugin 'pgilad/vim-react-proptypes-snippets'
" --- Syntax plugins
Plugin 'sheerun/vim-polyglot'
Plugin 'vim-scripts/smarty-syntax'

call vundle#end() " end vundle plugins list
filetype plugin on
filetype indent on
syntax on
set smartindent " Use smartindenting
set autoindent " Copy indent from current line when starting new line

" ----- vim-jsx config
let g:jsx_ext_required = 0

" ----- Highlight cursorline on active buffer
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

" ----- Switch relative/absolute line numbers on focus/blur
augroup RelativeNumber
    au!
    au WinLeave,InsertEnter * setlocal norelativenumber
    au BufEnter,WinEnter,InsertLeave * setlocal relativenumber
augroup END

" ----- Preserve folding while creating folds in insert mode
augroup PreserveFolding
    au!
    au InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
    au InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif
augroup END

" Remap :W when I mean to :w.
command! W w

" Remap :w!! to 'save with sudo'
cmap w!! w !sudo tee % > /dev/null

" This unsets the 'last search pattern' register by hitting return
nnoremap <CR> :noh<CR><CR>

" ----- Quicker escape mode
inoremap jj <ESC>
inoremap kk <ESC>
inoremap kj <ESC>
inoremap ;; ;<ESC>

" ----- Remaps goto match
nnoremap <tab> %
vnoremap <tab> %

" ----- Disable arrows in normal mode
nnoremap <up> <nop>
nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>

" ----- Disable Arrow keys in Insert mode
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" ----- Handle double-space in Insert mode
inoremap <space><space> <space><space><left>

" ---- Use arrows to move stuffs in normal/visual mode
nmap <left> <<
nmap <right> >>
vmap <left> <gv
vmap <right> >gv

nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

" prevent entering ex mode accidentally
nnoremap Q <Nop>

" disable K man command
nnoremap K <nop>

" Go to previous file
nnoremap <leader><leader> <c-^>

" ----- Splits Configuration
set splitbelow
set splitright

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-W>: <C-W>_

" ----- Invisibles chars configuration
nmap <leader>l :set list!<CR> " Toggle invisible chars
set listchars=trail:·,tab:··,eol:¬,nbsp:░ " Customize chars used for invisibles
set list

" ----- Toggle wrap
nmap <leader>w :set wrap!<CR> " Togglewrap

" ---- Scrolling
set scrolloff=4 " Lines to keep above and below the cursor
set sidescrolloff=5
set sidescroll=1

" ----- Add save shortcuts
nmap <C-O> :w<CR> " nano-like save shortcut

" ----- Leader key shortcuts
" --- Copy/paste from system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" --- Reloads .vimrc
nmap <Leader>s :source ~/.vimrc

" ----- NERDTree configuration
let NERDTreeShowHidden = 1
map <leader>kb :NERDTreeToggle<CR>
map <leader>kf :NERDTreeFind<CR>

" ----- Use ag in ack plugin
let g:ackprg = 'ag --vimgrep'

" ----- Syntastic configuration
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

let g:syntastic_error_symbol = '⌦'
highlight SyntasticErrorSign guifg=#f2777a
highlight SpellBad guisp=#f2777a
let g:syntastic_style_error_symbol = '⌦'
highlight SyntasticStyleErrorSign guifg=#f2777a
let g:syntastic_warning_symbol = '⌦'
highlight SyntasticWarningSign guifg=#ffcc66
highlight SpellCap guisp=#ffcc66
let g:syntastic_style_warning_symbol = '⌦'
highlight SyntasticStyleWarningSign guifg=#ffcc66

let g:syntastic_stl_format = "%E{%e errors}%B{, }%W{%w warnings}"

let g:syntastic_javascript_checkers = ['eslint']

" ----- Lightline configuration
let g:lightline = {
    \ 'active': {
        \ 'left': [
            \ [ 'mode', 'paste' ],
            \ [ 'readonly', 'filename', 'modified' ]
        \ ],
        \ 'right': [
            \ [ 'lineinfo' ],
            \ [ 'percent' ],
            \ [ 'filetype', 'syntastic' ]
        \ ]
    \ },
    \ 'inactive': {
        \ 'left': [
            \ [ 'filename' ]
        \ ],
        \ 'right': [
            \ [ 'lineinfo' ],
            \ [ 'percent' ]
        \ ]
    \ },
    \ 'component_expand' : {
        \ 'syntastic': 'SyntasticStatuslineFlag'
    \ },
    \ 'separator': {
        \ 'left': '',
        \ 'right': ''
    \ },
    \ 'subseparator': {
        \ 'left': '|',
        \ 'right': '|'
    \ }
\ }

" refresh lightline when buffer is saved
autocmd BufWritePost * call lightline#update()

" ----- Emmet configuration
let g:user_emmet_leader_key = '<c-y>'
let g:user_emmet_prev_key = '<c-j>'
let g:user_emmet_next_key = '<c-k>'
let g:user_emmet_settings={'javascript.jsx': {'extends':'jsx'}}
imap <expr> <c-e> emmet#expandAbbrIntelligent("\<tab>")
autocmd FileType html,jade,css,sass,scss,stylus,smarty,javascript.jsx EmmetInstall

" ----- ctrlp configuration
let g:ctrlp_map = '<c-p>'
map <c-p> :CtrlP<cr>
map <c-b> :CtrlPMRU<cr>
nnoremap <Leader>b :CtrlPMRU<CR>
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" ----- whitespace cleaning
autocmd BufWritePre * :%s/\s\+$//e

" ----- Region expanding configuration
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" ----- YCM Configuration (cf. http://stackoverflow.com/a/22253548)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:SuperTabClosePreviewOnPopupClose = 1

" ----- Ultisnips
let g:UltiSnipsSnippetDirectories=["UltiSnips", "snips"]
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" ----- Fix 'go to mark' behavior with ` as a dead key
nnoremap ' `

" -----

au! BufWritePost .vimrc so %
