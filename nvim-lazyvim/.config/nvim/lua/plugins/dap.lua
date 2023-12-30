return {
  {
    "mfussenegger/nvim-dap",
    -- dependencies = {
    --   {
    --     "mxsdev/nvim-dap-vscode-js",
    --     config = function()
    --       require("dap-vscode-js").setup({
    --         node_path = "node",
    --         debugger_cmd = {
    --           require("mason-registry").get_package("js-debug-adapter"):get_install_path()
    --             .. "/js-debug-adapter",
    --         },
    --         adapters = {
    --           "pwa-node",
    --           "pwa-chrome",
    --         },
    --         log_file_path = vim.fn.stdpath("log") .. "/dap_vscode_js.log",
    --         log_file_level = vim.log.levels.DEBUG,
    --         log_console_level = vim.log.levels.ERROR,
    --       })
    --     end,
    --   },
    -- },
    opts = function()
      local dap = require("dap")
      local file = vim.fn.expand("%:p")
      local projectfolder = ""
      local cwd = vim.fn.getcwd()
      if string.find(file, cwd .. "/apps/") or string.find(file, cwd .. "/libs/") then
        projectfolder = string.match(file, cwd .. "(.-/[^/]+)/src")
      end
      for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact" }) do
        dap.configurations[language] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "launch file",
            program = "${file}",
            cwd = "${workspacefolder}",
          },
          {
            type = "pwa-node",
            request = "attach",
            name = "attach by process",
            processid = require("dap.utils").pick_process,
            cwd = "${workspacefolder}" .. projectfolder,
          },
          {
            type = "pwa-node",
            request = "attach",
            name = "attach by port",
            port = 9229,
            cwd = "${workspacefolder}" .. projectfolder,
          },
          {
            type = "pwa-chrome",
            request = "launch",
            name = "launch & debug chrome",
            url = "http://localhost:4200",
            webroot = vim.fn.getcwd(),
            protocol = "inspector",
            sourcemaps = true,
            userdatadir = false,
          },
        }
      end
    end,
  },
}
