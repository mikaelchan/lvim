local clangd_opts = {
  cmd = {
    "clangd",
    "--offset-encoding=utf-8",
  }
}

require("lvim.lsp.manager").setup("clangd", clangd_opts)
