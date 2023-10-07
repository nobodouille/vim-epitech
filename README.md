# vim-epitech

Vim plugin for Epitech students.


## Installation

### Vim-plug

```vim
Plug 'drawbu/vim-epitech'
```

### Packer

```vim
use "drawbu/vim-epitech"
```

### lazy.nvim

```vim
{ "drawbu/vim-epitech" }
```

## Recommanded settings

Depending on where your are/when you are from, your EPITECH may follow different
guidelines following code style.

```vim
" Show line and column on the bottom right
set ruler

" Identation settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent

" Set unix format for carriage returns
set fileformat=unix
```

## Thanks

This project started as a clone of 
[HelifeWasTAken/vim-epitech](https://github.com/HelifeWasTaken/vim-epitech), 
which is more of a vim distro, a ready to go vim config than an actual plugin.
So this was not the best for student with already a Vim config, and some of the
settings are deprecated (i.e. `syntax on` is hardcoded in the config, but this
settings is forbidden in some Epitech, like Bordeaux, during the C Pool).

This is the current goal of this project: turning the old config into a plugin
that students can install on both Neovim and Vim with a plugin manager like
Vim-plug or LazyNvim.


## Author

[Clément BOILLOT](https://github.com/drawbu)
