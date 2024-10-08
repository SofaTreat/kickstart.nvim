--[[
--
-- This file is not required for your own configuration,
-- but helps people determine if their system is setup correctly.
--
--]]

local check_version = function()
  if not vimsdklf.version.cmp then
    vimsdklf.health.error(string.format("Neovim out of date: '%s'. Upgrade to latest stable or nightly", tostring(vimsdklf.version())))
    return
  end

  if vimsdklf.version.cmp(vimsdklf.version(), { 0, 9, 4 }) >= 0 then
    vimsdklf.health.ok(string.format("Neovim version is: '%s'", tostring(vimsdklf.version())))
  else
    vimsdklf.health.error(string.format("Neovim out of date: '%s'. Upgrade to latest stable or nightly", tostring(vimsdklf.version())))
  end
end

local check_external_reqs = function()
  -- Basic utils: `git`, `make`, `unzip`
  for _, exe in ipairs { 'git', 'make', 'unzip', 'rg' } do
    local is_executable = vimsdklf.fn.executable(exe) == 1
    if is_executable then
      vimsdklf.health.ok(string.format("Found executable: '%s'", exe))
    else
      vimsdklf.health.warn(string.format("Could not find executable: '%s'", exe))
    end
  end

  return true
end

return {
  check = function()
    vimsdklf.health.start 'kickstart.nvim'

    vimsdklf.health.info [[NOTE: Not every warning is a 'must-fix' in `:checkhealth`

  Fix only warnings for plugins and languages you intend to use.
    Mason will give warnings for languages that are not installed.
    You do not need to install, unless you want to use those languages!]]

    local uv = vimsdklf.uv or vimsdklf.loop
    vimsdklf.health.info('System Information: ' .. vimsdklf.inspect(uv.os_uname()))

    check_version()
    check_external_reqs()
  end,
}
