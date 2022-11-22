require("nvim-treesitter.install").prefer_git = true
local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then
    return
end

ts.setup({
    highlight = {
        enable = true,
        disable = {},
    },
    indent = {
        enable = true,
        disable = {},
    },
    ensure_installed = {
        "c",
        "css",
        "cpp",
        "go",
        "graphql",
        "html",
        "http",
        "javascript",
        "json",
        "lua",
        "markdown",
        "python",
        "regex",
        "rust",
        "scss",
        "toml",
        "tsx",
        "yaml",
    },
    autotag = {
        enable = true,
    },
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
