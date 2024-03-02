" Configuración Basica
set number
set relativenumber
set tabstop=4
set shiftwidth=4
colorscheme desert

" Plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'

 " Barra de estado
Plug 'nvim-lualine/lualine.nvim'

call plug#end()
