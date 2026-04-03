-- Shared terminal state and helpers for sloat.nvim

local M = {}

---@class Terminal
---@field buf integer|nil
---@field win integer|nil
local Terminal = {}
Terminal.__index = Terminal

function Terminal.new()
  return setmetatable({}, Terminal)
end

function Terminal:valid_win()
  return self.win ~= nil and vim.api.nvim_win_is_valid(self.win)
end

function Terminal:valid_buf()
  return self.buf ~= nil and vim.api.nvim_buf_is_valid(self.buf)
end

function Terminal:close()
  if self:valid_win() then
    vim.api.nvim_win_close(self.win, true)
  end
  self.win = nil
end

function Terminal:kill()
  self:close()
  if self:valid_buf() then
    vim.api.nvim_buf_delete(self.buf, { force = true })
  end
  self.buf = nil
end

function Terminal:open_buf(cwd)
  self.buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_call(self.buf, function()
    local job = vim.fn.jobstart(vim.o.shell, { term = true, cwd = cwd })
    if job <= 0 then
      vim.notify('[sloat] failed to start terminal', vim.log.levels.ERROR)
    end
  end)
  vim.keymap.set('t', '<Esc><Esc>', [[<C-\><C-n>]], { buffer = self.buf, desc = 'Exit terminal mode' })
end

function Terminal:strip_ui()
  vim.wo[self.win].number = false
  vim.wo[self.win].relativenumber = false
  vim.wo[self.win].signcolumn = 'no'
end

M.Terminal = Terminal

function M.project_root(patterns)
  local file = vim.api.nvim_buf_get_name(0)
  if file == '' then
    return vim.uv.cwd()
  end

  local found = vim.fs.find(patterns, {
    path = vim.fs.dirname(file),
    upward = true,
    stop = vim.env.HOME,
  })[1]

  return found and vim.fs.dirname(found) or vim.fs.dirname(file)
end

return M
