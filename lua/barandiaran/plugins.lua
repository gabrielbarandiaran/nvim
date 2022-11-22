local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

-- Install your plugins here
return packer.startup(function(use)
    -- Core plugins
    use({ "wbthomason/packer.nvim" }) -- Have packer manage itself
    use({ "nvim-lua/plenary.nvim" }) -- Lua functions
    use({ "lewis6991/impatient.nvim" }) -- Improve Lua modules startup time

    -- Utility plugins
    use({ "goolord/alpha-nvim" }) -- Fast and programmable nvim greeter
    use({ "ahmedkhalf/project.nvim" }) -- Project management
    use({ "folke/which-key.nvim" }) -- Popup with possible key bindings after typing
    use({ "nvim-telescope/telescope.nvim" }) -- Highly extendable fuzzy finder over lists (Need to install ripgrep)
    use({ "lewis6991/gitsigns.nvim" }) -- Super fast git decorations

    -- Code utility plugins
    use({ "windwp/nvim-autopairs" }) -- Autopair plugin with multiple character support
    use({ "numToStr/Comment.nvim" }) -- Toggle comments
    use({ "JoosepAlviste/nvim-ts-context-commentstring" }) -- Set the commentstring option based on the cursor location in the file.
    use({ "lukas-reineke/indent-blankline.nvim" }) -- Highlight indentation
    use({ "ludovicchabant/vim-gutentags" }) -- Ctags manager

    -- Layout plugins
    use({ "kyazdani42/nvim-tree.lua" }) -- File explorer
    use({ "akinsho/bufferline.nvim" }) -- Bufferline
    use({ "nvim-lualine/lualine.nvim" }) -- Statusline
    use({ "akinsho/toggleterm.nvim" }) -- Super fast git decorations
    use({ "kyazdani42/nvim-web-devicons" }) -- Icon pack

    -- LSP
    use({
        "nvim-treesitter/nvim-treesitter",
    })
    use({ "neovim/nvim-lspconfig" })
    use({ "williamboman/mason.nvim" })
    use({ "williamboman/mason-lspconfig.nvim" })
    use({ "glepnir/lspsaga.nvim" })
    use({ "jose-elias-alvarez/null-ls.nvim" })
    use({ "MunifTanjim/prettier.nvim" }) -- Prettier plugin for Neovim's built-in LSP client
    use({
        "windwp/nvim-ts-autotag",
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    })

    -- CMP plugins
    use({ "hrsh7th/nvim-cmp" })
    use({ "hrsh7th/cmp-buffer" })
    use({ "hrsh7th/cmp-path" })
    use({ "saadparwaiz1/cmp_luasnip" })
    use({ "hrsh7th/cmp-nvim-lsp" })
    use({ "hrsh7th/cmp-nvim-lua" })

    -- Tests
    use({ "klen/nvim-test" })

    -- Debugger
    use({ "mfussenegger/nvim-dap" })
    use({ "leoluz/nvim-dap-go" })
    use({ "rcarriga/nvim-dap-ui" })

    -- snippets
    use({ "L3MON4D3/LuaSnip" })
    use({ "rafamadriz/friendly-snippets" })

    -- Colorschemes
    use({ "Shatur/neovim-ayu" })

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
