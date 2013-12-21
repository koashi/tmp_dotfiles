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

" Set 256 color
set t_Co=256

" Set colorscheme
if s:has_plugin('molokai')
	colorscheme molokai
else
	colorscheme desert
endif

" Show line number
set number

" Set decimal
set nrformats=

set showmode
set showcmd
set cmdheight=2
