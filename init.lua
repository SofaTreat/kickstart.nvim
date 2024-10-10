----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
-- [[ Setting options ]]
-- See `:help vim.opt`
--  For more options, you can see `:help option-list`

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

--TOMS SETTINGS
vim.opt.tabstop     = 4
vim.opt.shiftwidth  = 4
vim.opt.softtabstop = 4
vim.opt.expandtab   = true
vim.opt.autoindent  = true
vim.opt.smartindent  = true

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true
vim.opt.breakindentopt = { 'shift:2', 'sbr' }
vim.opt.linebreak = true
vim.opt.wrap = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase  = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace in the editor.
--  See :help 'list'
--  and :help 'listchars'
vim.opt.list = false
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true
--vim.opt.cursorcolumn = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 8

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true

--setting the new powershell as the default terminal that opens up.
vim.o.shell = "pwsh.exe"

--vim.cmd(':set syn-iskeyword-=_')

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

--turns off the long sentence warnings 
vim.diagnostic.config({ virtual_text = false, underline = false, })

-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<leader>h', '<C-w><C-h>', { desc = "which_key_ignore" })
vim.keymap.set('n', '<leader>l', '<C-w><C-l>', { desc = "which_key_ignore" })
vim.keymap.set('n', '<leader>j', '<C-w><C-j>', { desc = "which_key_ignore" })
vim.keymap.set('n', '<leader>k', '<C-w><C-k>', { desc = "which_key_ignore" })

vim.keymap.set('n', '<leader>sj', ':.cc<CR>', { desc = "which_key_ignore" })

vim.keymap.set("n", "<leader>cw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'replace Word in buffer.' })
vim.keymap.set("n", "<leader>cs", ':set spell<CR>', { desc = 'set spelling mode.' })
vim.keymap.set("n", "<leader>cj", 'z=', { desc = 'check spelling of a word. (spelling mode needs to be on.)' })
vim.keymap.set("n", "<leader>cm", '_vf=hylA<C-r>=<C-r>"<CR>', { desc = "calulate expression." })
vim.keymap.set("v", "<leader>cu", 'U', { desc = "change case. ( U also does this. )" })
vim.keymap.set("n", "<leader>cg", "g<C-g>", { desc = 'gets the word count.'})

vim.keymap.set("n", "cv", "ct_", { desc = 'cut to next underscore.'})
vim.keymap.set("n", "cV", "lcT_", { desc = 'cut to last underscore.'})

vim.keymap.set("n", "L", "vg_",    { desc = "Select to end of line" })

vim.keymap.set({'n', 'v'}, 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })
vim.keymap.set({'n', 'v'}, 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })

--select all
vim.keymap.set('n', '<leader>a', 'ggVG',{ desc = 'Select all.' })

--spliting out documents.
vim.keymap.set('n', '<leader>dl',  ':vsplit<CR>',{ desc = 'vSplit doc right.' })
vim.keymap.set('n', '<leader>dj',  ':split<CR>', { desc = 'Split doc down.' })
vim.keymap.set('n', '<leader>dd',  '<C-w>c', { desc = 'deletes buffer at current split.' })
vim.keymap.set('n', '.',           ':b#<CR>',    { desc = 'Returns to previous buffer.' })

vim.keymap.set('n', '<BACKSPACE>', '<C-d>zz', { desc = 'half page down.' })
vim.keymap.set('n', '<ENTER>',     '<C-u>zz', { desc = 'half page up.' })
vim.keymap.set({ 'n', 'v' }, '<leader><ENTER>', '$', { desc = 'End of line.' })

vim.keymap.set('n', '<leader>z', ':ZenMode<CR>',{ desc = 'Zen mode.' })

--repeat quickly repeat the q macro. 
vim.keymap.set('n', ',', '@q')
--paste the q macro on a new line to edit
vim.keymap.set('n', 'qp', 'o<ESC>"qp')
--yank the macro back up
vim.keymap.set('n', 'qy', '_"qy$ddk')

vim.keymap.set('n', '<leader>cc', '_o{}<ESC>i<CR><ESC>$i<CR><ESC>ki<tab>', {desc = 'create brackets after below current line'})

vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'writes the file.' })

vim.keymap.set('n', '<leader>se', "<CMD>Oil<CR>", { desc = 'Opens the file explorer.' })
--vim.keymap.set('n', '<leader>se', vim.cmd.Ex, { desc = 'Opens the file explorer.' })

--moving lines up and down when in visual mode.
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
--TERMINAL STUFF
--
local term_buf = nil

--opening a terminal at file location.
vim.keymap.set('n', '<leader>tt', function() 
        --No existing terminal, create a new one
        if term_buf == nil or not vim.api.nvim_buf_is_loaded(term_buf) then
            vim.api.nvim_command("terminal")
            vim.api.nvim_command("startinsert")
            term_buf  = vim.api.nvim_get_current_buf()
            return
        end
        -- In a non-terminal, go to the most recent terminal
        vim.api.nvim_set_current_buf(term_buf)
    end,
    { desc = 'open a [T]erminal.' }
)

vim.keymap.set('n', '<leader>tf', ':lcd %:h <CR>', { desc = 'set the [T]erminal dir to the current file location' })
vim.keymap.set('n', '<leader>ty', ':wall | vsplit   | terminal<CR> i ./run.ps1<CR><C-\\><C-n>G', { desc = 'open a Terminal right and Run.'})
vim.keymap.set('n', '<leader>tg', ':wall | bo 15 sp | terminal<CR> i ./run.ps1<CR><C-\\><C-n>G', { desc = 'open a Terminal down and Run.' })

--
--This function will only close the split down if its a terminal.
vim.keymap.set('n', '<leader>te', function()
    vim.cmd('wincmd j')
    vim.cmd('wincmd l')
    if (vim.fn.getbufvar(vim.fn.bufnr('%'), '&buftype') == 'terminal') then
        vim.cmd(':bd!')
    end
end,
    { desc = '[E]xits the terminal on the right.' }
)

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
--for lualine to add a clock.
local function clock_component()
    return vim.fn.strftime("%H:%M")
end
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
-- [[ Basic Autocommands ]]
--  See :help lua-guide-autocommands

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

----------------------------------------------------------------------------------------------------
-- lua function that holds the cursor position when I close a file
local group = vim.api.nvim_create_augroup("jump_last_position", { clear = true })
vim.api.nvim_create_autocmd( "BufReadPost", {
    callback = function()
        local row, col = unpack(vim.api.nvim_buf_get_mark(0, "\""))
        if {row, col} ~= {0, 0} then
            vim.api.nvim_win_set_cursor(0, {row, col})
        end
    end,
    group = group,
})
----------------------------------------------------------------------------------------------------
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.api.nvim_set_hl(0, "TabLine", { bg = "none" })
		vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none" })
		vim.api.nvim_set_hl(0, "TabLineSelect", { bg = "none" })
		vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
	end,
})
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
--
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

----------------------------------------------------------------------------------------------------
-- [[this is where you install plugins]]
require('lazy').setup {
    -----------------------------------------------------------------------------------------------
    --{'tpope/vim-sleuth'}, -- Detect tabstop and shiftwidth automatically
    -----------------------------------------------------------------------------------------------
    -- "gc" to comment visual regions/lines
    { 'numToStr/Comment.nvim', opts = {} },
    -----------------------------------------------------------------------------------------------
    {
        'lewis6991/gitsigns.nvim',
        -- Adds git related signs to the gutter, as well as utilities for managing changes
        opts = {
            signs = {
                add          = { text = '+' },
                change       = { text = '~' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '~' },
            },
            --signcolumn = false,
        },
    },
    -----------------------------------------------------------------------------------------------
    {
        'folke/which-key.nvim',
        -- Useful plugin to show you pending keybinds.
        event = 'VeryLazy', -- Sets the loading event to 'VeryLazy'
        config = function() -- This is the function that runs, AFTER loading
            require('which-key').setup(
                --{ ignore_missing = true, }
            )
            -- Document existing key chains
            require('which-key').add{
                { "<leader>c", group = "[C]ode" },
                { "<leader>c_", hidden = true },
                { "<leader>d", group = "[D]ocument" },
                { "<leader>d_", hidden = true },
                { "<leader>r", group = "[R]ename" },
                { "<leader>r_", hidden = true },
                { "<leader>s", group = "[S]earch" },
                { "<leader>s_", hidden = true },
                { "<leader>t", group = "[T]erminal" },
                { "<leader>t_", hidden = true },
            }


        end,
    },
    -----------------------------------------------------------------------------------------------
    {
        'nvim-tree/nvim-web-devicons',
        config = function()
            require('nvim-web-devicons').setup({
                color_icons = false,
                override = {
                    ["default_icon"] = {
                        color = '#AAAAAA',
                        name = "Default",
                    }
                }
            })
        end
    },
    -----------------------------------------------------------------------------------------------
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {},
        -- stylua: ignore
        keys = {
            { "<leader><leader>", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            --{ "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            --{ "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            --{ "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        },
    },
    -----------------------------------------------------------------------------------------------
    {
        'nvim-telescope/telescope.nvim',
        -- Fuzzy Finder (files, lsp, etc)
        event = 'VeryLazy',
        branch = '0.1.x',
        dependencies = {

            { 'nvim-lua/plenary.nvim' },

            { -- If encountering errors, see telescope-fzf-native README for install instructions
                'nvim-telescope/telescope-fzf-native.nvim',

                -- `build` is used to run some command when the plugin is installed/updated.
                -- This is only run then, not every time Neovim starts up.
                build = 'make',

                -- `cond` is a condition used to determine whether this plugin should be
                -- installed and loaded.
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },

            { 'nvim-telescope/telescope-ui-select.nvim' },

            { 'nvim-tree/nvim-web-devicons' },

            { 'debugloop/telescope-undo.nvim' },
        },

        config = function()
            --  :Telescope help_tags
            -- Two important keymaps to use while in telescope are:let g:dracula_colorterm = 1
            --  - Insert mode: <c-/>
            --  - Normal mode: ?
            -- See `:help telescope` and `:help telescope.setup()`
            require('telescope').setup {
                extensions = {
                    ['ui-select'] = {
                        require('telescope.themes').get_dropdown(),
                    },
                    undo = { },
                },
            }

            --telescope undo-tree
            require("telescope").load_extension("undo")
            vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>", { desc = "undo-tree."})

            -- Enable telescope extensions, if they are installed
            pcall(require('telescope').load_extension, 'fzf')
            pcall(require('telescope').load_extension, 'ui-select')

            -- See `:help telescope.builtin`
            local builtin = require 'telescope.builtin'
            vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
            vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })

            --vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
            --edited to exclude certain file types.
            vim.keymap.set('n', '<leader>sf',
                function()
                    require("telescope.builtin").find_files({
                        file_ignore_patterns = {
                            ".*yy$",
                            ".*png$",
                            ".*psd$",
                            ".*wav$",
                            ".*jpg$",
                            ".*atlas$",
                            ".*mp3$",
                            ".*clip$",
                        },
                        hidden = true,
                    })
                end,
                { desc = '[S]earch [F]iles' }
            )

            vim.keymap.set('n', '<leader>ss',
                function()
                    local word = vim.fn.expand("<cword>")
                    builtin.grep_string({ search = word })
                end,
            { desc = '[S]earch cword'})

            vim.keymap.set('n', '<leader>st', builtin.builtin, { desc = '[S]earch [T]elescope' })
            vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
            vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
            vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
            vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
            vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })

            vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = '[ ] [S]earch existing buffers' })

           vim.keymap.set('n', '<leader>/',
                function()
                    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                        winblend = 10,
                        previewer = false,
                    })
                end,
                { desc = '[/] Fuzzily search in current buffer' }
            )

            --  See `:help telescope.builtin.live_grep()` for information about particular keys
            vim.keymap.set('n', '<leader>s/',
                function()
                    builtin.live_grep {
                        grep_open_files = true,
                        prompt_title = 'Live Grep in Open Files',
                    }
                end,
                { desc = '[S]earch [/] in Open Files' }
            )

            -- Shortcut for searching your neovim configuration files
            vim.keymap.set('n', '<leader>sn', function()
                builtin.find_files { cwd = vim.fn.stdpath 'config' }
            end, { desc = '[S]earch [N]eovim files' })

            -- Shortcut for searching your neovim configuration files
            vim.keymap.set('n', '<leader>si', function()
                builtin.find_files { cwd = 'c:\\dump\\dump-code\\text\\' }
            end, { desc = '[S]earch [N]eovim files' })
        end,
    },
    -----------------------------------------------------------------------------------------------
    {
        'neovim/nvim-lspconfig',
        -- LSP Configuration & Plugins
        dependencies = {
            -- Automatically install LSPs and related tools to stdpath for neovim
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'WhoIsSethDaniel/mason-tool-installer.nvim',

            { 'j-hui/fidget.nvim', opts = {} },
        },

        config = function()
            -- and elegantly composed help section, :help lsp-vs-treesitter

            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
                callback = function(event)
                    local map = function(keys, func, desc)
                        vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
                    end

                    map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
                    map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
                    map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
                    map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
                    map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
                    map('<leader>dS', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[D]ocuments [S]ymbols')
                    map('K', vim.lsp.buf.hover, 'Hover Documentation')
                    map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

                    -- Rename the variable under your cursor
                    --  Most Language Servers support renaming across files, etc.
                    map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

                    -- Execute a code action, usually your cursor needs to be on top of an error
                    -- or a suggestion from your LSP for this to activate.
                    map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

                    -- When you move your cursor, the highlights will be cleared (the second autocommand).
                    local client = vim.lsp.get_client_by_id(event.data.client_id)
                    if client and client.server_capabilities.documentHighlightProvider then
                        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                            buffer = event.buf,
                            callback = vim.lsp.buf.document_highlight,
                        })

                        vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                            buffer = event.buf,
                            callback = vim.lsp.buf.clear_references,
                        })
                    end
                end,
            })

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

            local servers = {
                clangd = {},

                glsl_analyzer = {
                    filetypes = { 'glsl', 'fsh', 'vsh', },
                },

                lua_ls = {
                    settings = {
                        Lua = {
                            runtime = { version = 'LuaJIT' },
                            workspace = {
                                checkThirdParty = false,
                                library = {
                                    '${3rd}/luv/library',
                                    unpack(vim.api.nvim_get_runtime_file('', true)),
                                },
                                -- If lua_ls is really slow on your computer, you can try this instead:
                                -- library = { vim.env.VIMRUNTIME },
                            },
                            -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
                            -- diagnostics = { disable = { 'missing-fields' } },
                        },
                    },
                },
            }

            --  You can press `g?` for help in this menu
            require('mason').setup()

            -- You can add other tools here that you want Mason to install
            -- fo you, so that they are available from within Neovim.
            local ensure_installed = vim.tbl_keys(servers or {})
            vim.list_extend(ensure_installed, {
                'stylua', -- Used to format lua code
            })

            require('mason-tool-installer').setup { ensure_installed = ensure_installed }

            require('mason-lspconfig').setup {
                handlers = {
                    function(server_name)
                        local server = servers[server_name] or {}
                        require('lspconfig')[server_name].setup {
                            cmd = server.cmd,
                            settings = server.settings,
                            filetypes = server.filetypes,
                            capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {}),
                        }
                    end,
                },
            }
        end,
    },
    -----------------------------------------------------------------------------------------------
    {
        'hrsh7th/nvim-cmp',
        -- Autocompletion
        event = 'InsertEnter',
        dependencies = {
            {
                'L3MON4D3/LuaSnip',
                build = (function()
                    if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then return
                    end
                    return 'make install_jsregexp'
                end)(),
            },

            'saadparwaiz1/cmp_luasnip',

            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',

            'rafamadriz/friendly-snippets',
        },

        config = function()
            local cmp = require 'cmp'
            local luasnip = require 'luasnip'
            luasnip.config.setup {}

            cmp.setup {
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                completion = { completeopt = 'menu,menuone,noinsert' },

                -- No, but seriously. Please read `:help ins-completion`, it is really good!
                mapping = cmp.mapping.preset.insert {

                    ['<C-j>'] = cmp.mapping.select_next_item(),
                    ['<C-k>'] = cmp.mapping.select_prev_item(),
                    ['<C-y>'] = cmp.mapping(
                        cmp.mapping.confirm { 
                            behavior = cmp.ConfirmBehavior.Insert,
                            select = true 
                        },
                        {"i", "c" }
                    ),

                    -- Manually trigger a completion from nvim-cmp.
                    ['<C-Space>'] = cmp.mapping.complete {},

                    -- <c-l> will move you to the right of each of the expansion locations.
                    -- <c-h> is similar, except moving you backwards.
                    ['<C-l>'] = cmp.mapping(function()
                        if luasnip.expand_or_locally_jumpable() then
                            luasnip.expand_or_jump()
                        end
                    end, { 'i', 's' }),
                    ['<C-h>'] = cmp.mapping(function()
                        if luasnip.locally_jumpable(-1) then
                            luasnip.jump(-1)
                        end
                    end, { 'i', 's' }),
                },
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'path' },
                    { name = 'buffer' },
                },
            }
        end,
    },
    -----------------------------------------------------------------------------------------------
    {
        'hrsh7th/cmp-cmdline',
        config = function()

            local cmp = require 'cmp'

            cmp.setup.cmdline('/', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            })

            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path '}
                },
                {
                    {
                        name = 'cmdline',
                        option = {
                            ignore_cmds = {'Man', '!'}
                        }
                    }
                })
            })
        end
    },
    -----------------------------------------------------------------------------------------------
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("harpoon").setup()

            local harpoon = require("harpoon")
            vim.keymap.set("n", "<A-m>", function() harpoon:list():add() end, { desc = "harpoon add" })
            vim.keymap.set("n", "<A-n>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "harpoon menu" })

            vim.keymap.set("n","<A-h>" , function() harpoon:list():select(1) end, { desc = "select 1" })
            vim.keymap.set("n","<A-j>" , function() harpoon:list():select(2) end, { desc = "select 2" })
            vim.keymap.set("n","<A-k>" , function() harpoon:list():select(3) end, { desc = "select 3" })
            vim.keymap.set("n","<A-l>" , function() harpoon:list():select(4) end, { desc = "select 4" })
            vim.keymap.set("n","<A-;>" , function() harpoon:list():select(5) end, { desc = "select 5" })

            -- Toggle previous & next buffers stored within Harpoon list
            --vim.keymap.set("n", "<leader>np", function() harpoon:list():prev() end)
            --vim.keymap.set("n", "<leader>nn", function() harpoon:list():next() end)
        end,
    },
    -----------------------------------------------------------------------------------------------
    {
        "slugbyte/lackluster.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            local lackluster = require("lackluster")
            lackluster.setup({
                tweak_syntax = {
                    string = '#959085',
                    string_escape = '#999985',
                    comment = '#587848', -- or gray5
                    builtin = lackluster.color.lack,
                    type = '#959290',
                    keyword = lackluster.color.lack, 
                    keyword_return = lackluster.color.lack, 
                    keyword_exception = lackluster.color.blue,
                },
                tweak_background = {
                    normal = 'none',
                    telescope = 'none',
                    menu = 'none',
                    popup = 'none',
                },
            })
            vim.cmd.colorscheme 'lackluster'
        end,
    },
    -----------------------------------------------------------------------------------------------
    {
        'folke/tokyonight.nvim',
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require("tokyonight").setup({
                style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
                light_style = "night", -- The theme is used when the background is set to light
                transparent = true, -- Enable this to disable setting the background color
                terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
                styles = {
                    -- Style to be applied to different syntax groups
                    -- Value is any valid attr-list value for `:help nvim_set_hl`
                    comments = { italic = true },
                    keywords = { italic = true },
                    functions = {},
                    variables = {},
                    -- Background styles. Can be "dark", "transparent" or "normal"
                    sidebars = "transparent", -- style for sidebars, see below
                    floats = "transparent", -- style for floating windows
                },
                sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
                day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
                hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
                dim_inactive = false, -- dims inactive windows
                lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold
            })
            --vim.cmd.colorscheme 'tokyonight-night'
            --vim.cmd.hi 'Comment gui=none'
        end,
    },
    -----------------------------------------------------------------------------------------------
    --zen mode, keymap set to leader z 
    { "folke/zen-mode.nvim", opts = { window = {width = 95,} } },
    -----------------------------------------------------------------------------------------------
    -- Highlight todo, notes, etc in comments
    { 'folke/todo-comments.nvim', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
    -----------------------------------------------------------------------------------------------
    {
        'echasnovski/mini.nvim',
        config = function()
            -- Better Around/Inside textobjects
            --
            -- Examples:
            --  - va)  - [V]isually select [A]round [)]parenthen
            --  - yinq - [Y]ank [I]nside [N]ext [']quote
            --  - ci'  - [C]hange [I]nside [']quote
            require('mini.ai').setup { n_lines = 500 }

            require("mini.indentscope").setup({
                symbol = "│",
                animation = 2,
            })

            require('mini.indentscope').gen_animation.none()

            -- Add/delete/replace surroundings (brackets, quotes, etc.)
            --
            -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
            -- - sd'   - [S]urround [D]elete [']quotes
            -- - sr)'  - [S]urround [R]eplace [)] [']
            require('mini.surround').setup()
            require('mini.align').setup()
            --  Check out: https://github.com/echasnovski/mini.nvim
        end,
    },
    -----------------------------------------------------------------------------------------------
    {
        -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

            ---@diagnostic disable-next-line: missing-fields
            require('nvim-treesitter.configs').setup {
                ensure_installed = { 'bash', 'c', 'html', 'lua', 'markdown', 'vim', 'vimdoc' },
                -- Autoinstall languages that are not installed
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
            }

            --    - Incremental selection: Included, see :help nvim-treesitter-incremental-selection-mod
            --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
        end,
    },
    -----------------------------------------------------------------------------------------------
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup(
            {
                options = {
                    --theme =  "tokyonight",
                    theme =  "lackluster",
                    globalstatus = true,
                },
                sections = {
                    lualine_c = {
                        {
                            'filename',
                            file_status = true,      -- Displays file status (readonly status, modified status)
                            newfile_status = false,  -- Display new file status (new file means no write after created)
                            path = 3,                -- 0: Just the filename
                        }
                    },
                    lualine_y = {'location'},
                    lualine_z = {clock_component,}
                }
            })
        end,
    },
    -----------------------------------------------------------------------------------------------
    --this is the thing that hangs the if or for or setup or whatever at the top of the screen.
    {
        'nvim-treesitter/nvim-treesitter-context',
        config = function()
            require'treesitter-context'.setup{
                enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
                max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
                min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
                line_numbers = true,
                multiline_threshold = 1, -- Maximum number of lines to show for a single context
                trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
                mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
                -- Separator between context and content. Should be a single character string, like '-'.
                -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
                separator = nil,
                zindex = 20, -- The Z-index of the context window
                on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
            }
        end
    },
    -----------------------------------------------------------------------------------------------
    { 'JafarDakhan/vim-gml' },
    -----------------------------------------------------------------------------------------------
    { 'ahayworth/ink-syntax-vim' },
    -----------------------------------------------------------------------------------------------
    { 'ThePrimeagen/vim-be-good' },
    -----------------------------------------------------------------------------------------------
    {
        'stevearc/oil.nvim',
        opts = {},
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("oil").setup({
                default_file_explorer = true,
                keymaps = {
                    ["g?"] = "actions.show_help",
                    ["<CR>"] = "actions.select",
                    ["<leader>dl"] = "actions.select_vsplit",
                    ["<leader>dj"] = "actions.select_split",
                    ["<C-t>"] = "actions.select_tab",
                    ["<C-p>"] = "actions.preview",
                    ["<ESC>"] = "actions.close",
                    ["<C-l>"] = "actions.refresh",
                    ["-"] = "actions.parent",
                    ["_"] = "actions.open_cwd",
                    ["`"] = "actions.cd",
                    ["~"] = "actions.tcd",
                    ["gs"] = "actions.change_sort",
                    ["gx"] = "actions.open_external",
                    ["g."] = "actions.toggle_hidden",
                    ["g\\"] = "actions.toggle_trash",
                },
            })
        end
    },
    -----------------------------------------------------------------------------------------------
    {
        "folke/trouble.nvim",
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>xs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>xl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
    },
    -----------------------------------------------------------------------------------------------
}
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
--trying to get the gml lsp to work
--
vim.lsp.set_log_level("Off")
--vim.lsp.set_log_level("debug")

vim.filetype.add({ extension = { gml = 'gml' }, filename = { ['.gml'] = 'gml' }})
vim.filetype.add({ extension = { fsh = 'fsh' }, filename = { ['.fsh'] = 'fsh' }})
vim.filetype.add({ extension = { vsh = 'vsh' }, filename = { ['.vsh'] = 'vsh' }})

----------------------------------------------------------------------------------------------------

local ft = require('Comment.ft')
ft({'gml'}, ft.get('c'))

vim.api.nvim_create_autocmd("filetype", {
    pattern = "gml",
    callback = function()
        vim.lsp.start({
            name = "gml-lsp",
            cmd = {'c:\\program files\\gamemaker studio 2-beta\\gamemakerlanguageserver.exe'},
            autostart = true,
            filetypes = { 'gml', '.gml' },
            init_options = {
                runtimeDirectory = "C:\\ProgramData/GameMakerStudio2-Beta/Cache/runtimes\\runtime-2024.400.0.605",
                runtimeVersion = "2024.400.0.605",
                platforms = { "windows" },
                languagePacks = {
                    "C:\\Program Files\\GameMaker Studio 2-Beta\\Plugins\\GMBaseIDELanguages\\Languages\\English\\english.csv",
                },
                language = "english",
            },

            root_dir = vim.fs.dirname(vim.fs.find({"forgotten_game.yyp"}, { upward = true })[1]),
        })

    end,
})


--[[
local lspconfig = require 'lspconfig'
local configs = require 'lspconfig.configs'
local util = require 'lspconfig.util'

if not configs.gml_lsp then
    configs.gml_lsp = {
        default_config = {
            --cmd = { 'C:\\dump\\gml_lsp\\GameMakerLanguageServer.exe', "--stdio" },
            cmd = {'C:\\Program Files\\GameMaker Studio 2-Beta\\GameMakerLanguageServer.exe', '--stdio'},
            root_dir = util.root_pattern("*.yyp"),
            --root_dir = vim.fs.dirname(vim.fs.find({"forgotten_game.yyp"}, { upward = true })[1]),
            --root_dir = vim.fs.dirname('w:\\'),
            autostart = true,
            filetypes = { 'gml' },
            init_options = {
                runtimeVersion = "2024.400.0.562",
                platforms = {"Windows"},
                languagePacks = {
                    "C:\\Program Files\\GameMaker Studio 2-Beta\\Plugins\\GMBaseIDELanguages\\Languages\\English\\english.csv",
                },
                language = "English",
            },
        },
    }
end
lspconfig.gml_lsp.setup {}
--require'lspconfig'.gml_client.setup{}
--]]
---------------------------------------------------------------------------------------------------

