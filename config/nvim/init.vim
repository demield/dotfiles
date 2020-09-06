syntax on
set encoding=utf-8
set path+=**
set noshowmode
set laststatus=2
set number relativenumber
set cursorline cursorcolumn
set tabstop=4 shiftwidth=4 expandtab
set ignorecase smartcase
set wildmode=longest,list,full
set colorcolumn=80
set mouse=a
set clipboard+=unnamedplus

let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_winsize=25


set statusline=%1*\ %-2.3{toupper(mode())}%*
set statusline+=%2*\ %<%f%=\ %y\ %m\ [%n]\ %r\ %h\ [%l,%c]%*

highlight User1 term=bold cterm=inverse,bold ctermfg=7
highlight User2 term=bold cterm=bold ctermbg=0 ctermfg=7

highlight CursorLine ctermbg=Black cterm=bold
highlight CursorColumn ctermbg=Black cterm=bold


autocmd BufWritePost init.vim source %
autocmd BufWritePre * %s/\s\+$//e

autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), '&filetype') == 'netrw' || &buftype == 'quickfix' |q|endif

" Custom function for opening new files
" Opens new file inside window on the left of netrw instead of netrw window
function! CustomNetrwFileOpen()
    let fname = input('Enter filename: ')
    if exists('b:netrw_curdir')
        let curdir = b:netrw_curdir
        wincmd t
        if curdir =~ '/$'
            exe "e ".fnameescape(curdir.fname)
        else
            exe "e ".fnameescape(curdir.'/'.fname)
        endif
        unlet curdir
    endif
    unlet fname
endfunction

function! NetrwMappings()
    noremap <buffer><silent>% :call CustomNetrwFileOpen()<CR>
endfunction

augroup NetrwGroup
    autocmd!
    autocmd filetype netrw call NetrwMappings()
augroup END

function! ToggleNetrw()
    silent Lex!
    wincmd h
endfunction

augroup ProjectDrawer
    autocmd!
    autocmd VimEnter * :call ToggleNetrw()
augroup END


let mapleader=' '

nnoremap <Leader>bd :bdelete<CR>
nnoremap <Leader>bn :bnext<CR>
nnoremap <Leader>bp :bprevious<CR>
nnoremap <Leader>bb :buffers<CR>

nnoremap <Leader>h :split<Space>
nnoremap <Leader>v :vsplit<Space>

nnoremap <Leader>e :Lex!<CR>


call plug#begin('~/.config/nvim/plugged')
    Plug 'tpope/vim-commentary'
    Plug 'prabirshrestha/vim-lsp'
    Plug 'mattn/vim-lsp-settings'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'
    Plug 'prabirshrestha/asyncomplete.vim'
call plug#end()

let g:lsp_settings_servers_dir='~/.local/share/vim-lsp/servers'

inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr><CR> pumvisible() ? "\<C-y>" : "\<CR>"
imap <C-Space> <Plug>(asyncomplete_force_refresh)

