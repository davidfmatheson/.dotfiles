return {
  {
    "mfussenegger/nvim-dap",
    opts = function()
      local dap = require("dap")
      local file = vim.fn.expand("%:p")
      local projectFolder = ""
      local cwd = vim.fn.getcwd():gsub([[-]], "%%-")
      local mason_registry = require("mason-registry")
      local bash_debug_adapter_dir = mason_registry.get_package("bash-debug-adapter"):get_install_path()
      local bashdb_dir = bash_debug_adapter_dir .. "/extension/bashdb_dir"
      if string.find(file, cwd .. "/apps/") or string.find(file, cwd .. "/libs/") then
        projectFolder = string.match(file, cwd .. "(.-/[^/]+)/src")
      end
      if not dap.adapters["pwa-chrome"] then
        dap.adapters["pwa-chrome"] = {
          type = "executable",
          command = "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome",
        }
      end
      if not dap.adapters["sh"] then
        dap.adapters["sh"] = {
          type = "executable",
          command = bash_debug_adapter_dir .. "/bash-debug-adapter",
        }
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
            cwd = "${workspacefolder}" .. projectFolder,
          },
          {
            type = "pwa-node",
            request = "attach",
            name = "attach by port",
            port = 9229,
            cwd = "${workspacefolder}" .. projectFolder,
          },
          {
            type = "pwa-chrome",
            request = "launch",
            name = "Launch & Debug chrome",
            url = "http://localhost:4200",
            webroot = vim.fn.getcwd(),
            protocol = "inspector",
            sourcemaps = true,
            userdatadir = false,
          },
        }
      end
      dap.configurations["sh"] = {
        {
          type = "sh",
          request = "launch",
          name = "Launch bash debugger",
          program = "${file}",
          cwd = "${fileDirname}",
          pathBashdb = bashdb_dir .. "/bashdb",
          pathBashdbLib = bashdb_dir,
          pathBash = "bash",
          pathCat = "cat",
          pathMkfifo = "mkfifo",
          pathPkill = "pkill",
          env = {},
        },
      }
    end,
    keys = {
      {
        "<leader>dd",
        function()
          require("osv").launch({ port = 8086 })
        end,
        desc = "Start lua debug listener",
      },
    },
  },
}
