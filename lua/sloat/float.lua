-- float.lua: centered floating terminal

local t = require('sloat.terminal')
local term = t.Terminal.new()

local M = {}

function M.toggle(cfg)
  if term:valid_win() then
    term:close()
    return
  end

  if not term:valid_buf() then
    term:open_buf(t.project_root(cfg.root_patterns))
  end

  local cols, lines = vim.o.columns, vim.o.lines
  local w = math.floor(cols * cfg.float.width)
  local h = math.floor(lines * cfg.float.height)

  term.win = vim.api.nvim_open_win(term.buf, true, {
    relative = 'editor',
    width = w,
    height = h,
    col = math.floor((cols - w) / 2),
    row = math.floor((lines - h) / 2),
    style = 'minimal',
    border = cfg.float.border,
    title = ' terminal ',
    title_pos = 'center',
  })

  term:strip_ui()
  vim.cmd.startinsert()
end

function M.kill()
  term:kill()
end

function M.alive()
  return term:valid_buf()
end

function M.is_open()
  return term:valid_win()
end

return M
