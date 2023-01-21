-- dashboard
return {
  --- theme
  {
    'nyoom-engineering/oxocarbon.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      -- setup must be called before loading
      vim.cmd([[colorscheme oxocarbon]])
    end
  },
  --- statusline
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'kyazdani42/nvim-web-devicons',
    },
    opts = {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    },
  },
  --- dashboard
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    opts = function()
      local dashboard = require("alpha.themes.dashboard")
      local logo = [[
⢠⣤⣤⡄⠀⠀⠀⠀⠀⠀⣤⣤⣤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣤⣤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⢸⣿⣿⡇⠀⠀⠀⠀⠀⠀⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⢸⣿⣿⡇⠀⠀⠀⠀⠀⠀⣿⣿⣿⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣄⠀⠀⠀⢸⣿⣿⠀⠀⢠⣤⣤⠀⠀⠀⠀⠀⢀⣤⣤⠀⠀⠀⢀⣤⣤⣤⣤⣤⣤⣤⣤
⢸⣿⣿⡇⠀⠀⠀⠀⠀⠀⣿⣿⣿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⢿⣿⣷⠀⠀⢸⣿⣿⠀⠀⢸⣿⣿⠀⠀⠀⠀⠀⢸⣿⣿⠀⠀⢰⣿⣿⠿⠿⠿⠿⠿⠿⠿
⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⣠⣴⣶⣶⣶⣶⣶⣼⣿⣿⠀⠀⢸⣿⣿⠀⠀⢸⣿⣿⠀⠀⠀⠀⠀⢸⣿⣿⠀⠀⢸⣿⣧⠀⠀⠀⠀⠀⠀⠀
⢸⣿⣿⡏⠉⠉⠉⠉⠉⠉⣿⣿⣿⠀⠀⢰⣿⣿⡿⠿⠿⠿⠿⣿⣿⣿⠀⠀⢸⣿⣿⠀⠀⢸⣿⣿⠀⠀⠀⠀⠀⢸⣿⣿⠀⠀⠈⢿⣿⣿⣿⣿⣿⣿⣶⡀
⢸⣿⣿⡇⠀⠀⠀⠀⠀⠀⣿⣿⣿⠀⠀⢸⣿⣿⠁⠀⠀⠀⠀⢸⣿⣿⠀⠀⢸⣿⣿⠀⠀⢸⣿⣿⠀⠀⠀⠀⠀⢸⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣷
⢸⣿⣿⡇⠀⠀⠀⠀⠀⠀⣿⣿⣿⠀⠀⢸⣿⣿⣦⣀⣀⣀⣀⣼⣿⣿⠀⠀⢸⣿⣿⠀⠀⢸⣿⣿⣆⣀⣀⣀⣀⣼⣿⣿⣀⣀⣀⣀⣀⣀⣀⣀⣀⣼⣿⡟
⠸⣿⣿⡇⠀⠀⠀⠀⠀⠀⣿⣿⡿⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⡿⠏⠀⠀⠸⣿⣿⠀⠀⠀⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠁
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⣀⣀⣀⣸⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
      ]]

      dashboard.section.header.val = vim.split(logo, "\n")
      dashboard.section.buttons.val = {
        dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
        dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
        dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
        dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
        dashboard.button("s", "勒" .. " Restore Session", [[:lua require("persistence").load() <cr>]]),
        dashboard.button("l", "鈴" .. " Lazy", ":Lazy<CR>"),
        dashboard.button("q", " " .. " Quit", ":qa<CR>"),
      }
      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = "AlphaButtons"
        button.opts.hl_shortcut = "AlphaShortcut"
      end
      dashboard.section.footer.opts.hl = "Type"
      dashboard.section.header.opts.hl = "AlphaHeader"
      dashboard.section.buttons.opts.hl = "AlphaButtons"
      dashboard.opts.layout[1].val = 8
      return dashboard
    end,
    config = function(_, dashboard)
      vim.b.miniindentscope_disable = true

      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "AlphaReady",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      require("alpha").setup(dashboard.opts)

      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimStarted",
        callback = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
          pcall(vim.cmd.AlphaRedraw)
        end,
      })
    end,
  }
}
