# sloat.nvim

Toggleable float and bottom terminals for Neovim. Persist across buffers. ~250 lines.

## Requirements

- Neovim >= 0.10

## Install

**lazy.nvim**
```lua
{
  'vyrx-dev/sloat',
  opts = {},  -- calls setup() with defaults
}
```

**packer.nvim**
```lua
use {
  'vyrx-dev/sloat',
  config = function()
    require('sloat').setup()
  end,
}
```

## Setup

```lua
require('sloat').setup({
  float = {
    width = 0.8,    -- percentage of editor width
    height = 0.8,   -- percentage of editor height
    border = 'rounded',
  },
  bottom = {
    height = 15,    -- lines tall
  },
  root_patterns = { '.git', 'Makefile', 'package.json' },
})
```

## Usage

```
:Sloat float    toggle centered floating terminal
:Sloat bottom   toggle bottom-split terminal
:Sloat kill     destroy both terminals and their buffers
```

**Suggested keymaps**
```lua
vim.keymap.set({'n','t'}, ';t', '<cmd>Sloat float<cr>')
vim.keymap.set('n', ';st', '<cmd>Sloat bottom<cr>')
vim.keymap.set('n', ';d', '<cmd>Sloat kill<cr>')
```

Inside any terminal buffer, press `<Esc><Esc>` to leave terminal mode without closing the window.

## Health

```
:checkhealth sloat
```

## License

MIT
