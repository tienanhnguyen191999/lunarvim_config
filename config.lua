--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = false
lvim.colorscheme = "onedarker"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.insert_mode["jk"] = "<Esc>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"

lvim.builtin.treesitter.ensure_installed = "all"
lvim.builtin.treesitter.highlight.enabled = true
lvim.lsp.diagnostics.virtual_text = false
lvim.builtin.notify.active = false
vim.opt.list = true
vim.opt.listchars = "tab:→/,trail:~,space:·"
vim.opt.cmdheight = 1

-- Change theme settings
lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false


-- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { exe = "black", filetypes = { "python" } },
  { exe = "isort", filetypes = { "python" } },
  {
    exe = "prettier",
    args = { "--print-with", "100" },
    filetypes = { "typescript", "typescriptreact", "vue", 'javascript', 'html', 'css' },
  },
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { exe = "flake8", filetypes = { "python" } },
  { exe = "codespell" },
}

lvim.plugins = {
  { "iamcco/markdown-preview.nvim", run = "cd app && npm install",
    setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, },
  { "ggandor/lightspeed.nvim", event = "BufRead" },
  { "tpope/vim-surround" },
  { "tpope/vim-repeat" },
  { "terryma/vim-multiple-cursors" },
  { "lunarvim/Onedarker.nvim" },
}

vim.api.nvim_create_autocmd("VimEnter", { pattern = "*", command = "highlight WhiteSpace guifg=#3B3E3D guibg=None", })
vim.api.nvim_create_autocmd("BufWinEnter", { pattern = "*.php", command = "let @l = \"yoconsole.log('jkpla, jkpA;\"", })
vim.api.nvim_create_autocmd("BufWinEnter", { pattern = "*.php", command = "let @l = \"yodd('jkpla, jkpA;\"", })
vim.api.nvim_create_autocmd("BufWinEnter", { pattern = "*.php", command = "setlocal ts=4 sw=4", })
vim.api.nvim_create_autocmd("BufWinEnter", { pattern = "*.js", command = "setlocal ts=4 sw=4", })
vim.api.nvim_create_autocmd("BufWinEnter", { pattern = "*.vue", command = "setlocal ts=2 sw=2", })
