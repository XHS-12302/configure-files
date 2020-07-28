" Configuration file for vim


syntax on
set nocompatible " 去除VI 一致性，必须
filetype off "必须

" No swap file
set nobackup
set nowb
set noswapfile


"-----------------------------------------------------插件管理(vundle)
set rtp+=~/.vim/bundle/Vundle.vim "vundle安装地址
call vundle#begin('~/.vim/bundle') "插件安装地址

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'w0rp/ale'
Plugin 'python-mode/python-mode'
Plugin 'altercation/vim-colors-solarized'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'suan/vim-instant-markdown'

call vundle#end()            " 必须
filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本
filetype plugin on

"-----------------------------------------------------编码
set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1
if has("win32")
set fileencoding=chinese
else
set fileencoding=utf-8
endif
"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"解决consle输出乱码
language messages zh_CN.utf-8


"-----------------------------------------------------窗口
" 设置启动位置，窗口大小及配色
"winpos 635 335
"set lines=35 columns=130 
"colo evening 
set autoindent 


"-----------------------------------------------------根目录
"自动设当前编辑的文件所在目录为当前工作路径
"注意，命令的执行顺序不能改变
exec 'cd ' . fnameescape('~/daily-note')  
set autochdir


"-----------------------------------------------------自动缩进
set tabstop=4
set shiftwidth=4



"-----------------------------------------------------键位映射
""将F2设置为开关NERDTree的快捷键
map <f2> :NERDTreeToggle<cr>
" markdown 一键预览
map <F1> :InstantMarkdownPreview<CR>
"一键运行代码
map <F5> :call CompileRunGcc()<CR>
    func! CompileRunGcc()
        exec "w"
		if &filetype == 'c'
			exec "!g++ % -o %<"
			exec "!time ./%<"
		elseif &filetype == 'cpp'
			exec "!g++ % -o %<"
			exec "!time ./%<"
		elseif &filetype == 'java'
			exec "!javac %"
			exec "!time java %<"
		elseif &filetype == 'sh'
			:!time bash %
		elseif &filetype == 'python'
			exec "!time python %"
		elseif &filetype == 'html'
			exec "!firefox % &"
		elseif &filetype == 'go'
			exec "!go build %<" 
			exec "!time go run %" 
		elseif &filetype == 'mkd'
			exec "!~/.vim/markdown.pl % > %.html &"
			exec "!firefox %.html &"
		endif
	endfunc




""-----------------------------------------------NERDTree插件配置开始
" NerdTree才插件的配置信息
""vim启动时自动打开NERDTree
"autocmd vimenter * NERDTree
""
autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd vimenter * NERDTree	~/daily-note
autocmd vimenter * NERDTreeToggle
""修改树的显示图标
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
""窗口位置
let g:NERDTreeWinPos='left'
""窗口尺寸
let g:NERDTreeSize=30
""窗口是否显示行号
let g:NERDTreeShowLineNumbers=1
""不显示隐藏文件
let g:NERDTreeHidden=0
""------------------------------------------------nerdtree插件配置结束


" python-mode
let g:pymode_indent = 1
let g:pymode_folding = 1
let g:pymode_motion = 1
let g:pymode_trim_whitespaces = 1
let g:pymode_options_max_line_length = 79
let g:pymode_options_colorcolumn = 1
let g:pymode_doc_bind = 'K'

" color scheme
colorscheme solarized

" markdown
let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0
let g:instant_markdown_browser = "chrome --new-window"

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %



