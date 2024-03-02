local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add Breakpoint at line"
    },
    ["<leader>dus"] = {
      function ()
        local widgets = require("dap.ui.widgets")
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
      "Open debugging sidebar"
    },
    ["<leader>dc"] = {
      "<cmd> DapContinue <CR>",
      "Start Debugging"
    },
  },
}
M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function ()
        require("dap-go").debug_test()
      end,
    },
    ["<leader>dgl"] = {
      function ()
        require("dap-go").debug_last()
      end,
    },
  },
}
M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function ()
        require('dap-python').test_method()
      end
    }
  }
}
return M
