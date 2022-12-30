# open-jira.nvim
Opener of [open.nvim](https://github.com/ofirgall/open.nvim) that opens shorthands of Jira tickets, E.g: `JRASERVER-63928`.

## Installation
Install [open.nvim](https://github.com/ofirgall/open.nvim) first.
```lua
use 'ofirgall/open-jira.nvim'
```

## Usage
```lua
-- Leave empty for default values
require('open-jira').setup {
    -- string|function(shorthand: string): string
    url = 'https://jira.atlassian.com/browse/'
}
```
