"""""""  pathogen """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call pathogen#infect()

"""from http://mirnazim.org/writings/vim-plugins-i-use/   
    call pathogen#runtime_append_all_bundles()
    call pathogen#helptags()


"""""""" Python Pep-8 """""""""""""""""""""""""""""""""""""""""""""""""""""""
""" vimrc file for following the coding standards specified in PEP 7 & 8.

""" Number of spaces that a pre-existing tab is equal to.
""" For the amount of space used for a new tab use shiftwidth.
au BufRead,BufNewFile *py,*pyw   set tabstop=4

""" What to use for an indent.
""" This will affect Ctrl-T and 'autoindent'.
""" Python: 4 spaces
au BufRead,BufNewFile *.py,*pyw  set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile Makefile*  set noexpandtab
au BufRead,BufNewFile *.py,*pyw  set softtabstop=4
"""turning smartindent off since we're using type based indentation
"""   set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class       
"""au BufRead *py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class       
"""set smarttab - shouldn't be necessary since we're using all soft tabs

""" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red
""" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
""" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /\s\+$/

""" Wrap text after a certain number of characters
""" Python: 79 
au BufRead,BufNewFile *.py,*.pyw set textwidth=79

""" Use UNIX (\n) line endings.
""" Only used for new files so as to not force existing files to change their
""" line endings.
au BufNewFile *.py,*.pyw set fileformat=unix

""" Set the default file encoding to UTF-8: ``set encoding=utf-8``
""" Puts a marker at the beginning of the file to differentiate between UTF and
""" UCS encoding (WARNING: can trick shells into thinking a text file is actually
""" a binary file when executing the text file): ``set bomb``

""" For full syntax highlighting:
let python_highlight_all=1
syntax on

""" Automatically indent based on file type: 
filetype indent on
""" Keep indentation level from previous line: 
set autoindent

set shiftround
filetype indent on
filetype plugin on
"""messes up SuperTab: set paste


""""""" Text File Stuff """""""""""""""""""""""""""""""""""""""""""""""""""""
au BufRead,BufNewFile *.txt set tabstop=4
au BufRead,BufNewFile *.txt set shiftwidth=4
au BufRead,BufNewFile *.txt set softtabstop=4
au BufRead,BufNewFile *.txt set expandtab
au BufRead,BufNewFile *.txt set textwidth=79


""""""" Folding """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufRead,BufNewFile *.py  setlocal foldmethod=expr
au BufRead,BufNewFile *.txt setlocal foldmethod=indent
"au BufWinEnter        *.txt if &fdm == 'indent' | setlocal foldmethod=manual | endif
nnoremap <space> za
vnoremap <space> zf
au BufWinLeave *.* mkview          " save folds
au BufWinEnter *.* silent loadview " get folds -warning - gives error on loads


""""""" Omni Completion & SuperTab """""""""""""""""""""""""""""""""""""""""""
set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"


"""""""  tagbar """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>
let g:tagbar_usearrows=1

"""regenerate ctags for python distribution - useful for virtual envs
"""   from http://stackoverflow.com/questions/3175916/vim-run-ctags-on-current-python-site-packages
map <F11> :!ctags -R -f ./tags `python -c "from distutils.sysconfig import get_python_lib; print get_python_lib()`<CR>



"""""""" Powerline """""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set t_Co=256       " Explicitly tell Vim that the terminal supports 256 colors

   
"""""""" NerdTree """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F7> :NERDTreeToggle<CR>
map <C-Left> gT
map <C-Right> gt
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif "Closes NERDTree automatically

"""""""" misc """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase
set smartcase
"set title
"set scrolloff=3    " provide a little context around cursor
inoremap jj <Esc>   " doesnt work in gvim
nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-p> "+gp
vnoremap <C-p> "+gp
map <F5> :SPCheck<CR>



"""""""  rope """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""rope shut off due to errors
"""let ropevim_vim_completion=1





