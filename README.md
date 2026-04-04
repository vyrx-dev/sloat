# sloat.nvim

Minimal float/bottom terminal plugin for Neovim. Persists across buffers. ~250 lines.

## Features

- Toggle a centered floating terminal
- Toggle a bottom-split terminal
- Both terminals persist when switching buffers
- Tiny footprint, no dependencies

![sloat](https://github.com/vyrx-dev/sloat/raw/main/assets/sloat.gif)

## Requirements

- Neovim >= 0.10

## Installation

### lazy.nvim (recommended)

```lua
{
  'vyrx-dev/sloat',
  opts = {},
  keys = {
    { ';t', '<cmd>Sloat float<cr>', mode = { 'n', 't' } },
    { ';st', '<cmd>Sloat bottom<cr>' },
    { ';d', '<cmd>Sloat kill<cr>' },
  },
}
```

### vim-plug

```vim
Plug 'vyrx-dev/sloat'
```

Then call `require('sloat').setup()` in your config.

### packer.nvim

```lua
use {
  'vyrx-dev/sloat',
  config = function()
    require('sloat').setup()
  end,
}
```

## Configuration

Setup is optional. Only needed if you want to change defaults:

```lua
require('sloat').setup({
  float = {
    width = 0.9,
    height = 0.9,
    border = 'single',
  },
  bottom = {
    height = 20,
  },
})
```

When using lazy.nvim, pass options through the `opts` field in your plugin spec instead of calling `setup()` directly.

## Usage

| Command | Description |
| --- | --- |
| `:Sloat float` | Toggle centered floating terminal |
| `:Sloat bottom` | Toggle bottom-split terminal |
| `:Sloat kill` | Destroy both terminals and their buffers |

In any terminal buffer, press `<Esc><Esc>` to leave terminal mode, then use `;d` to kill it.

## Health Check

Run `:checkhealth sloat` to verify everything is set up correctly.

For the full config reference and API docs, see `:help sloat` in Neovim.

## License

MIT
