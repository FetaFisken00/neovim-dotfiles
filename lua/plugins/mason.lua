local M = {
  "williamboman/mason.nvim",
  cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
  opts = function()
    return require "plugins.configs.mason"
  end,
}

function M.config()
  local ensure_installed = { "lua-language-server" }, -- not an option from mason.nvim

  PATH = "skip",

  ui = {
    icons = {
      package_pending = " ",
      package_installed = "󰄳 ",
      package_uninstalled = " 󰚌",
    },

    keymaps = {
      toggle_server_expand = "<CR>",
      install_server = "i",
      update_server = "u",
      check_server_version = "c",
      update_all_servers = "U",
      check_outdated_servers = "C",
      uninstall_server = "X",
      cancel_installation = "<C-c>",
    },
  },

  max_concurrent_installers = 10,

  vim.g.mason_binaries_list = opts.ensure_installed
  dofile(vim.g.base46_cache .. "mason")
  require("mason").setup()

  -- custom nvchad cmd to install all mason binaries listed
  vim.api.nvim_create_user_command("MasonInstallAll", function()
    if opts.ensure_installed and #opts.ensure_installed > 0 then
      vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
    end
  end, {})

end

return M
