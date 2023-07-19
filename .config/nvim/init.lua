-- Auto install Packer
local packer_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
  vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', packer_path})
  vim.api.nvim_command('packadd packer.nvim')
end

-- Load Packer
require('packer').startup(function()
    -- Interface
    use 'eemed/sitruuna.vim'
    use 'morhetz/gruvbox'
    use 'ryanoasis/vim-devicons'
    use 'vim-airline/vim-airline'
    use {'kaicataldo/material.vim', branch = 'main'}
    use 'hzchirs/vim-material'

    -- NERDTree
    use {'scrooloose/nerdtree', cmd = 'NERDTreeToggle'}
    use 'scrooloose/nerdcommenter'

    -- Languages
    use {
        'VonHeikemen/lsp-zero.nvim',
          branch = 'v1.x',
          requires = {
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'hrsh7th/cmp-buffer'},       -- Optional
            {'hrsh7th/cmp-path'},         -- Optional
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'},     -- Optional
            {'L3MON4D3/LuaSnip'},             -- Required
            {'rafamadriz/friendly-snippets'}, -- Optional
        },
    }
    use {"akinsho/toggleterm.nvim", tag = '*' }
    
    use {'fatih/vim-go', run = ':GoUpdateBinaries'}
    use 'pangloss/vim-javascript'
    use 'ruanyl/vim-fixmyjs'
    use {'ap/vim-css-color', ft = {'css', 'scss'}}

    -- Other
    use 'github/copilot.vim'
    use 'bagrat/vim-buffet'
    use 'easymotion/vim-easymotion'
    use 'ncm2/ncm2'
    use 'roxma/nvim-yarp'
    use 'ncm2/ncm2-bufword'
    use 'ncm2/ncm2-path'
    use {'mg979/vim-visual-multi', branch = 'master'}
    use 'sheerun/vim-polyglot'
    use 'jiangmiao/auto-pairs'
    use 'dense-analysis/ale'
    use 'mxw/vim-jsx'
    use 'mattn/emmet-vim'
    use 'airblade/vim-gitgutter'
    use 'editorconfig/editorconfig-vim'
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    -- FZF
    use { 'ibhagwan/fzf-lua',
      -- optional for icon support
      requires = { 'nvim-tree/nvim-web-devicons' }
    }
end)

-- Plugin configs
vim.g.go_def_mode = 'godef'
vim.g.go_info_mode = 'gopls'
vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeQuitOnOpen = 0
vim.g.palenight_terminal_italics = 1
vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1

vim.g.ale_fixers = {
  javascript = {'eslint'},
  typescript = {'eslint'},
  vue = {'eslint'},
}
vim.g.ale_fix_on_save = 1
vim.g.ale_sign_error = '>>'
vim.g.ale_sign_warning = '--'
--vim.g.ale_echo_msg_error_str = 'E'
--vim.g.ale_echo_msg_warning_str = 'W'
--vim.g.ale_echo_msg_format = '[%linter%] %s [%severity%]'
--vim.g.ale_python_flake8_options = '--max-line-length 88 --extend-ignore=E203'

vim.o.statusline = vim.o.statusline .. '%#warningmsg#'
vim.o.statusline = vim.o.statusline .. '%{SyntasticStatuslineFlag()}'
vim.o.statusline = vim.o.statusline .. '%*'

vim.g.syntastic_always_populate_loc_list = 1
vim.g.syntastic_auto_loc_list = 1
vim.g.syntastic_check_on_open = 1
vim.g.syntastic_check_on_wq = 0

vim.g.go_diagnostics_level = 2
vim.g.go_highlight_build_constraints = 1
vim.g.go_highlight_extra_types = 1
vim.g.go_highlight_fields = 1
vim.g.go_highlight_functions = 1
vim.g.go_highlight_methods = 1
vim.g.go_highlight_operators = 1
vim.g.go_highlight_structs = 1
vim.g.go_highlight_types = 1
vim.g.go_auto_type_info = 1
vim.g.go_fmt_command = "goimports"
vim.g.go_auto_type_info = 1
vim.g.go_fmt_autosave = 1

vim.g.mapleader = " "

-- start easymotion config
-- <Leader>f{char} to move to {char}
vim.api.nvim_set_keymap("n", "<leader>f", "<Plug>(easymotion-bd-f)", {})
vim.api.nvim_set_keymap("n", "<leader>f", "<Plug>(easymotion-overwin-f)", {noremap = true})

-- s{char}{char} to move to {char}{char}
vim.api.nvim_set_keymap("n", "s", "<Plug>(easymotion-overwin-f2)", {noremap = true})

-- Move to line
vim.api.nvim_set_keymap("n", "<leader>L", "<Plug>(easymotion-bd-jk)", {})
vim.api.nvim_set_keymap("n", "<leader>L", "<Plug>(easymotion-overwin-line)", {noremap = true})

-- Move to word
vim.api.nvim_set_keymap("n", "<leader>w", "<Plug>(easymotion-bd-w)", {})
vim.api.nvim_set_keymap("n", "<leader>w", "<Plug>(easymotion-overwin-w)", {noremap = true})
-- end easymotion config

vim.api.nvim_set_keymap("n", "<c-b>", ":NERDTreeToggle<cr>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>ev", ":vsplit ~/.config/nvim/init.lua<cr>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>sv", ":source ~/.config/nvim/init.lua<cr>", {noremap = true})

vim.api.nvim_set_keymap("n", "<leader>d", ":Fixmyjs<cr>", {noremap = true})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>p', builtin.find_files, {})
vim.keymap.set('n', '<leader><S-p>', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
-- vim.api.nvim_set_keymap("n", "<leader>p", ":FzfLua files<cr>", {noremap = true})
-- vim.api.nvim_set_keymap("n", "<leader>b", ":FzfLua buffers<cr>", {noremap = true})
-- vim.api.nvim_set_keymap("n", "<leader><S-p>", ":Ag .<cr>", {noremap = true})


if vim.fn.has('nvim') == 1 then
  vim.o.termguicolors = true
  vim.g.NVIM_TUI_ENABLE_TRUE_COLOR = 1
end

-- LSP
local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'zls', -- Zig
  'volar', -- Vue
  'gopls', -- Golang
  'tsserver', -- Typescript
  'html', -- HTML
  'cssls', -- CSS
  'jsonls', -- Json
  'yamlls', -- YAML
  'emmet_ls', -- emmet-ls
})

lsp.set_preferences({
  sign_icons = {}
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
end)

lsp.default_keymaps({buffer = bufnr})
--lsp.format_on_save({
  --servers = {
    --['prettier'] = {'typescript'},
    --['volar'] = {'vue'},
    --['gopls'] = {'go'},
  --}
--})

lsp.setup()

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		signs = false,
		virtual_text = true,
		underline = false,
	}
)

vim.o.background = 'dark'
vim.cmd('colorscheme gruvbox')

vim.cmd("autocmd BufWritePre * :lua vim.lsp.buf.format()")
vim.api.nvim_command("autocmd BufEnter * call ncm2#enable_for_buffer()")
vim.cmd("command! CleanReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor")
vim.api.nvim_command("autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab")

vim.o.nocompatible = true
vim.o.ttyfast = true
vim.o.lazyredraw = true

vim.wo.relativenumber = false
vim.o.title = true
vim.o.mouse = "a"
vim.o.clipboard = "unnamedplus"
vim.o.path = vim.o.path .. "$(pwd)/**"
vim.o.encoding = "UTF-8"
vim.bo.sts = 2
vim.bo.ts = 2
vim.bo.smartindent = true
vim.bo.autoindent = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.bo.sw = 2
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.ruler = true
vim.o.completeopt = "noinsert,menuone,noselect"
vim.bo.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.title = true
vim.wo.list = true
vim.wo.cursorline = true
vim.o.mouse = "a"
vim.o.wrap = false
vim.o.hidden = true
vim.wo.number = true
vim.o.inccommand = "split"
vim.o.foldmethod = "indent"
vim.o.foldlevelstart = 50
vim.o.autoread = true
vim.o.updatetime = 300
vim.o.t_ZH = "\27[3m"
vim.o.t_ZR = "\27[23m"
