" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
" set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

" let skip_defaults_vim=1
syntax on


"-----------------------------------------------------插件管理(vundle)
set nocompatible " 去除VI 一致性，必须
filetype off "必须
set rtp+=/Users/stevenobelia/software/vimfiles/bundle/Vundle.vim "vundle安装地址
call vundle#begin('/Users/stevenobelia/software/vimfiles/bundle') "插件安装地址

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'python-mode/python-mode'
Plugin 'iamcco/markdown-preview.vim'

call vundle#end()            " 必须
filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本


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
exec 'cd ' . fnameescape('/Users/stevenobelia/daily-note')  
set autochdir


"-----------------------------------------------------自动缩进
set tabstop=4
set shiftwidth=4



"-----------------------------------------------------键位映射
""将F2设置为开关NERDTree的快捷键
map <f2> :NERDTreeToggle<cr>

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
			"        exec "!go build %<" exec "!time go run %" elseif &filetype == 'mkd'
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
autocmd vimenter * NERDTree	/Users/stevenobelia/daily-note
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







""-----------------------------------------------python-mode插件配置开始
"python-mode
"Turn on the whole plugin
let g:pymode = 1
"开启警告
let g:pymode_warnings = 0
"保存文件时自动删除无用空格
let g:pymode_trim_whitespaces = 1
let g:pymode_options = 1
"显示允许的最大长度的列
let g:pymode_options_colorcolumn = 1
"设置QuickFix窗口的最大，最小高度
let g:pymode_quickfix_minheight = 3
let g:pymode_quickfix_maxheight = 10
"使用python3
" let g:pymode_python = 'python3'
"使用PEP8风格的缩进
let g:pymode_indent = 1
"取消代码折叠
let g:pymode_folding = 0
"开启python-mode定义的移动方式
let g:pymode_motion = 1
"启用python-mode内置的python文档，使用K进行查找
let g:pymode_doc = 1
let g:pymode_doc_bind = 'K'
"自动检测并启用virtualenv
let g:pymode_virtualenv = 1
"不使用python-mode运行python代码
let g:pymode_run = 0
"let g:pymode_run_bind = '<Leader>r'
"不使用python-mode设置断点
let g:pymode_breakpoint = 0
"let g:pymode_breakpoint_bind = '<leader>b'
"启用python语法检查
let g:pymode_lint = 1
"修改后保存时进行检查
let g:pymode_lint_on_write = 0
"编辑时进行检查
let g:pymode_lint_on_fly = 0
let g:pymode_lint_checkers = ['pyflakes', 'pep8']
"发现错误时不自动打开QuickFix窗口
let g:pymode_lint_cwindow = 0
"侧边栏不显示python-mode相关的标志
let g:pymode_lint_signs = 0
"let g:pymode_lint_todo_symbol = 'WW'
"let g:pymode_lint_comment_symbol = 'CC'
"let g:pymode_lint_visual_symbol = 'RR'
"let g:pymode_lint_error_symbol = 'EE'
"let g:pymode_lint_info_symbol = 'II'
"let g:pymode_lint_pyflakes_symbol = 'FF'
"启用重构
let g:pymode_rope = 1
"不在父目录下查找.ropeproject，能提升响应速度
let g:pymode_rope_lookup_project = 0
"光标下单词查阅文档
let g:pymode_rope_show_doc_bind = '<C-c>d'
"项目修改后重新生成缓存
let g:pymode_rope_regenerate_on_write = 1
"开启补全，并设置<C-Tab>为默认快捷键
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 1
let g:pymode_rope_completion_bind = '<C-Tab>'
"<C-c>g跳转到定义处，同时新建竖直窗口打开
let g:pymode_rope_goto_definition_bind = '<C-c>g'
let g:pymode_rope_goto_definition_cmd = 'vnew'
"重命名光标下的函数，方法，变量及类名
let g:pymode_rope_rename_bind = '<C-c>rr'
"重命名光标下的模块或包
let g:pymode_rope_rename_module_bind = '<C-c>r1r'
"开启python所有的语法高亮
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
"高亮缩进错误
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
"高亮空格错误
let g:pymode_syntax_space_errors = g:pymode_syntax_all
"-----------------------------------------------python-mode插件配置结束
