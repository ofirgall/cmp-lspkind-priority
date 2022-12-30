# cmp-lspkind-priority
Configure the priority of LSP items by kind, for [nvim-cmp](hrsh7th/nvim-cmp).

## Installation
```lua
use 'ofirgall/cmp-lspkind-priority'
```

## Usage
```lua
local lspkind_priority = require('cmp-lspkind-priority')
lspkind_priority.setup {
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

local compare = require('cmp.config.compare')
require('cmp').setup{
    sorting = {
        comparators = {
            lspkind_priority.compare, -- Replaces `compare.kind` + first comparator
            compare.offset,
            compare.exact,
            -- compare.scopes,
            compare.score,
            compare.recently_used,
            compare.locality,
            compare.sort_text,
            compare.length,
            compare.order,
        },
    },
}
```
