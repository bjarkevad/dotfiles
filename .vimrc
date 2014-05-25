"Vundle 
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
"Bundle 'altercation/vim-colors-solarized'
"Bundle 'Valloric/YouCompleteMe'
Bundle 'gerw/vim-latex-suite'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'scrooloose/nerdtree'
"Bundle 'davidhalter/jedi-vim'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'tomasr/molokai'
Bundle 'derekwyatt/vim-scala'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
Bundle 'eagletmt/neco-ghc'
Bundle 'bitc/vim-hdevtools'
Bundle 'Shougo/neocomplcache'

set encoding=utf-8
set termencoding=utf-8
set nocompatible
set ignorecase
set autochdir
set relativenumber
set number
set autoread
set nohlsearch
set incsearch
set nojoinspaces

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
"map <F2> :YcmCompleter GoToDefinitionElseDeclaration<CR>
"map <F4> :call SwitchSourceHeader()<CR>
"map <F6> :YcmForceCompileAndDiagnostics<CR>
"map <F7> :!ack <C-R><C-W><CR>
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

"Turn relativenumbers on and off
function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

" Haskell
map <silent> <Leader>e :Errors<CR>
map <Leader>s :SyntasticToggleMode<CR>
let g:syntastic_auto_loc_list=1

"ghc-mod
map <silent> tu :call GHC_BrowseAll()<CR>
map <silent> tw :call GHC_ShowType(1)<CR>

"hdevtools
au FileType haskell nnoremap <buffer> <F3> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F5> :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <silent> <F4> :HdevtoolsInfo<CR>

" Tagbar
nmap <F2> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" neco-ghc
let g:acp_enableAtStartup = 0
"let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return neocomplcache#smart_close_popup() . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
"g:necoghc_enable_detailed_browse = 1
let g:neocomplcache_enable_at_startup = 1

" pointfree
autocmd BufEnter *.hs set formatprg=pointfree

" hasktags
let g:tagbar_type_haskell = {
    \ 'ctagsbin'  : 'hasktags',
    \ 'ctagsargs' : '-x -c -o-',
    \ 'kinds'     : [
        \  'm:modules:0:1',
        \  'd:data: 0:1',
        \  'd_gadt: data gadt:0:1',
        \  't:type names:0:1',
        \  'nt:new types:0:1',
        \  'c:classes:0:1',
        \  'cons:constructors:1:1',
        \  'c_gadt:constructor gadt:1:1',
        \  'c_a:constructor accessors:1:1',
        \  'ft:function types:1:1',
        \  'fi:function implementations:0:1',
        \  'o:others:0:1'
    \ ],
    \ 'sro'        : '.',
    \ 'kind2scope' : {
        \ 'm' : 'module',
        \ 'c' : 'class',
        \ 'd' : 'data',
        \ 't' : 'type'
    \ },
    \ 'scope2kind' : {
        \ 'module' : 'm',
        \ 'class'  : 'c',
        \ 'data'   : 'd',
        \ 'type'   : 't'
    \ }
\ }

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
"let g:Tex_MultipleCompileFormats='pdf, aux'
let g:Tex_GotoError=0
let g:Tex_ShowErrorContext = 0

"YCM
"let g:ycm_confirm_extra_conf = 0

"python
"filetype plugin indent on
"augroup vimrc_autocmds
"    autocmd!
"    "highlight characters past column 120
"    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
"    autocmd FileType python match Excess /\%120v.*/
"    autocmd FileType python set nowrap
"    "autocmd FileType python IPython
"augroup END
"filetype plugin on
"let g:ymc_filetype_blacklist = {'python' : 1}
"let g:jedi#popup_select_first = 0
"let g:jedi#auto_vim_configuration = 0
