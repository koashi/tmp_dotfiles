" .vimrc

set nocompatible               " Be iMproved
set encoding=utf-8

" http://yomi322.hateblo.jp/entry/2012/06/20/225559
function! s:has_plugin(plugin)
	  return !empty(globpath(&runtimepath, 'plugin/'   . a:plugin . '.vim'))
	    \   || !empty(globpath(&runtimepath, 'autoload/' . a:plugin . '.vim'))
	    \   || !empty(globpath(&runtimepath, 'colors/'   . a:plugin . '.vim'))
endfunction

if filereadable(expand('~/.vim/bundle/neobundle.vim/autoload/neobundle.vim')) && v:version >= 702
	
	if has('vim_starting')
		set runtimepath+=~/.vim/bundle/neobundle.vim/
	endif

	let g:neobundle#types#git#default_protocol = "git"

	call neobundle#rc(expand('~/.vim/bundle/'))

	" Let NeoBundle manage NeoBundle
	NeoBundleFetch 'Shougo/neobundle.vim'

	" Recommended to install
	" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
	NeoBundle 'Shougo/vimproc', {
	      \ 'build' : {
	      \     'windows' : 'make -f make_mingw32.mak',
	      \     'cygwin' : 'make -f make_cygwin.mak',
	      \     'mac' : 'make -f make_mac.mak',
	      \     'unix' : 'make -f make_unix.mak',
	      \    },
	      \ }
	NeoBundle 'Shougo/unite.vim'
	NeoBundle 'Shougo/vimfiler.vim'

	" My Bundles here:
	"
	" Note: You don't set neobundle setting in .gvimrc!
	" Original repos on github
	NeoBundle 'tomasr/molokai'
	NeoBundle 'jonathanfilip/vim-lucius'
	NeoBundle 'itchyny/lightline.vim'

	" vim-scripts repos

	" Non github repos

	" gist repos

	" Non git repos

	" ...

filetype plugin indent on     " Required!
"
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" Installation check.
NeoBundleCheck

endif

syntax enable

" To enable 256 colors,
" put this before setting the colorsheme
set t_Co=256

" Set colorscheme
if s:has_plugin('molokai')
	colorscheme molokai
else
	colorscheme desert
endif

" Show line number
set number

" Display status line
set laststatus=2

" lightline.vim
let g:lightline = {
			\ 'colorscheme': 'wombat',
			\ 'mode_map': {'c': 'NORMAL'},
			\ 'active': {
			\   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
			\ },
			\ 'component_function': {
			\   'modified': 'MyModified',
			\   'readonly': 'MyReadonly',
			\   'fugitive': 'MyFugitive',
			\   'filename': 'MyFilename',
			\   'fileformat': 'MyFileformat',
			\   'filetype': 'MyFiletype',
			\   'fileencoding': 'MyFileencoding',
			\   'mode': 'MyMode'
			\ }
			\ }

function! MyModified()
	return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
	return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! MyFilename()
	return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
				\ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
				\  &ft == 'unite' ? unite#get_status_string() :
				\  &ft == 'vimshell' ? vimshell#get_status_string() :
				\ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
				\ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
	try
		if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
			return fugitive#head()
		endif
	catch
	endtry
	return ''
endfunction

function! MyFileformat()
	return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
	return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
	return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
	return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" Show tab, trail, eol, extends, precedes and nbsp
set list
set listchars=tab:▸\ ,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

" Set decimal
set nrformats=

set showmode
set showcmd
set cmdheight=2
