local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",

        "debugpy",
        "pyright",
        "ruff",
        "black",

        "eslint-lsp",
        "typescript-language-server",
        "prettier",
        "js-debug-adapter",
      },
    },
  },
  {
    "microsoft/debugpy"
  },
  {
    "mfussenegger/nvim-dap",
    ft = "javascript",
    init = function ()
      require("core.utils").load_mappings"dap"
      
    end,
    config = function ()
      require("custom.configs.dap")
      require("core.utils").load_mappings("dap")
    end,
  },
  { "nvim-neotest/nvim-nio" },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function ()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.before.attach.dapui_config = function ()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function ()
        dapui.open()
      end
      dap.listeners.after.event_intiialized["dapui_config"] = function ()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function ()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function ()
        dapui.close()
      end
    end
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function (_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings("dap_go")
    end
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
      "nvim-dap-ui",
      "debugpy",
    },
    config = function (_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings("dap_python")
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {
      "go",
    },
    opts = function ()
      return require "custom.configs.null-ls-go"
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {
      "python",
    },
    opts = function ()
      return require "custom.configs.null-ls-python"
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {
      "javascript",
      "typescript",
    },
    opts = function ()
      return require "custom.configs.null-ls-javascript"
    end,
  },
}
return plugins
