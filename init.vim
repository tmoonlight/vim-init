"======================================================================
"
" init.vim - initialize config
"
" Created by skywind on 2018/05/30
" Last Modified: 2018/05/30 18:26:34
"
"======================================================================

" 防止重复加载
if get(s:, 'loaded', 0) != 0
	finish
else
	let s:loaded = 1
endif

" 取得本文件所在的目录
let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')

" 定义一个命令用来加载文件
command! -nargs=1 LoadScript exec 'so '.s:home.'/'.'<args>'

" 将 vim-init 目录加入 runtimepath
exec 'set rtp+='.s:home

" 将 ~/.vim 目录加入 runtimepath (有时候 vim 不会自动帮你加入）
set rtp+=~/.vim

let mapleader=","

"====================================================================
"---------------------------------
"class generator
"---------------------------------
"
function! Class(ClassName)
let header = a:ClassName.".h"
":vsp %:h/.h
:execute 'vsp' header
call append(0,"#ifndef ".toupper(a:ClassName)."_H")
call append(1,"#define ".toupper(a:ClassName)."_H")
call append(2," ")
call append(3,"class ".a:ClassName )
call append(4, "{")
call append(5, " public:")
call append(6, " ".a:ClassName."();")
call append(7, " virtual ~".a:ClassName."();")
call append(8, " protected:")
call append(9, " private:")
call append(10, "};")
call append(11,"#endif // ".toupper(a:ClassName)."_H")
:execute 'write' header
let src = a:ClassName.".cpp"
":vsp %:h/.cpp
:execute 'vsp' src
call append(0,"#include \"".a:ClassName.".h\"")
call append(1," ")
call append(2,a:ClassName."::".a:ClassName."()")
call append(3,"{")
call append(4,"//ctor ")
call append(5,"}")
call append(6," ")
call append(7," ")
call append(8,a:ClassName."::~".a:ClassName."()")
call append(9,"{")
call append(10,"//dtor ")
call append(11,"}")
:execute 'write' src
endfunction


"
"----------------------------------------------------------------------
" 模块加载
"----------------------------------------------------------------------

" 加载基础配置
LoadScript init/init-basic.vim

" 加载扩展配置
LoadScript init/init-config.vim

" 设定 tabsize
LoadScript init/init-tabsize.vim

" 插件加载
LoadScript init/init-plugins.vim

" 界面样式
LoadScript init/init-style.vim

" 自定义按键
LoadScript init/init-keymaps.vim



