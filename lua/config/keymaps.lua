local keymap = vim.keymap

-- General keymaps
keymap.set("n", "<leader>q", ":q<CR>") -- quit without saving
keymap.set("n", "<leader>w", ":w<CR>") -- save

keymap.set("n", "-", "ddp") -- Swap current line with next line
keymap.set("n", "_", "ddkP") -- Swap current line with prev line
keymap.set("n", "<leader>t", "yiw:%s/<C-r><C-W>>/") -- substitute the current word
keymap.set("n", "<leader>ag", ":Ag <C-R><C-W><CR>") -- Ag search current word

-- Telescope
keymap.set('n', '<leader>p', require('telescope.builtin').find_files, {})
keymap.set('n', '<leader>b', require('telescope.builtin').buffers, {})
keymap.set('n', '<leader>,', require('telescope.builtin').commands, {})

-- Nvim-tree
keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>") -- toggle file explorer
keymap.set("n", "<leader>er", ":NvimTreeFocus<CR>") -- toggle focus to file explorer
keymap.set("n", "<leader>ef", ":NvimTreeFindFile<CR>") -- find file in file explorer

