vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.g.mapleader= " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
    lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local opts = {}
local plugins = {
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    }
}

require("lazy").setup(plugins, opts)
require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"

local builtin = require('telescope.builtin')
vim.keymap.set({'n', 'i', 'v'} , '<D-p>', function()
    builtin.find_files({
        hidden = true,
        previewer = true,
        file_ignore_patterns = {
            "node_modules/",
            "%.git/",
            "vendor/",
            "storage/",
            "dist/",
            "coverage/",
            "public/",
            "build/"
        }
    })
end, {})

vim.keymap.set({'n', 'i', 'v'}, '<D-S-f>', function()
  builtin.live_grep({
    hidden = true,
    previewer = true,
    file_ignore_patterns = {
      "node_modules/",
      "%.git/",
      "vendor/",
      "storage/",
      "dist/",
      "coverage/",
      "public/",
      "build/"
    }
  })
end, {})

local config = require("nvim-treesitter.configs")
config.setup({
    ensure_installed = {"lua", "javascript", "typescript", "php"},
    highlight = { enable = true },
    indent = { enable = true }
})

require("nvim-tree").setup({
  view = {
    side = "right",   -- Open tree on the right side
    width = 30,       -- Adjust width as needed
  }
})
vim.wo.number = true

-- Sync OS & Neovim clipboard
vim.o.clipboard = "unnamedplus"

vim.o.ignorecase = true
vim.o.smartcase = true

-- Keymaps
vim.keymap.set({'n', 'i', 'v'}, '<D-S-e>', '<cmd>NvimTreeToggle<CR>', {})
vim.keymap.set({'n', 'i', 'v'}, '<leader>cp', ':let @+ = expand("%:p")<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', { noremap = true, silent = true })
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', { noremap = true, silent = true })
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<D-.>', ':vsplit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<D-/>', ':split<CR>', { noremap = true, silent = true })

local toggle_terminal = require('toggle_terminal')

vim.api.nvim_set_keymap('n', '<D-j>', ':lua require("toggle_terminal").toggle()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<D-j>', '<C-\\><C-n>:lua require("toggle_terminal").toggle()<CR>', { noremap = true, silent = true })


