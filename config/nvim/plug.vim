
call plug#begin('~/.config/nvim/plugged')
  Plug 'tomasr/molokai'
  Plug 'terminalnode/sway-vim-syntax'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-lua/completion-nvim'
  Plug 'nvim-treesitter/completion-treesitter'
  Plug 'kabouzeid/nvim-lspinstall'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'folke/lsp-colors.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-lua/popup.nvim'
call plug#end()

