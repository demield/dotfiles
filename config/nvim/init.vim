syntax on
set encoding=utf-8
set nobackup
set nowritebackup
set path+=**
set noshowmode
set showmatch
set lazyredraw
set laststatus=2
set updatetime=300
set number relativenumber
set cursorline
set tabstop=2 shiftwidth=2 expandtab
set ignorecase smartcase
set wildmode=longest,list,full
set colorcolumn=80
set mouse=a
set clipboard+=unnamedplus
set shortmess+=c
set termguicolors
set statusline=%1*\ %-2.3{toupper(mode())}%*
set statusline+=%2*\ %<%f%=\ %y\ %m\ [%{FugitiveStatusline()}]\ [%n]\ %r\ %h\ [%l,%c]%*

set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

let mapleader="\<Space>"
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_winsize=25
let g:netrw_chgwin=1

au BufWritePost init.vim source %
au BufWritePre * %s/\s\+$//e
au BufNewFile,BufRead *.axaml setf xml

inoremap jk <Esc>

" nnoremap <Leader>e :Lex!<CR>
nnoremap ; :
nnoremap <Leader>d :bn\|bd #<CR>
nnoremap <Leader>k :bnext<CR>
nnoremap <Leader>j :bprevious<CR>
nnoremap <Leader>b :buffers<CR>
nnoremap <Leader>h :split<Space>
nnoremap <Leader>v :vsplit<Space>
nnoremap <Leader>l :tabnext<CR>
nnoremap <Leader>h :tabprevious<CR>
nnoremap <Leader>c :tabclose<CR>
nnoremap <Leader>t :tabnew<Space>

call plug#begin('~/.config/nvim/plugged')
  Plug 'tomasr/molokai'
  Plug 'terminalnode/sway-vim-syntax'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'dense-analysis/ale'
  Plug 'neovim/nvim-lspconfig'
  Plug 'kabouzeid/nvim-lspinstall'
call plug#end()

colorscheme molokai
highlight User1 term=bold cterm=bold ctermfg=green
highlight User2 term=bold cterm=bold ctermbg=white ctermfg=black
highlight CursorLine cterm=bold
highlight Visual ctermbg=white cterm=bold
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight Normal guibg=none
highlight NonText guibg=none

lua << EOF
  local nvim_lsp = require('lspconfig')

  local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
  end

  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    nvim_lsp[server].setup{
      on_attach = on_attach,
      flags = {
        debounce_text_changes = 150,
      }
    }
  end
EOF

