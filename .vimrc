"""""""  pathogen """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	call pathogen#infect()
	"""from http://mirnazim.org/writings/vim-plugins-i-use/   
	call pathogen#runtime_append_all_bundles()
	call pathogen#helptags()
	filetype plugin on
	syntax on


""""""" Text File Stuff """""""""""""""""""""""""""""""""""""""""""""""""""""
	au BufRead,BufNewFile *.txt set tabstop=4
	au BufRead,BufNewFile *.txt set shiftwidth=4
	au BufRead,BufNewFile *.txt set softtabstop=4
	au BufRead,BufNewFile *.txt set expandtab
	au BufRead,BufNewFile *.txt set textwidth=79


""""""" Folding """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	au BufRead,BufNewFile *.py  setlocal foldmethod=expr
	au BufRead,BufNewFile *.txt setlocal foldmethod=indent
	"au BufWinEnter        *.txt if &foldmethod == 'indent' | setlocal foldmethod=manual | endif
	nnoremap <space> za
	vnoremap <space> zf
	au BufWinLeave *.* mkview          " save folds
	au BufWinEnter *.* silent loadview " get folds -warning - gives error on loads
	let g:SimpylFold_docstring_preview = 1


""""""" Omni Completion & SuperTab """""""""""""""""""""""""""""""""""""""""""
	set omnifunc=pythoncomplete#Complete
	let g:SuperTabDefaultCompletionType = "context"


"""""""  tagbar """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	nmap <F8> :TagbarToggle<CR>
	let g:tagbar_usearrows=1
	"""regenerate ctags for python distribution - useful for virtual envs
	"""   from http://stackoverflow.com/questions/3175916/vim-run-ctags-on-current-python-site-packages
	map <F11> :!ctags -R -f ./tags `python -c "from distutils.sysconfig import get_python_lib; print get_python_lib()`<CR>


"""""""" Syntastic """""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        set statusline+=%#warningmsg#
        set statusline+=%{SyntasticStatuslineFlag()}
        set statusline+=%*
        map <F6> :SyntasticCheck<CR>
	let g:syntastic_python_checkers=['pylint']
	let g:syntastic_python_pylint_post_args='--rcfile /home/ken/.vim/.pylintrc'


"""""""" Powerline """""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	set nocompatible   " Disable vi-compatibility
	set laststatus=2   " Always show the statusline
	set encoding=utf-8 " Necessary to show Unicode glyphs
	set t_Co=256       " Explicitly tell Vim that the terminal supports 256 colors

   
"""""""" NerdTree """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	map <F7> :NERDTreeToggle<CR>
	map <C-h> gT
	map <C-l> gt
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif "Closes NERDTree automatically


"""""""" misc """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	set ignorecase
	set smartcase
	"set title
	"set scrolloff=3    " provide a little context around cursor
	inoremap jj <Esc>   " doesnt work in gvim, handy esc access from homerow
	nnoremap <C-y> "+y
	vnoremap <C-y> "+y
	nnoremap <C-p> "+gp
	vnoremap <C-p> "+gp
	map <F5> :SPCheck<CR>
	xnoremap . :norm .<CR>


"""""""" indent toggling """""""""""""""""""""""""""""""""""""""""""""""""""""
	nnoremap <F2> :set invpaste paste?<CR>
	set pastetoggle=<F2>
	set showmode


"""""""  rope """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	"""rope shut off due to errors
	"""let ropevim_vim_completion=1





