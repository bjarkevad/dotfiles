"Vundle 
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
"Bundle 'Valloric/YouCompleteMe'
Bundle 'gerw/vim-latex-suite'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'scrooloose/nerdtree'
Bundle 'davidhalter/jedi-vim'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'tomasr/molokai'
Bundle 'derekwyatt/vim-scala'

set encoding=utf-8
set termencoding=utf-8
set nocompatible
set ignorecase
set autochdir
set number
set autoread
set nohlsearch
set incsearch

"syntax
filetype plugin on
filetype plugin indent on
syntax on

"colorscheme
colorscheme molokai
"let g:molokai_original=1
let g:rehash256=1
set background=dark

"splits
set splitbelow
set splitright

"tab
set tabstop=4
set shiftwidth=4
set expandtab
set cindent
set smartindent
set autoindent
set cinkeys=0{,0},:,0#,!^F

" trailing whitespace
"set list
"set listchars=tab:>-,trail:-

"Bindings
map <F1> :NERDTreeToggle<CR>
map <F2> :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <F4> :call SwitchSourceHeader()<CR>
map <F6> :YcmForceCompileAndDiagnostics<CR>
map <F7> :!ack <C-R><C-W><CR>
"map <F2> :YcmCompleter GoToDefinition<CR>
"map <F3> :YcmCompleter GoToDeclaration<CR>

"powerline 
if has ("gui_running")
    set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 9
    set lines=55 columns=165
endif
set laststatus=2

"Switch between C++ header/source
function! SwitchSourceHeader()
      "update!
    if (expand ("%:e") == "cpp")
        find %:t:r.h*
    else
        find %:t:r.cpp
    endif
endfunction

"octave
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

"Latex
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='pdf, aux'

"YCM
let g:ycm_confirm_extra_conf = 0

"python
filetype plugin indent on
augroup vimrc_autocmds
    autocmd!
    "highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
    "autocmd FileType python IPython
augroup END
filetype plugin on
let g:ymc_filetype_blacklist = {'python' : 1}
let g:jedi#popup_select_first = 0
let g:jedi#auto_vim_configuration = 0
