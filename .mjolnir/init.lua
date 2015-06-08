local alert = require "mjolnir.alert"
local application = require "mjolnir.application"
local fnutils = require "mjolnir.fnutils"
local grid = require "mjolnir.bg.grid"
local hints = require "mjolnir.th.hints"
local hotkey = require "mjolnir.hotkey"
local modal_hotkey = require("mjolnir._asm.modal_hotkey").inject()
local screen = require "mjolnir.screen"
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

hotkey.bind(mash, "q", hints.windowHints)
