set nocompatible              " be iMproved, required

" When sourcing multiple times your vimrc file "
" clear the autocommands first instead of adding them "
augroup mygroup
    autocmd!
    autocmd FileType make setlocal noexpandtab
augroup END

" space as leader
let mapleader = "\<Space>"
nnoremap <Space> <Nop>
" do not map any insert mode <leader> mappings, it will cause a pause for
" every press of the spacebar!

" Should always have the same value for simplicity's sake "
set shiftwidth=2 tabstop=2 softtabstop=2
set expandtab
syntax on

" custom leader commands
" write file in normal mode "
nnoremap <leader>w :w<cr>
nnoremap <D-s> :w<cr>
"close buffer
nnoremap <leader>d :bd<cr>
" vimrc edits
nnoremap <leader>E :edit $MYVIMRC<cr>
nnoremap <leader>S :source $MYVIMRC<cr>
vnoremap . :norm.<CR>

"set clipboard=unnamedplus
set go+=a               " Visual selection automatically copied to the clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

nmap <Left> :bp<cr>
vmap <Left> :bp<cr>
nmap <Right> :bn<cr>
vmap <Right> :bn<cr>
nmap <Up> :ls<cr>
vmap <Up> :ls<cr>
nmap <Down> <C-^>
vmap <Down> <C-^>

nmap <Leader>j :bp<cr>
vmap <Leader>j :bp<cr>
nmap <Leader>k :bn<cr>
vmap <Leader>k :bn<cr>
nmap <Leader>ls :ls<cr>
vmap <Leader>ls :ls<cr>
nmap <Leader>b <C-^>
vmap <Leader>b <C-^>

nmap <Leader>P :CtrlPClearAllCaches<cr>

" show matches
set showmatch
set matchtime=3

" String to put at the start of lines that have been wrapped "
let &showbreak='↪ '

" Minimal number of screen lines to keep above and below the cursor "
set scrolloff=3

set relativenumber
set nopaste

set hidden "allow buffer switch with unsaved"
" Persistent undo
set undofile
set undodir=$HOME/.vim_undo
set undolevels=1000
set undoreload=10000

set autoindent

" pathogen
execute pathogen#infect('p_bundle/{}')

filetype off

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plug 'user/L9', {'name': 'newL9'}

" repeat support for other plugins
Plug 'tpope/vim-repeat'

Plug 'mileszs/ack.vim'

Plug 'airblade/vim-gitgutter'
Plug 'taglist.vim'
Plug 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>


" syntax highlighting
" Plug 'strogonoff/vim-coffee-script'
" Bundle 'lukaszkorecki/CoffeeTags'
" let g:CoffeeAutoTagIncludeVars=1

Plug 'mustache/vim-mustache-handlebars'

Plug 'luochen1990/rainbow'
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

Plug 'terryma/vim-multiple-cursors'
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<A-n>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

Plug 'inside/vim-search-pulse'
Plug 'rking/ag.vim'
" silver searcher
if executable('ag')
  let g:ackprg = 'ag --column'
endif
nnoremap \ :Ag 
let g:ag_highlight=1

" incremental search
Plug 'haya14busa/incsearch.vim'
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay
" :h g:incsearch#auto_nohlsearch
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
set incsearch " Preview as you type "
set ignorecase " Don't be case sensitive "
set smartcase " If you type a capital letter, be case sensitive "
set nohlsearch

Plug 'yegappan/greplace'

Plug 'kien/ctrlp.vim'

Plug 'nelstrom/vim-qargs'

Plug 'skwp/greplace.vim'
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

Plug 'Raimondi/delimitMate'
let delimitMate_expand_inside_quotes=1
let delimitMate_quotes = "\" ' `"

Plug 'michaeljsmith/vim-indent-object'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/camelcasemotion'
Plug 'sjl/gundo.vim'
nnoremap <F5> :GundoToggle<CR>

" support custom text objects
Plug 'kana/vim-textobj-user'

" change variable style camel/snake
Plug 'tpope/vim-abolish'
" json text-objects
Plug 'tpope/vim-jdaddy'
" function text-objects
Plug 'vim-scripts/argtextobj.vim'
" comment out code
Plug 'tpope/vim-commentary'
" entire buffer text object
Plug 'kana/vim-textobj-entire'

Plug 'tpope/vim-unimpaired'
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

Plug 'guns/vim-clojure-static'


" project
Plug 'amiorin/vim-project'
let g:project_use_nerdtree = 1
set rtp+=~/.vim/bundle/vim-project/
" default starting path (the home directory)
call project#rc("~/project")
Project "~/ocf/onecent/oct-node", 'oct-node'
Project "~/ocf/onecent/oct-grails", 'oct-grails'
Project "~/ocf/onecent/punch-node", 'punch-node'
Project "~/projects/go/src/github.com/outboundio/server", 'outbound'
Project "~/projects/zendesk/outbound_client", 'tomate'

" custom statusline
Plug 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1
set t_Co=256
set laststatus=2

" syntax error highlighting
Plug 'scrooloose/syntastic'

" css colour preview
Plug 'ap/vim-css-color'

" go
" Plug 'fatih/vim-go'
Plug 'godoctor/godoctor.vim'


call plug#end()



set runtimepath^=~/.vim/bundle/ctrlp.vim

syntax on
filetype plugin indent on
au BufRead,BufNewFile *.pegjs setfiletype javascript

if has('gui_running')
  set guifont=mononoki:h16,Ubuntu\ Mono\ 12,Inconsolata\ 12,\ Envy\ Code\ R\ 10
  set anti gfn=mononoki:h16,Ubuntu\ Mono\ 12,Inconsolata\ 12,\ Envy\ Code\ R\ 10
endif

colorscheme twilight

" hide menus
set guioptions-=m  "menu bar
set guioptions-=T  "toolbar
set guioptions-=r  "scrollbar


set ic
set hls is

" To enable the saving and restoring of screen positions.
let g:screen_size_restore_pos = 1

" To save and restore screen for each Vim instance.
" This is useful if you routinely run more than one Vim instance.
" For all Vim to use the same settings, change this to 0.
let g:screen_size_by_vim_instance = 1

set ssop+=resize,winpos,winsize,blank,buffers,curdir,folds,help,options,tabpages

if has("gui_running")
  " only load the existing session for gvim. use vim for editing single files
  " from the command line

  " save and restore session on exit and start for GUI gvm only
  "
  autocmd VIMEnter * :source ~/.session.vim
  autocmd VIMLeave * :mksession! ~/.session.vim

  function! ScreenFilename()
    if has('amiga')
      return "s:.vimsize"
    elseif has('win32')
      return $HOME.'\_vimsize'
    else
      return $HOME.'/.vimsize'
    endif
  endfunction

  function! ScreenRestore()
    " Restore window size (columns and lines) and position
    " from values stored in vimsize file.
    " Must set font first so columns and lines are based on font size.
    let f = ScreenFilename()
    if has("gui_running") && g:screen_size_restore_pos && filereadable(f)
      let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
      for line in readfile(f)
        let sizepos = split(line)
        if len(sizepos) == 5 && sizepos[0] == vim_instance
          silent! execute "set columns=".sizepos[1]." lines=".sizepos[2]
          silent! execute "winpos ".sizepos[3]." ".sizepos[4]
          return
        endif
      endfor
    endif
  endfunction

  function! ScreenSave()
    " Save window size and position.
    if has("gui_running") && g:screen_size_restore_pos
      let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
      let data = vim_instance . ' ' . &columns . ' ' . &lines . ' ' .
            \ (getwinposx()<0?0:getwinposx()) . ' ' .
            \ (getwinposy()<0?0:getwinposy())
      let f = ScreenFilename()
      if filereadable(f)
        let lines = readfile(f)
        call filter(lines, "v:val !~ '^" . vim_instance . "\\>'")
        call add(lines, data)
      else
        let lines = [data]
      endif
      call writefile(lines, f)
    endif
  endfunction

  if !exists('g:screen_size_restore_pos')
    let g:screen_size_restore_pos = 1
  endif
  if !exists('g:screen_size_by_vim_instance')
    let g:screen_size_by_vim_instance = 1
  endif
  autocmd VimEnter * if g:screen_size_restore_pos == 1 | call ScreenRestore() | endif
  autocmd VimLeavePre * if g:screen_size_restore_pos == 1 | call ScreenSave() | endif
endif


" ctags
"
" coffeescript
let g:tagbar_type_coffee = {
    \ 'ctagstype' : 'coffee',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 'm:methods',
        \ 'f:functions',
        \ 'v:variables',
        \ 'f:fields',
    \ ]
\ }

if executable('coffeetags')
  let g:tagbar_type_coffee = {
    \ 'ctagsbin' : 'coffeetags',
    \ 'ctagsargs' : '',
    \ 'kinds' : [
      \ 'f:functions',
      \ 'o:object',
    \ ],
    \ 'sro' : ".",
    \ 'kind2scope' : {
      \ 'f' : 'object',
      \ 'o' : 'object',
    \ }
  \ }
endif

let g:tagbar_type_css = {
\ 'ctagstype' : 'Css',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 's:selectors',
        \ 'i:identities'
    \ ]
\ }

let g:tagbar_type_groovy = {
    \ 'ctagstype' : 'groovy',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'c:class',
        \ 'i:interface',
        \ 'f:function',
        \ 'v:variables',
    \ ]
\ }



