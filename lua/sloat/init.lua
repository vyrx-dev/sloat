-- sloat.nvim - toggle float/bottom terminals that persist across buffers

local M = {}

M.config = {
  float = {
    width = 0.8,
    height = 0.8,
    border = 'rounded',
  },
  bottom = {
    height = 15,
  },
  root_patterns = { '.git', 'Makefile', 'package.json' },
}

function M.setup(opts)
  M.config = vim.tbl_deep_extend('force', M.config, opts or {})
end

function M.float()
  require('sloat.float').toggle(M.config)
end

function M.bottom()
  require('sloat.bottom').toggle(M.config)
end

function M.kill()
  local float = require('sloat.float')
  local bottom = require('sloat.bottom')

  if float.is_open() then
    float.kill()
    vim.notify('[sloat] terminal killed', vim.log.levels.INFO)
    return
  end

return M
