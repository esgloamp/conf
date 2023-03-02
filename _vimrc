" Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

let $PYTHONHOME = 'C:/Users/nongzhipeng/AppData/Local/Programs/Python/Python39/'

call plug#begin()
Plug 'mhinz/vim-startify'
Plug 'preservim/nerdtree'
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'tracyone/fzf-funky',{'on': 'FzfFunky'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/tagbar'
Plug 'artur-shaik/vim-javacomplete2'
call plug#end()


set nu
set relativenumber
set encoding=utf-8
set guifont=Ubuntu_Mono_derivative_Powerline:h12,Go_Mono_Nerd_Font_Complete:h12,Consolas:h12
set clipboard+=unnamed
colorscheme monokai
set t_Co=256

"air-line config
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
let g:airline#extensions#tabline#enabled = 1 "顶部tab显示"
let g:airline_section_b = airline#section#create(['branch'])

"tagbar
nmap <tab> :bn<CR>

"NERDTree
nmap <C-p> :NERDTree<CR>

"jcomplete2
