-- Leader must be set before keys.vim defines any <leader> mapping.
vim.g.mapleader = ' '

vim.cmd('source $HOME/.config/nvim/vim-plug/plugins.vim')
vim.cmd('source $HOME/.config/nvim/vim-plug/conf.vim')
vim.cmd('source $HOME/.config/nvim/keys/keys.vim')

vim.cmd.colorscheme "iceberg"


-- Editor basics. signcolumn stays open so the text does not shift sideways the
-- moment a gitsign or a diagnostic appears.
vim.o.clipboard = 'unnamedplus'
vim.o.scrolloff = 8
vim.o.signcolumn = 'yes'
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.splitright = true
vim.o.splitbelow = true

-- nvim only ships indent settings for some filetypes. python and markdown get
-- their own, lua and javascript fall through to tabs at width 8 without this.
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2

-- gofmt writes tabs, so go opts back out.
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'go',
  callback = function() vim.bo.expandtab = false end,
})

-- Replaces vim-highlightedyank, which nvim absorbed as vim.hl.on_yank.
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function() vim.hl.on_yank({ timeout = 200 }) end,
})


-- Claude Code writes files from the tmux pane next door. Reload what changed
-- on disk, and keep undo across sessions so its edits stay revertible.
vim.o.autoread = true
vim.o.undofile = true
vim.o.updatetime = 300

vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'CursorHold', 'TermLeave' }, {
  command = 'if mode() != "c" | checktime | endif',
})

vim.api.nvim_create_autocmd('FileChangedShellPost', {
  command = 'echohl WarningMsg | echo "buffer reloaded from disk" | echohl None',
})


-- Autocompletion. Snippets are expanded by vsnip, which is also the cmp source.
local cmp = require("cmp")
local select_opts = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
    ['<Down>'] = cmp.mapping.select_next_item(select_opts),

    ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
    ['<C-n>'] = cmp.mapping.select_next_item(select_opts),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),

    ['<Tab>'] = cmp.mapping(function(fallback)
      local col = vim.fn.col('.') - 1

      if cmp.visible() then
        cmp.select_next_item(select_opts)
      elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        fallback()
      else
        cmp.complete()
      end
    end, {'i', 's'}),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item(select_opts)
      else
        fallback()
      end
    end, {'i', 's'}),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "vsnip" },
  },
  formatting = {
    format = require("lspkind").cmp_format({
      with_text = true,
      menu = {
        nvim_lsp = "[LSP]",
      },
    }),
  },
})


-- LSP. nvim-lspconfig only ships the per-server defaults in its lsp/ dir now;
-- vim.lsp.enable() reads them off the runtimepath. No require('lspconfig').
vim.lsp.config('*', {
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

vim.lsp.config('elixirls', {
  cmd = { vim.fn.expand('~/stuffs/elixir-ls/release/language_server.sh') },
  settings = {
    elixirLS = {
      -- dialyzer off on purpose, and dep fetching gets the .elixir_ls dir into
      -- a state that needs deleting and restarting the editor.
      dialyzerEnabled = false,
      fetchDeps = false,
    },
  },
})

-- ts_ls and biome both claim to format typescript. biome owns it, it is the
-- project's own tool and reads its biome.json. lspconfig runs the copy in
-- node_modules, so there is nothing global to install for it.
vim.lsp.config('ts_ls', {
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
})

-- ruff = lint + format (reads [tool.ruff] from the project's pyproject.toml),
-- ty = types. rust_analyzer comes from rustup, the rest are on PATH.
vim.lsp.enable({ 'ruff', 'ty', 'gopls', 'lua_ls', 'elixirls',
                 'rust_analyzer', 'ts_ls', 'biome' })

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local opts = { buffer = ev.buf, silent = true }
    -- K, grn, gra, grr, gri, grt and insert-mode <C-s> are 0.11+ defaults.
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'df', function() vim.lsp.buf.format() end, opts)
    vim.keymap.set('n', 'sl', vim.diagnostic.open_float, opts)
  end,
})

-- virtual_text is off by default since 0.11, so errors were gutter-only. Not
-- virtual_lines: that draws below the cursor line, where precognition already is.
vim.diagnostic.config({ virtual_text = true })

-- Format on write for the tauri stack, rustfmt through rust_analyzer and biome
-- for the frontend. The other languages still format on demand with df.
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { '*.rs', '*.ts', '*.js', '*.css', '*.json' },
  callback = function() vim.lsp.buf.format() end,
})


require'nvim-treesitter.configs'.setup {
  -- markdown_inline is separate from markdown on purpose: the main grammar does
  -- block structure, the inline one does emphasis, links and inline code.
  ensure_installed = {"elixir", "python", "bash", "javascript", "typescript", "go", "json",
                      "html", "css", "rust", "toml", "markdown", "markdown_inline"},
  sync_install = false,
  ignore_install = { },
  indent = {enable = true},
  highlight = {
    enable = true,
    disable = { },
  },
}

-- Renders headings, code blocks, tables and checkboxes in place. The line the
-- cursor sits on un-renders itself, so the file stays editable.
require('render-markdown').setup({})

-- cs"' changes the surrounding quotes, ysiw( wraps a word, ds( unwraps. The
-- operator half of what ci" does.
require('nvim-surround').setup({})

-- Faint marks on the current line showing where w, b, e, 0 and $ land.
-- The f/F/t/T target marks sit a shade dimmer, so the word motions read first.
-- 0 outranks ^ because ^ is a dead key on the Latin American layout. They target
-- the same column on an unindented line, and the higher prio is the one drawn.
require('precognition').setup({
  startVisible = true,
  targetedMotionHighlightColor = { link = 'LineNr' },
  hints = {
    Caret = { text = '^', prio = 1 },
    Zero = { text = '0', prio = 2 },
  },
})

-- Configs loading of LSP.
require"fidget".setup{}

-- Python debugger. dap-virtual-text draws each variable's current value at the
-- end of its line while stopped, and needs its own setup call to do anything.
require('dap-python').setup('~/.local/share/virtualenvs/debugpy/bin/python')
require('nvim-dap-virtual-text').setup({})

local dap = require('dap')
vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint)
vim.keymap.set('n', '<leader>dc', dap.continue)
vim.keymap.set('n', '<leader>ds', dap.step_over)
vim.keymap.set('n', '<leader>di', dap.step_into)
vim.keymap.set('n', '<leader>do', dap.step_out)
vim.keymap.set('n', '<leader>dq', dap.terminate)

-- Git signs, plus the hunk-review maps for going over what an agent changed.
require('gitsigns').setup({
  on_attach = function(bufnr)
    local gs = require('gitsigns')
    local map = function(l, r) vim.keymap.set('n', l, r, { buffer = bufnr }) end
    map(']c', function() gs.nav_hunk('next') end)
    map('[c', function() gs.nav_hunk('prev') end)
    map('<leader>hp', gs.preview_hunk)
    map('<leader>hr', gs.reset_hunk)
    map('<leader>hd', gs.diffthis)
  end,
})
