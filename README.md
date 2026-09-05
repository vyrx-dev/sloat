# sloat

**Minimal float/bottom terminal for Neovim.** Persists across buffers. ~250 lines.

![sloat](https://github.com/vyrx-dev/sloat/raw/main/assets/sloat.gif)

## Features

- Toggle a centered **floating terminal**
- Toggle a **bottom-split terminal**
- Both terminals **persist** when switching buffers
- Auto-detects **project root** (`.git`, `Makefile`, `package.json`)
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

### vim.pack (Neovim >= 0.12)

```lua
vim.pack.add('vyrx-dev/sloat')
```

Then call `require('sloat').setup()` in your config.

### vim-plug

```vim
Plug 'vyrx-dev/sloat'
```

Then call `require('sloat').setup()` in your config.

## Configuration

Setup is optional — defaults work out of the box:

```lua
require('sloat').setup({
  float = {
    width = 0.5,
    height = 0.6,
    border = 'rounded', -- see :h nvim_open_win
  },
  bottom = {
    height = 15,
  },
  root_patterns = { '.git', 'Makefile', 'package.json', 'Cargo.toml', 'go.mod' },
})
```

When using lazy.nvim, pass options through the `opts` field instead of calling `setup()` directly.

`root_patterns` controls where the terminal opens — sloat walks up from the current file to find the nearest match and uses that as the working directory.

## Usage

```
:Sloat float    toggle floating terminal
:Sloat bottom   toggle bottom terminal
:Sloat kill     destroy all terminals
```

Press `<Esc><Esc>` to leave terminal mode.

## License

MIT
