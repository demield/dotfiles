if !exists('g:loaded_lspsaga') | finish | endif

lua << EOF
require("lspsaga").init_lsp_saga()
EOF

nnoremap <silent> <c-j> <cmd>Lspsaga diagnostic_jump_next<cr>
nnoremap <silent> K <cmd>Lspsaga hover_doc<cr>
inoremap <silent> <c-k> <cmd>Lspsaga signature_help<cr>
nnoremap <silent> ;d <cmd>Lspsaga lsp_finder<cr>


