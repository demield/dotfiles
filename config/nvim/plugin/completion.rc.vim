if !exists('g:loaded_completion') | finish | endif

set completeopt=menuone,noinsert,noselect

inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

let g:completion_matching_strategy_list = [ "exact", "substring", "fuzzy" ]
let g:completion_chain_complete_list = {
      \ "default" : {
      \   "default": [
      \     { "complete_items": [ "lsp", "snippet" ] },
      \     { "mode": "<c-p>" },
      \     { "mode": "<c-n>" }, ],
      \   "comment": []
      \   }
      \}

