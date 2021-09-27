if !exists('g:loaded_telescope') | finish | endif

nnoremap <silent> ;f <cmd>Telescope find_files<cr>
nnoremap <silent> ;g <cmd>Telescope live_grep<cr>
nnoremap <silent> ;b <cmd>Telescope buffers<cr>
nnoremap <silent> ;t <cmd>Telescope help_tags<cr>

lua << EOF
local actions = require("telescope.actions")
require("telescope").setup({
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  }
})
EOF

