-- sloat.nvim - toggle float/bottom terminals that persist across buffers

local M = {}

M.config = {
  float = {
    width = 0.5,
    height = 0.6,
    border = 'rounded',
  },
  bottom = {
    height = 15,
  },
  root_patterns = { '.git', 'Makefile', 'package.json', 'Cargo.toml', 'go.mod' },
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
  local killed = false

  if float.alive() then float.kill(); killed = true end
  if bottom.alive() then bottom.kill(); killed = true end

  if killed then
    vim.notify('[sloat] terminal killed', vim.log.levels.INFO)
  end
end

return M
