set encoding=utf-8
set termencoding=utf-8
set nocompatible
set ignorecase
set autochdir

"line numbers
set number


"syntax
filetype plugin on
syntax on

"octave
"syntax
augroup filetypedetect
  au! BufRead,BufNewFile *.m,*.oct set filetype=octave
augroup END 
"
"OMNIFUNC
"if has("autocmd") && exists("+omnifunc")
"autocmd Filetype octave
   "\ if &omnifunc == "" |
      "\ setlocal omnifunc=syntaxcomplete#Complete |
   "\ endif
"endif 

"colorscheme
colorscheme solarized
set background=dark

"tab
set tabstop=4
set shiftwidth=4
set expandtab
set cindent
set smartindent
set autoindent
set cinkeys=0{,0},:,0#,!^F

"YCM
let g:ycm_confirm_extra_conf = 0

"Vundle stuff
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'scrooloose/nerdtree'
"Bundle 'klen/python-mode' 
Bundle 'davidhalter/jedi-vim'
"Bundle 'stephenmckinney/vim-solarized-powerline'

function! SwitchSourceHeader()
      "update!
    if (expand ("%:e") == "cpp")
        find %:t:r.h*
    else
        find %:t:r.cpp
    endif
endfunction
"Bindings
map <F1> :NERDTreeToggle<CR>
map <F2> :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <F4> :call SwitchSourceHeader()<CR>
map <F5> :YcmForceCompileAndDiagnostics<CR>
map <F6> :!ack <C-R><C-W><CR>
"map <F2> :YcmCompleter GoToDefinition<CR>
"map <F3> :YcmCompleter GoToDeclaration<CR>
"powerline 
if has ("gui_running")
    set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 9
endif
set laststatus=2

"python
filetype plugin indent on
augroup vimrc_autocmds
    autocmd!
    "highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
augroup END
filetype plugin on
let g:ymc_filetype_blacklist = {'python' : 1}
let g:jedi#popup_select_first = 0
let g:jedi#auto_vim_configuration = 0
