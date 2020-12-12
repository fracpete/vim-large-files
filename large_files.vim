" Vim plugin that makes viewing/editing of large files more efficient.
"
" Maintainer: Peter Reutemann <fracpete at gmail dot com>
"
" Description:
" This plugin makes viewing/editing of large files a bit more efficient,
" as it turns off syntax highlighting and reduces the number of undos.
"
" Installation:
" Simply copy this plugin into your plugin directory. (See 'plugin' in the
" Vim User Manual.) Additionally, you may choose to override one of the
" following global variables, which are used by this plugin, in your vimrc
" file:
"
"  - LargeFile  (default: 1024*1024*5)
"       The file size in bytes beyond which a file is considered large.
"
" For example, you could have something like this in your vimrc file:
"   let LargeFile = 1024 * 1024 * 2
"
" Version: 0.0.1

" file is larger from 5mb
let g:LargeFile = 1024 * 1024 * 5
augroup LargeFile 
 autocmd BufReadPre * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
augroup END

function LargeFile()
 " no syntax highlighting etc
 set eventignore+=FileType
 " save memory when other file is viewed
 setlocal bufhidden=unload
 " is read-only (write with :w new_filename)
 "setlocal buftype=nowrite
 " no undo possible
 setlocal undolevels=5
 " display message
 autocmd VimEnter *  echo "The file is larger than " . (g:LargeFile / 1024 / 1024) . " MB, so some options are changed (see .vim/plugin/large_files.vim for details)."
endfunction
