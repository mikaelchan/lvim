local ccls_opts = {
  init_options = {
    compilationDatabaseDirectory = "build",
    index = {
      threads = 0,
    },
    clang = {
      excludeArgs = { "-frounding-math" },
    },
  },
  filetypes = { "c", "cpp", "h", "cc" },
  offset_encoding = "utf-8",
}
require("lspconfig").ccls.setup(ccls_opts)

local clangd_opts = {
  cmd = {
    "clangd",
    "--offset-encoding=UTF-8",
  }
}

require("lvim.lsp.manager").setup("clangd", clangd_opts)
