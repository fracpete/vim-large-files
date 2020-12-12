# vim-large-files
Vim plugin that makes viewing/editing of large files a bit more efficient,
as it turns off syntax highlighting and reduces the number of undos.

# Installation
Simply copy this plugin into your plugin directory. (See 'plugin' in the
Vim User Manual.) Additionally, you may choose to override one of the
following global variables, which are used by this plugin, in your vimrc
file:

* LargeFile  (default: 1024*1024*5)

  The file size in bytes beyond which a file is considered large.

For example, you could have something like this in your `.vimrc` file:

```
let LargeFile = 1024 * 1024 * 2
```

