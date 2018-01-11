"VIMRC File
"Brahm Prakash Mishra


"Vundle Configs below this line
" set the runtime path to include Vundle and initialize
set nocompatible              " be iMproved, required
filetype off                  " required

"Vundle initialization calls
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin() 

"All plugins for vundle to manage
Plugin 'VundleVim/Vundle.vim'

"Colorschemes
Plugin 'morhetz/gruvbox'
Plugin 'romainl/Apprentice'
"Plugin 'reedes/vim-colors-pencil'

"Brace matcing and syntax replacement
Plugin 'tpope/vim-surround'

"Plugin for tex
Plugin 'lervag/vimtex'

"Plugin for taking notes in vim - emulating emacs org-mode
Plugin 'jceb/vim-orgmode'

"Recognize url links
Plugin 'vim-scripts/utl.vim'

"UTL wants speedating plugin
Plugin 'tpope/vim-speeddating'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; ap
"
"
"
"Basic Environment Settings

"Syntax Highlighting

"Enable 256 Color Mode
set t_Co=256

"Change leader key to space
let mapleader=" "
set timeoutlen=700

"Enable Mouse
set mouse =a

"Set vim to use system clipboard
set clipboard=unnamedplus
"Set vim to automatically copy whatever is selected in visual mode to X clipbard
set go+=a

set tabstop=4
set shiftwidth=4

"Indentation
set cindent
set smartindent
set autoindent
set complete+=s

"Code Folding
set foldmethod=syntax
set foldlevel=99
nnoremap <silent> <Tab> za

"Line numbering
set nu

"Custom mappings with Leader
	"Close File
	nmap <leader>q :q<CR>

	"Save file
	nmap <leader>w :w<CR>
	
	"Save file and quit
	nmap <leader>q :wq<CR>

	"Insert datestamp
	nmap <silent>,dt "=strftime("%a, %B %e %Y %t, %l:%M %p")<CR>Pa<Space><Esc>

	"Make And Run Program
	nnoremap <leader>m :make<CR><CR>

"Mappings

	"Don't skip wrapped lines
	map j gj
	map k gk

	"Windows
		"Jump between windows
		map gt <C-W>w 
		map gT <C-W>W

		"Resize windows
		map - <C-W>-
		map + <C-W>+

	"Toggle spellcheck
	nmap <F12> :set spell! spelllang=en_us<CR>

	"Ycm Toggles
	nmap <Space>dd :YcmDiags<CR>

	"YCM shortcut to go to definition
	map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

	"YCM Configs
"let g:ycm_global_ycm_extra_conf = '.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
"let g:ycm_path_to_python_interpreter = '/usr/bin/python'
"let g:ycm_collect_identifiers_from_tags_files=1
"let g:ycm_register_as_syntastic_checker = 1
"let g:ycm_seed_identifiers_with_synatx = 1
"let g:ycm_confirm_extra_conf = 0
"let g:ycm_always_populate_location_list=1

"Tagbar and NERDTree configs
"let g:tagbar_width = 20
"let g:NERDTreeWinSize = 20

"Latex Options	
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

colorscheme gruvbox

"Autocommands for text files
"augroup textFiles
"		au!
"		au BufRead,BufNewfile ~/*.txt set mousemodel="popup"
"			au BufRead,BufNewFile ~/*.txt setlocal spell spelllang=en_us
"			au BufRead,BufNewFile ~/*.txt colorscheme pencil
"	augroup END

"Source vimrc on any changes
augroup myvimrc
	    au!
	        au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif	
	augroup END

"Enable encryption for personal journal entries
augroup myjournal
		au!
			au BufRead,BufNewFile *.jn set tw=100
			au BufRead,BufNewFile *.jn set noswapfile
			au BufNewFile *.jn set cm=blowfish2
			au BufNewFile *.jn X
	augroup END


"Convert a block of code to comment
augroup cpp
	au!
		au BufRead,BufNewFile *.cpp,*.c nmap <leader>cc <C-v>f{%I//<Esc>
		au BufRead,BufNewFile *.cpp,*.c nmap <leader>c <C-V>f{%hx<Esc>
		au BufNewFile *.cpp 0r ~/.vim/skeleton.cpp
"		autocmd FileType c,cpp colorscheme gruvbox
"		autocmd FileType c,cpp let g:gruvbox_contrast_dark="hard" 
"		autocmd FileType c,cpp set background=dark
		
		autocmd filetype cpp nnoremap <F4> :w <bar> exec '!clear && g++ \-lzmq \-ggdb \-std=c++14 \-Iinclude' .shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r') <CR>


	augroup END

augroup Tex
		au!
			autocmd BufRead,BufNewFile *.tex let g:Tex_View_Rule_dvi = 'xdvi'
			autocmd FileType tex nnoremap <buffer> <leader>p :!pdflatex % & zathura %:r".pdf"<CR> <CR>
	augroup END


"Find out type of highlight element
" adds to statusline
set laststatus=2
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}

" a little more informative version of the above
nmap <Leader>sI :call <SID>SynStack()<CR>

"function! <SID>SynStack()
"    if !exists("*synstack")
"        return
"    endif
"    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
"endfunc



"Modify default colorscheme if one not defined already
"if !exists("g:color_name")
"	hi vimLineComment	ctermfg	= 7
"
"	hi vimString		ctermfg	= 135
"	hi vimHiNmbr		ctermfg	= 135
"	hi texDocTypeArgs	ctermfg	= 135
"	hi texInputFileOpt	ctermfg	= 135
"	hi LineNr			ctermfg = 8
"	hi texInputFile		ctermfg = 192
"
"	hi cCommentL		ctermfg = 7
"	hi cCppString		ctermfg = 176
"endif



syntax on

"Background
	"Set background color		
	set background=dark

if &diff
    " diff mode
    set diffopt+=iwhite
endif
