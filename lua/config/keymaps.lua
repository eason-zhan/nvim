-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.g.mapleaer = ","

local keymap = vim.keymap

keymap.set("n", "<leader>q", ":q<CR>") -- quit
keymap.set("n", "<leader>s", ":w<CR>") -- save
keymap.set("n", "-", "ddp") -- Swap current line with next line
keymap.set("n", "_", "ddkP") -- Swap current line with prev line
