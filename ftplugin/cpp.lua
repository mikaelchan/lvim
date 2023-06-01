local clangd_opts = {
  cmd = {
    "clangd",
    "--offset-encoding=UTF-8",
  }
}

require("lvim.lsp.manager").setup("clangd", clangd_opts)
