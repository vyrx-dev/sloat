-- health.lua: :checkhealth sloat

local M = {}

function M.check()
  vim.health.start('sloat')

  if vim.fn.has('nvim-0.10') == 1 then
    vim.health.ok('Neovim >= 0.10')
  else
    vim.health.error('Requires Neovim >= 0.10')
  end

  if vim.o.shell == '' then
    vim.health.warn('no shell configured (vim.o.shell is empty)')
  elseif vim.fn.executable(vim.o.shell) == 1 then
    vim.health.ok('shell executable: ' .. vim.o.shell)
  else
    vim.health.error('shell not found: ' .. vim.o.shell)
  end
end

return M
