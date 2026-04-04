# sloat.nvim

**Minimal float/bottom terminal plugin for Neovim.** Persists across buffers. ~250 lines.

![sloat](https://github.com/vyrx-dev/sloat/raw/main/assets/sloat.gif)

## Features

- Toggle a centered **floating terminal**
- Toggle a **bottom-split terminal**
- Both terminals **persist** when switching buffers
- Tiny footprint, **no dependencies**

## Requirements

- Neovim >= 0.10

## Install

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

```
:Sloat float    toggle floating terminal
:Sloat bottom   toggle bottom terminal
:Sloat kill     destroy both terminals
```

Press `<Esc><Esc>` to leave terminal mode.

## License

MIT
