return {
  {
    "mfussenegger/nvim-dap",
    opts = function()
      local dap = require("dap")
      local file = vim.fn.expand("%:p")
      local projectFolder = ""
      local cwd = vim.fn.getcwd()
      if string.find(file, cwd.."/apps/") or string.find(file, cwd.."/libs/") then
        projectFolder = string.match(file, cwd.."(.-/[^/]+)/src")
      end
      for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact" }) do
        dap.configurations[language] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
          },
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach by process",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}"..projectFolder,
          },
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach by port",
            port = 9229,
            cwd = "${workspaceFolder}"..projectFolder,
          },
        }
      end
    end,
  },
}
