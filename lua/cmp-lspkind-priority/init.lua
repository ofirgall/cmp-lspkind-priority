---@mod cmp-lspkind-priority Prioritze lsp kinds for cmp
local M = {}

local default_config = {
}

local loaded_config = default_config

---@param config table user config
---@usage [[
----- Default config
---require('cmp-lspkind-priority').setup {
---}
---@usage ]]
M.setup = function(config)
    config = config or {}
    config = vim.tbl_deep_extend('keep', config, default_config)

    loaded_config = config

end

return M
