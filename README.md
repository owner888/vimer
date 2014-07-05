========================== 13:09 2014-07-04 杨泽涛 ==============================
1、更改为pathogen管理插件模式
2、增加插件自动更新vundle

========================== 13:09 2014-07-04 杨泽涛 ==============================
1、zencoding插件更新，并改名为emmet
http://www.vim.org/scripts/script.php?script_id=2981

2、网上说打开历史文件的插件MRU和NDRE_tree插件有冲突，反正从来没用过，去掉吧
http://www.vim.org/scripts/script.php?script_id=521

3、拷贝文件路径插件copypath
http://www.vim.org/scripts/script.php?script_id=1456
用法：
拷贝文件路劲
:CopyPath
拷贝文件名
:CopyFileName

4、缩进对齐线插件indentLine
http://www.vim.org/scripts/script.php?script_id=4354

========================== 10:47 2013-09-27 杨泽涛 ==============================
1、解决Vim7.4下PHP注释无法变灰色，很难看
删除 .vim/syntax/php.vim

========================== 12:54 2012-08-27 杨泽涛 ==============================
1、增加session会话保存，连NERD_tree打开的侧边栏都能记录，相当霸气
保存会话 :SaveSession project1
打开会话 :OpenSession project1
2、cscope代码跟踪，需安装 cscope 命令，比ctags 强大很多
光标位于要跟踪的函数处，ctrl+] 跟踪，ctrl+t 或者ctrl+o 返回

========================== 3:28 2012-08-18 杨泽涛 ==============================
1、修复svn升级到1.7不在根目录下无法提交bug
2、增加连续敲击键盘mm跳转到最后一次编辑的地方,和NERD_tree的mm有冲突
3、snippets增加两个快捷函数
pri -> echo '<pre>';print_r($value);echo '</pre>; 
var -> var_dump($value);

========================== 13:51 2011-08-17 杨泽涛 ==============================
1.替换AutoComplPop为neocomplcache 代码自动补全
2.增加快速编写html代码插件 zencoding
3.把html当作xml来编辑，解决html代码按=号无法格式化问题
au FileType smarty,html set ft=xml

========================== 11:58 2011-08-09 杨泽涛 ==============================
1.增加python代码补齐提示
/pydiction

========================== 17:00 2011-05-12 杨泽涛 ==============================
1.修改smarty注释{**}为<{**}>
编辑 plugin/NERD_commenter.vim
搜索 smarty 即可找到修改

2.增加自动补全代码快 smarty foreach
编辑 snippets/smarty.snippets

3.增加自动补全代码快 php try
编辑 snippets/php.snippets

========================== 03:30 2011-03-01 杨泽涛 ==============================
1.重新配置，去掉一些没用的配置，现在在终端下面使用molokai样式并且开启256色不会卡了

2.去掉closetag.vim，开启自己写的闭合功能，感觉够用了
cd plugin
mv closepair.vim.bak closepair.vim

========================== 21:42 2011-01-11 杨泽涛 ==============================
1.增加closetag.vim，实现html自动闭合
下载地址：http://www.vim.org/scripts/script.php?script_id=13
网友增强：http://kenshin54.javaeye.com/blog/858156

2.关闭之前自己写的闭合功能
cd plugin
mv closepair.vim closepair.vim.bak

3.修复taglist插件 Tlist_Refresh_Folds报错
编辑 plugin/taglist.vim
参考：http://www.kukaka.org/home/showonews/371

========================== 15:20 2010-12-23 杨泽涛 ==============================
1、解决source路径问题
把自定义键盘映射配置移至 vimfiles/plugin/MY_keymap.vim
把自定义taglist配置移至 vimfiles/plugin/MY_taglist.vim

2、增加snipMate插件，实现按tab键代码块补全
下载地址：http://www.vim.org/scripts/script.php?script_id=2540

3、增加tab键smarty代码块补全
复制 vimfiles/snippets/html.snippets 到 vimfiles/snippets/smarty.snippets

4、修改tab键php代码块补全 所有大括号换行，符合自己的开发习惯
修改 vimfiles/snippets/php.snippets

5、增加NERDTree插件，实现目录和文件导航
下载地址：http://www.vim.org/scripts/script.php?script_id=1658

6、增加taglist插件，实现代码导航
下载地址：http://www.vim.org/scripts/script.php?script_id=273
taglist插件需要依赖ctags程序才能工作，目前常用的ctags版本是Exuberant Ctags
下载地址：http://ctags.sourceforge.net/

7、增加PDV phpDocumentor for vim插件，实现类和函数注释
下载地址：http://www.vim.org/scripts/script.php?script_id=1355

8、增加AutoComplPop插件，实现自动弹出补全菜单
下载地址：http://www.vim.org/scripts/script.php?script_id=1879

9、增加样式vimfiles/colors/molokai.vim


