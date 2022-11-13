local status, null_ls = pcall(require, "null-ls")
if not status then
    return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
    sources = {
        -- C/C++
        null_ls.builtins.diagnostics.cppcheck,
        -- Git
        null_ls.builtins.diagnostics.gitlint,
        null_ls.builtins.code_actions.gitsigns,
        -- Javascript
        null_ls.builtins.code_actions.eslint_d,
        null_ls.builtins.formatting.prettier,
        -- Lua
        null_ls.builtins.completion.luasnip,
        null_ls.builtins.formatting.stylua,
        -- Python
        null_ls.builtins.diagnostics.flake8,
        null_ls.builtins.formatting.autopep8,
        -- Rust
        null_ls.builtins.formatting.rustfmt,
        -- Tailwind
        null_ls.builtins.formatting.rustywind,
    },

    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({
                        bufnr = bufnr,
                        filter = function()
                            return client.name == "null-ls"
                        end,
                    })
                end,
            })
        end

        if client.server_capabilities.documentRangeFormattingProvider then
            vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")
        end
    end,
})
