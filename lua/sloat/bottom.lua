-- bottom.lua: pinned bottom-split terminal

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

  vim.cmd('botright split')
  term.win = vim.api.nvim_get_current_win()

  vim.api.nvim_win_set_buf(term.win, term.buf)
  vim.api.nvim_win_set_height(term.win, cfg.bottom.height)
  vim.wo[term.win].winfixheight = true
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
