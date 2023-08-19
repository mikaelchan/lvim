-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
lvim.transparent_window = true
lvim.colorscheme = "catppuccin"
vim.opt.relativenumber = true
vim.opt.cmdheight = 0
vim.opt.colorcolumn = "120"
-- KeyMappings
lvim.keys.insert_mode['jk'] = "<Esc>"
lvim.keys.normal_mode['<S-l>'] = ":BufferLineCycleNext<Enter>"
lvim.keys.normal_mode['<S-h>'] = ":BufferLineCyclePrev<Enter>"
function cmd(str)
  return '<cmd>' .. str .. '<CR>'
end

lvim.builtin.which_key.mappings = {
  ['/'] = { cmd("lua require('Comment.api').toggle.linewise.current()"), '󱆿 Comment' },
  [';'] = { cmd('Dashboard'), ' Dashboard' },
  ['<leader>'] = { cmd("lua require('harpoon.ui').toggle_quick_menu()"), ' Harpoon' },
  ['1'] = { cmd("lua require('harpoon.ui').nav_file(1)"), '󰎤 goto1' },
  ['2'] = { cmd("lua require('harpoon.ui').nav_file(2)"), '󰎧 goto2' },
  ['3'] = { cmd("lua require('harpoon.ui').nav_file(3)"), '󰎪 goto3' },
  ['4'] = { cmd("lua require('harpoon.ui').nav_file(4)"), '󰎭 goto4' },
  a = { cmd("lua require('harpoon.mark').add_file()"), '󰃁 Add mark' },
  w = { cmd('w!'), ' Save' },
  q = { cmd('confirm q'), '󰗼 Quit' },
  c = { cmd("lua require('modules.tools.buffer').kill()"), ' Close buffer' },
  i = { cmd("lua require('lsp-inlayhints').toggle()"), '󰭴 Inlay hints' },
  e = { cmd('NvimTreeToggle'), ' Explorer' },
  o = { cmd('Lspsaga outline'), ' Symbol outline' },
  v = { cmd("lua require('lsp_lines').toggle()"), '󱖫 LSP lines' },
  y = { cmd("lua require('telescope').extensions.neoclip.default()"), ' Yank history' },
  h = { cmd('Cheat'), '󱚟 Cheat' },
  b = {
    name = ' Buffers',
    ['1'] = { cmd('BufferLineGoToBuffer 1'), 'Goto 1' },
    ['2'] = { cmd('BufferLineGoToBuffer 2'), 'Goto 2' },
    ['3'] = { cmd('BufferLineGoToBuffer 3'), 'Goto 3' },
    ['4'] = { cmd('BufferLineGoToBuffer 4'), 'Goto 4' },
    ['5'] = { cmd('BufferLineGoToBuffer 5'), 'Goto 5' },
    ['6'] = { cmd('BufferLineGoToBuffer 6'), 'Goto 6' },
    ['7'] = { cmd('BufferLineGoToBuffer 7'), 'Goto 7' },
    ['8'] = { cmd('BufferLineGoToBuffer 8'), 'Goto 8' },
    ['9'] = { cmd('BufferLineGoToBuffer 9'), 'Goto 9' },
    c = { cmd('BufferLinePickClose'), 'Close buffer' },
    p = { cmd('BufferLineTogglePin'), 'Toggle pin' },
    j = { cmd('BufferLinePick'), 'Jump buffer' },
    f = { cmd('Telescope buffers'), 'Find buffer' },
    h = { cmd('BufferLineCloseLeft'), 'Close all to the left' },
    l = { cmd('BufferLineCloseRight'), 'Close all to the right' },
    D = { cmd('BufferLineSortByDirectory'), 'Sort by directory' },
    L = { cmd('BufferLineSortByExtension'), 'Sort by language' },
    b = { cmd('BufferLineCycleNext'), 'Next buffer' },
    n = { cmd('BufferLineCyclePrev'), 'Previous buffer' },
    g = { cmd('BufferLineGroupToggle pinned'), 'Toggle pinned group' },
  },
  d = {
    name = ' Debug',
    t = { cmd("lua require('dap').toggle_breakpoint()"), 'Toggle breakpoint' },
    b = { cmd("lua require('dap').step_back()"), 'Step back' },
    s = { cmd("lua require('dap').continue()"), 'Start' },
    c = { cmd("lua require('dap').continue()"), 'Continue' },
    C = { cmd("lua require('dap').run_to_cursor()"), 'Run to cursor' },
    d = { cmd("lua require('dap').disconnect()"), 'Disconnect' },
    g = { cmd("lua require('dap').session()"), 'Get session' },
    i = { cmd("lua require('dap').step_into()"), 'Step into' },
    o = { cmd("lua require('dap').step_over()"), 'Step over' },
    u = { cmd("lua require('dap').step_out()"), 'Step out' },
    e = { cmd("lua require('dapui').eval()"), 'Eval' },
    p = { cmd("lua require('dap').pause()"), 'Pause' },
    r = { cmd("lua require('dap').repl.open()"), 'Open repl' },
    q = { cmd("lua require('dap').close()"), 'Close' },
    U = { cmd("lua require('dapui').toggle()"), 'UI toggle' },
  },
  f = {
    name = ' Search',
    f = { cmd('Telescope find_files'), 'File' },
    h = { cmd('Telescope help_tags'), 'Help' },
    m = { cmd('Telescope man_pages'), 'Man Pages' },
    o = { cmd('Telescope oldfiles'), 'Recent File' },
    r = { cmd('Telescope registers'), 'Registers' },
    t = { cmd('Telescope live_grep'), 'Text' },
    k = { cmd('Telescope keymaps'), 'Keymaps' },
    c = { cmd('Telescope commands'), 'Commands' },
    e = { cmd('Telescope file_browser'), 'Browser' },
    d = { cmd('Telescope dotfiles'), 'Dotfiles' },
    p = { cmd('Telescope luasnip'), 'Snippets' },
    s = { cmd("lua require('telescope').extensions.live_grep_args.live_grep_args()"), 'String' },
  },
  g = {
    name = ' Git',
    g = { cmd("lua require 'modules.tools.lazygit'.toggle()"), 'LazyGit' },
    j = { cmd("lua require 'gitsigns'.next_hunk({navigation_message = false})"), 'Next Hunk' },
    k = { cmd("lua require 'gitsigns'.prev_hunk({navigation_message = false})"), 'Prev Hunk' },
    l = { cmd("lua require 'gitsigns'.blame_line()"), 'Blame' },
    p = { cmd("lua require 'gitsigns'.preview_hunk()"), 'Preview Hunk' },
    r = { cmd("lua require 'gitsigns'.reset_hunk()"), 'Reset Hunk' },
    R = { cmd("lua require 'gitsigns'.reset_buffer()"), 'Reset Buffer' },
    s = { cmd("lua require 'gitsigns'.stage_hunk()"), 'Stage Hunk' },
    u = {
      cmd("lua require 'gitsigns'.undo_stage_hunk()"),
      'Undo Stage Hunk',
    },
    o = { cmd('Telescope git_status'), 'Open Changed File' },
    b = { cmd('Telescope git_branches'), 'Checkout Branch' },
    c = { cmd('Telescope git_commits'), 'Checkout Commit' },
    d = { cmd('DiffviewOpen'), 'Diffview' },
    h = { cmd('DiffviewFileHistory'), 'File History' },
  },
  l = {
    name = ' LSP',
    i = { cmd('LspInfo'), 'Info' },
    f = { cmd("lua require('lvim.lsp.utils').format()"), 'Format' },
    k = { cmd('Lspsaga incoming_calls'), 'Incoming calls' },
    K = { cmd('Lspsaga outgoing_calls'), 'Outgoing calls' },
    m = { cmd('Mason'), "Mason Info" },
  },
  p = {
    name = ' Plugins',
    h = { cmd('Lazy home'), 'Home' },
    i = { cmd('Lazy install'), 'Install' },
    s = { cmd('Lazy sync'), 'Sync' },
    u = { cmd('Lazy update'), 'Update' },
    x = { cmd('Lazy clean'), 'Clean' },
    l = { cmd('Lazy log'), 'Log' },
    p = { cmd('Lazy profile'), 'Profile' },
    c = { cmd('Lazy check'), 'Check' },
  },
  r = {
    name = ' Replace',
    f = { cmd("lua require('spectre').open_file_search()"), 'Current Buffer' },
    p = { cmd("lua require('spectre').open()"), 'Project' },
    w = { cmd("lua require('spectre').open_visual({select_word=true})"), 'Word' },
  },
  s = {
    name = ' Session',
    s = { cmd("lua require('persistence').load()"), 'Restore for current dir' },
    l = { cmd("lua require('persistence').load({last=true})"), 'Restore last session' },
    d = { cmd("lua require('presistence').stop()"), 'Stop persistence' },
  },
  t = {
    name = ' Tasks',
    l = { cmd('OverseerLoadBundle'), 'Load bundle' },
    s = { cmd('OverseerSaveBundle'), 'Save bundle' },
    n = { cmd('OverseerBuild'), 'New task' },
    q = { cmd('OverseerQuickAction'), 'Quick action' },
    f = { cmd('OverseerTaskAction'), 'Task Action' },
    t = { cmd('OverseerToggle'), 'Toggle Output' },
    r = { cmd('OverseerRun'), 'Run' },
    p = { cmd('OverseerRunCmd'), 'Run with Cmd' },
  },
} 
lvim.builtin.nvimtree.setup.renderer.icons.glyphs.git = {
  unstaged = '󱨈',
  staged = '',
  unmerged = '',
  renamed = '',
  untracked = '',
  deleted = '',
  ignored = '◌',
}
lvim.format_on_save.enabled = true
lvim.format_on_save.pattern = { "*.lua", "*.py", "*.cc", "*.h" }
-- Color
lvim.autocommands = {
  {
    { "ColorScheme" },
    {
      pattern = "*",
      callback = function()
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE", ctermbg = "NONE" })
      end,
    },
  },
}
-- Linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { name = "cppcheck" },
  { name = "flake8",  args = { "--max-line-length", "120" } }
}
-- Formatters
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { name = "clang_format" },
  { name = "autopep8",    args = { "--max-line-length", "120", "--experimental" } }
}
-- plugins
lvim.plugins = {
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
      vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
      vim.defer_fn(function()
        require("copilot").setup()     -- https://github.com/zbirenbaum/copilot.lua/blob/master/README.md#setup-and-configuration
        require("copilot_cmp").setup() -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
      end, 100)
    end,
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    lazy = true,
    config = function()
      require("persistence").setup {
        dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
        options = { "buffers", "curdir", "tabpages", "winsize" },
      }
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "latte",
        integrations = {
          alpha = true,
          gitsigns = true,
          harpoon = true,
          hop = true,
          lightspeed = true,
          mason = true,
          cmp = true,
          nvimtree = true,
          treesitter = true,
          treesitter_context = true,
          telescope = true,
          illuminate = true,
          which_key = true
        },
      })
    end
  }
}
