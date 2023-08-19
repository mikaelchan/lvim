local clangd_opts = {
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  }
}

require("lvim.lsp.manager").setup("clangd", clangd_opts)
