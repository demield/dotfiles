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
set tabstop=4 shiftwidth=4 expandtab
set ignorecase smartcase
set wildmode=longest,list,full
set colorcolumn=80
set mouse=a
set clipboard+=unnamedplus
set shortmess+=c
set termguicolors
set statusline=%1*\ %-2.3{toupper(mode())}%*
set statusline+=%2*\ %<%f%=\ %y\ %m\ [%n]\ %r\ %h\ [%l,%c]%*

let mapleader="\<Space>"
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_winsize=25
let g:netrw_chgwin=1
let g:coc_explorer_global_presets = {
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   }
\ }
let g:leader_f_handlers = []

call plug#begin('~/.config/nvim/plugged')
    Plug 'morhetz/gruvbox'
    Plug 'tomasr/molokai'
    Plug 'tpope/vim-commentary'
    Plug 'terminalnode/sway-vim-syntax'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
call add(g:leader_f_handlers, "call CocAction('format')")

colorscheme molokai
highlight User1 term=bold cterm=bold ctermfg=green
highlight User2 term=bold cterm=bold ctermbg=white ctermfg=black
highlight CursorLine cterm=bold
highlight Visual ctermbg=white cterm=bold
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight Normal guibg=none
highlight NonText guibg=none

function! RunHandlers(handler_list, default_action)
    for handler in a:handler_list
        execute handler
    endfor
    execute a:default_action
endfunction

function! InsertBlankLine()
    normal mz
    normal Go
    normal `z
    %s/\n\{3,}/\r/e
endfunction

function! s:CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

function! s:ShowDocumentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

autocmd BufWritePost init.vim source %
autocmd BufWritePre * %s/\s\+$//e
autocmd CursorHold * silent call CocActionAsync('highlight')

inoremap jk <Esc>
inoremap <silent><expr><Tab> pumvisible() ? "\<C-n>" :
    \ <SID>CheckBackspace() ? "\<Tab>" : coc#refresh()
inoremap <expr><S-Tab> pumvisible() ? '\<C-p>' : '\<C-h>'
inoremap <silent><expr><C-Space> coc#refresh()
if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

nnoremap <Leader>d :bn\|bd #<CR>
nnoremap <Leader>] :bnext<CR>
nnoremap <Leader>[ :bprevious<CR>
nnoremap <Leader>bb :buffers<CR>
nnoremap <Leader>h :split<Space>
nnoremap <Leader>v :vsplit<Space>
nnoremap <silent> K :call <SID>ShowDocumentation()<CR>
nnoremap <Leader>e :CocCommand explorer --toggle --preset floatingRightside<CR>

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <leader>f  :call RunHandlers(g:leader_f_handlers, "call InsertBlankLine()")<CR>

