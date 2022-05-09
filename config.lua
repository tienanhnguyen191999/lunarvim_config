-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = false
lvim.colorscheme = "onedarker"

lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- User Config for predefined plugins
lvim.builtin.alpha.active = true
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.filters.dotfiles = true
lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.treesitter.ensure_installed = "all"
lvim.builtin.treesitter.highlight.enabled = true
lvim.lsp.diagnostics.virtual_text = false
vim.opt.list = true
vim.opt.listchars = "tab:→/,trail:~,space:·"
vim.opt.cmdheight = 1

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

-- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { exe = "flake8", filetypes = { "python" } },
  { exe = "shellcheck", args = { "--severity", "warning" }, },
  { exe = "codespell" },
}

-- Additional Plugins
lvim.plugins = {
    {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install'},
    {"ggandor/lightspeed.nvim", event = "BufRead"},
    {"tpope/vim-surround"},
    {"tpope/vim-repeat"},
    {"terryma/vim-multiple-cursors"}
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
  { "BufWinEnter", "*.js", "let @l = \"yoconsole.log('jkpla, jkpl\"" },
  { "BufWinEnter", "*.py", "let @l = \"yoprint('jkpla, jkpl\"" },
  { "BufWinEnter", "*.php", "setlocal ts=4 sw=4" },
  { "BufWinEnter", "*.js", "setlocal ts=2 sw=2" },
  { "BufWinEnter", "*.vue", "setlocal ts=2 sw=2" },
  { "VimEnter", "*", "highlight WhiteSpace guifg=#3B3E3D guibg=None" },
}
