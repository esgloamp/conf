"显示行号"
set number

"突出当前行"
set cursorline

"启用鼠标"
set mouse=a
set selection=exclusive
set selectmode=mouse,key

"显示括号匹配"
set showmatch

set langmenu=zh_CN.UTF-8

"设置自动缩进长度为4个空格"
set shiftwidth=4

"tab转换为4空格"
set expandtab
set tabstop=4

"设置编码"
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

"显示空格和tab键"
set listchars=tab:>-,trail:-

"总是显示状态栏"
set laststatus=2

"显示光标当前位置"
set ruler

"call plug#begin('~/.vim/autoload/Plug.vim')
"Plug 'ayu-theme/ayu-vim'
"set termguicolors
"let ayucolor="light"
"let ayucolor="mirage"
"let ayucolor="dark"
"colorscheme ayu

"call plug#end()           

"括号补全"    
inoremap( ()<LEFT>
inoremap[ []<LEFT>
inoremap{ {}<LEFT>
inoremap< <><LEFT>
inoremap" ""<LEFT>
inoremap' ''<LEFT>
inoremap/* /**/<LEFT><LEFT>
inoremap` ``<LEFT>

"每当更改文本，保存缓冲区"
autocmd TextChanged, TextChangedI <buffer> silent write

"总是显示文件全路径"
set statusline+=%f
