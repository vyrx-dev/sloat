# sloat.nvim

Minimal float/bottom terminal plugin for Neovim. Persist across buffers. ~250 lines.

## Requirements

- Neovim >= 0.10

## Install

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

## Setup

Optional. Only needed if you want to change defaults:

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

If using **lazy.nvim**, just pass it via `opts` in the install block.

## Usage

```
:Sloat float    toggle centered floating terminal
:Sloat bottom   toggle bottom-split terminal
:Sloat kill     destroy both terminals and their buffers
```

Inside any terminal buffer, press `<Esc><Esc>` to leave terminal mode, then `;d` to kill it.

## Health

```
:checkhealth sloat
```

## License

MIT
