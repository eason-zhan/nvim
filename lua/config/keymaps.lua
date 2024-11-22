local keymap = vim.keymap

-- General keymaps
keymap.set('n', '<leader>q', ':q<CR>', {desc = 'Quit without saving'})
keymap.set('n', '<leader>w', ':w<CR>', {desc = 'Save file'})
keymap.set('n', '-', 'ddp', {desc = 'Swap current line with next line'})
keymap.set('n', '_', 'ddkP', {desc = 'Swap current line with prev line'})
keymap.set("n", "<leader>t", "yiw:%s/<C-r><C-W>/", {desc = 'Substitute the current word'})

-- lua-fzf
local fzf = require('fzf-lua')
keymap.set('n', '<leader>p', fzf.files, { desc = 'Fzf Files'})
keymap.set('n', '<leader>b', fzf.buffers, { desc = 'Fzf Buffers'})
keymap.set('n', '<leader>,', fzf.commands, { desc = 'Fzf Commands'})
keymap.set('n', '<leader>ag', fzf.grep_cWORD, { desc = 'Fzf Search WORD under cursor'}) -- maybe base is rg 

