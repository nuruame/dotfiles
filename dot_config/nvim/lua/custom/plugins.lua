local plugins = {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local custom_changes = {
        mapping = {
          ["<M-k>"] = require("cmp").mapping.select_prev_item(),
          ["<M-j>"] = require("cmp").mapping.select_next_item(),
        },
      }
      return vim.tbl_deep_extend("error", opts, custom_changes)
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "f",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump(require("flash.config").get({
            mode = "char",
            search = {
              mode = require("flash.plugins.char").mode "f",
              max_length = 1,
            },
          }, require("flash.plugins.char").motions["f"]))
        end,
        desc = "Flash f",
      },
      {
        "t",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump(require("flash.config").get({
            mode = "char",
            search = {
              mode = require("flash.plugins.char").mode "t",
              max_length = 1,
            },
          }, require("flash.plugins.char").motions["t"]))
        end,
        desc = "Flash t",
      },
      {
        "F",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump(require("flash.config").get({
            mode = "char",
            search = {
              mode = require("flash.plugins.char").mode "F",
              max_length = 1,
            },
          }, require("flash.plugins.char").motions["F"]))
        end,
        desc = "Flash F",
      },
      {
        "T",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump(require("flash.config").get({
            mode = "char",
            search = {
              mode = require("flash.plugins.char").mode "T",
              max_length = 1,
            },
          }, require("flash.plugins.char").motions["T"]))
        end,
        desc = "Flash T",
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Flash Treesitter Search",
      },
      {
        "<c-s>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },
    },
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {},
    },
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, _)
      require("core.utils").load_mappings "dap"
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "clang-format",
        "rust-analyzer",
        "stylua",
        "codelldb",
        "pyright",
        "black",
        "bash-language-server",
        "shellcheck",
      },
    },
  },
}

return plugins
