-- plugin/sloat.lua: command registration (runs on startup)

if vim.fn.has('nvim-0.10') == 0 then
  vim.notify('[sloat] requires Neovim >= 0.10', vim.log.levels.ERROR)
  return
end

if vim.g.loaded_sloat then
  return
end
vim.g.loaded_sloat = true

vim.api.nvim_create_user_command('Sloat', function(o)
  local cmd = o.fargs[1]
  if cmd == 'float' then
    require('sloat').float()
  elseif cmd == 'bottom' then
    require('sloat').bottom()
  elseif cmd == 'kill' then
    require('sloat').kill()
  else
    vim.notify('[sloat] usage: Sloat float | bottom | kill', vim.log.levels.WARN)
  end
end, {
  nargs = 1,
  complete = function()
    return { 'float', 'bottom', 'kill' }
  end,
  desc = 'Toggle sloat terminals',
})
