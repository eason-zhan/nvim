local keymap = vim.keymap

local function cmd(command)
  return table.concat({'<cmd>', command, '<CR>'})
end

-- General keymaps
keymap.set('n', '<leader>q', ':q<CR>', {desc = 'Quit without saving'})
keymap.set('n', '<leader>w', ':w<CR>', {desc = 'Save file'})
keymap.set('n', '<leader>s', ':w<CR>', {desc = 'Save file'})
keymap.set('n', '-', 'ddp', {desc = 'Swap current line with next line'})
keymap.set('n', '_', 'ddkP', {desc = 'Swap current line with prev line'})
keymap.set("n", "<leader>t",
  "yiw:%s/\\<<C-r><C-W>\\>/", -- \\<, \\> word boundaries;
                              -- <C-r> (Control + r) is used to insert the contents of a register in command-line mode,
                              -- <C-W> represents the word that was just yanked.
  {desc = 'Substitute the current word'})

local function sub_case()
  local word = vim.fn.expand("<cword>")
  local new_word = require("config.utils").toggle_case(word)
  print(string.format("%s -- %s", word, new_word))
  local s = (":%%s/%s/%s/g"):format(word, new_word)
  print(s)
  vim.cmd(s)
end

keymap.set("n", "<leader>tt", sub_case, {desc = 'Substitute the current word'})

-- nvim-tree
keymap.set("n", "<leader>e",  ":NvimTreeToggle<CR>", { desc = 'Toggle file explorer' })
keymap.set("n", "<leader>es", ":NvimTreeFindFile<CR>", {desc = 'Sync to opened file in explorer'})

-- nivm aerial -- tag
keymap.set("n", "<leader>a", "<cmd>Outline<CR>", { desc = "Toggle Outline" })

-- vim easy align
keymap.set('n', 'ga', '<Plug>(EasyAlign)', { noremap = false, silent = true })
keymap.set('v', 'ga', '<Plug>(EasyAlign)', { noremap = false, silent = true })

-- lua-fzf
local fzf = require('fzf-lua')
keymap.set('n', '<leader>p', fzf.files, { desc = 'Fzf Files'})
keymap.set('n', '<leader>b', fzf.buffers, { desc = 'Fzf Buffers'})
keymap.set('n', '<leader>h', fzf.command_history, { desc = 'Command History'})
keymap.set('n', '<leader>,', fzf.commands, { desc = 'Fzf Commands'})
keymap.set('n', '<leader>ag', fzf.grep_cword, { desc = 'Fzf Search WORD under cursor'}) -- maybe base is rg
keymap.set('n', 'gra', fzf.lsp_code_actions, { desc = "Lsp Code Actions"})
keymap.set('n', 'grr', fzf.lsp_references, { desc = "Lsp References"})
keymap.set('n', 'gri', fzf.lsp_implementations, { desc = "Lsp Implementations"})
keymap.set('n', 'grd', fzf.lsp_definitions, { desc = "Lsp Definitions"})

-- Windows maximizer
keymap.set('n', '<C-w>z', cmd 'WindowsMaximize', {desc = 'Toggle Maximize'})
keymap.set('n', '<C-w>_', cmd 'WindowsMaximizeVertically')
keymap.set('n', '<C-w>|', cmd 'WindowsMaximizeHorizontally')
keymap.set('n', '<C-w>=', cmd 'WindowsEqualize')

local function toggle_case()
    local word = vim.fn.expand("<cword>")
    local new_word = require("config.utils").toggle_case(word)
    local current_line = vim.fn.getline(".")
    print(string.format("%s -- %s", word, new_word))
    local new_line = current_line:gsub(word, new_word)
    vim.fn.setline('.', new_line)
end

keymap.set('n', '<leader>cs', toggle_case, {desc = 'Toggle convert snake_case to camelCase'})


-- -- Codecompanion
-- keymap.set('v', '<leader>ce', "", {
--   callback = function()
--     require("codecompanion").prompt("explain")
--   end,
--   noremap = true,
--   silent = true,
--   desc = "Code Explain"
-- })
-- Don't use <c-a> for CodeCompanionActions because it is use for number acc
-- keymap.set("n", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
-- keymap.set("v", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
-- keymap.set("n", "<LocalLeader>a", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
-- keymap.set("v", "<LocalLeader>a", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
-- keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })
--
-- -- Expand 'cc' into 'CodeCompanion' in the command line
-- vim.cmd([[cab cc CodeCompanion]])
