-- .
-- ├── init.lua
-- ├── ...
-- └── lua
--     ├── plugins
--     │   ├── init.lua
--     │   └── ...
--     │   └── lsp
--     │       └── init.lua
--     │       └── servers
--     │           └── ...
--     └── user
--         ├── init.lua
--         ├── lazy_bootstrap.lua
--         ├── maps.lua
--         └── options.lua
--         └── commands.lua

----------------------------------------------[[ Bootstrap Lazy ]]

require("user/lazy_bootstrap") -- bootstraps folke/lazy

----------------------------------------------[[  User Settings ]]

-- require("user") -- loads lua/user/init.lua
require("user.options") -- loads lua/user/options.lua
require("user.maps") -- etc.
require("user.autocmds")
require("user.commands")

----------------------------------------------[[  Load Plugins  ]]

require("lazy").setup("plugins") -- loads lua/plugins

----------------------------------------------[[  End  ]]
