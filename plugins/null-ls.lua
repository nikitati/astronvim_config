return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- Set a formatter
      -- null_ls.builtins.formatting.stylua,
      -- null_ls.builtins.formatting.prettier,
      null_ls.builtins.formatting.black.with {
        extra_args = function(params) return { "--config", params.root .. "/src/python/pyproject.toml" } end,
        cwd = function(params) return params.root .. "/src/python/analytics" end,
      },
      null_ls.builtins.formatting.ruff.with {
        extra_args = function(params) return { "--config", params.root .. "/src/python/pyproject.toml" } end,
        cwd = function(params) return params.root .. "/src/python/analytics" end,
      },
    }
    config.debug = true
    return config -- return final config table
  end,
}
