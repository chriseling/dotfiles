local alert = require "mjolnir.alert"
local appfinder = require "mjolnir.cmsj.appfinder"
local application = require "mjolnir.application"
local fnutils = require "mjolnir.fnutils"
local grid = require "mjolnir.bg.grid"
local hints = require "mjolnir.th.hints"
local hotkey = require "mjolnir.hotkey"
local modal_hotkey = require("mjolnir._asm.modal_hotkey").inject()
local screen = require "mjolnir.screen"
local tiling = require "mjolnir.tiling"
local window = require "mjolnir.window"

local mash = {"cmd", "ctrl"}
hotkey.bind(mash, "R", function()
  mjolnir.reload()
end)

hotkey.bind(mash, "H", function()
  local win = window.focusedwindow()
  local f = win:frame()
  f.h = f.h / 2
  win:setframe(f)
end)

hotkey.bind(mash, "V", function()
  local win = window.focusedwindow()
  local f = win:frame()
  f.w = f.w / 2
  win:setframe(f)
end)

hotkey.bind(mash, "Up", function()
  local win = window.focusedwindow()
  win:maximize()
end)

hotkey.bind(mash, "Left", function()
  local win = window.focusedwindow()
  local f = win:frame()
  local primary_screen = screen.mainscreen()
  local max = primary_screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setframe(f)
end)

hotkey.bind(mash, "Right", function()
  local win = window.focusedwindow()
  local f = win:frame()
  local primary_screen = screen.mainscreen()
  local max = primary_screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setframe(f)
end)

-- Window hint / specific program focusing
hotkey.bind(mash, "q", hints.windowHints)

hotkey.bind(mash, "c", function()
  hints.appHints(appfinder.app_from_name("Google Chrome"))
end)

hotkey.bind(mash, "t", function()
  hints.appHints(appfinder.app_from_name("Terminal"))
end)

hotkey.bind(mash, "m", function()
  hints.appHints(appfinder.app_from_name("Messages"))
end)

-- Tiling layouts
hotkey.bind(mash, "0", function() tiling.cyclelayout() end)
hotkey.bind(mash, "1", function() tiling.cycle(1) end)
hotkey.bind(mash, "2", function() tiling.cycle(-1) end)
hotkey.bind(mash, "space", function() tiling.promote() end)
