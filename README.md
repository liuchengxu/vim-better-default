# vim-better-default

There are some general settings for convenience in almost everyone's `.vimrc` file. Let's shorten your `.vimrc` and make the default vim better.

## Installation

This plugin can be installed with a varity of plugin managers, such as:

- [Vundle](https://github.com/VundleVim/Vundle.vim)
    - `Plugin 'liuchengxu/vim-better-default`
- [Plug](https://github.com/junegunn/vim-plug)
    - `Plug 'liuchengxu/vim-better-default`

## Options

- `vim_better_default_minimum`

- `vim_better_default_key_mapping`
    - `vim_better_default_basic_key_mapping`
    - `vim_better_default_window_key_mapping`
    - `vim_better_default_buffer_key_mapping`
    - `vim_better_default_fold_key_mapping`

For example, if you want to exclude key mappings in [vim-beter-default](https://github.com/liuchengxu/vim-better-default), just set the value as 0.

```
let g:vim_better_default_key_mapping = 0
```

For more details, please see the [default.vim](https://github.com/liuchengxu/vim-better-default/blob/master/plugin/default.vim). Don't worry. It is extremely simple and just part of your own `.vimrc` file alike.

You can also fork [vim-beter-default](https://github.com/liuchengxu/vim-better-default) and modify `plugin/default.vim` for more customization.

### License
MIT
