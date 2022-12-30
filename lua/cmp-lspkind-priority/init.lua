---@mod cmp-lspkind-priority Prioritze lsp kinds for cmp
local M = {}

local default_config = {
    -- Default priority by nvim-cmp
    priority = {
        'Snippet',
        'Method',
        'Function',
        'Constructor',
        'Field',
        'Variable',
        'Class',
        'Interface',
        'Module',
        'Property',
        'Unit',
        'Value',
        'Enum',
        'Keyword',
        'Color',
        'File',
        'Reference',
        'Folder',
        'EnumMember',
        'Constant',
        'Struct',
        'Event',
        'Operator',
        'TypeParameter',
        'Text',
    }
}

local priority = nil

---@param config table user config
---@usage [[
----- Default config
---require('cmp-lspkind-priority').setup {
---local lspkind_priority = require('cmp-lspkind-priority')
---lspkind_priority.setup {
---    -- Default priority by nvim-cmp
---    priority = {
---        'Snippet',
---        'Method',
---        'Function',
---        'Constructor',
---        'Field',
---        'Variable',
---        'Class',
---        'Interface',
---        'Module',
---        'Property',
---        'Unit',
---        'Value',
---        'Enum',
---        'Keyword',
---        'Color',
---        'File',
---        'Reference',
---        'Folder',
---        'EnumMember',
---        'Constant',
---        'Struct',
---        'Event',
---        'Operator',
---        'TypeParameter',
---        'Text',
---    }
---}
---
---local compare = require('cmp.config.compare')
---require('cmp').setup{
---    sorting = {
---        comparators = {
---            lspkind_priority.compare, -- Replaces `compare.kind` + first comparator
---            compare.offset,
---            compare.exact,
---            -- compare.scopes,
---            compare.score,
---            compare.recently_used,
---            compare.locality,
---            compare.sort_text,
---            compare.length,
---            compare.order,
---        },
---    },
---}
---@usage ]]
M.setup = function(config)
    config = config or {}
    config = vim.tbl_deep_extend('keep', config, default_config)

    priority = {}
    for i, kind in ipairs(config.priority) do
        priority[kind] = i
    end
end

---@brief [[
---nvim-cmp comprator
---@brief ]]
M.compare = function(entry1, entry2)
    local kind1 = priority[entry1:get_kind()]
    local kind2 = priority[entry2:get_kind()]
    if kind1 ~= kind2 then
        local diff = kind1 - kind2
        if diff < 0 then
            return true
        elseif diff > 0 then
            return false
        end
    end
end

return M
