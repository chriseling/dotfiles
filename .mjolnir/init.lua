local alert = require "mjolnir.alert"
local application = require "mjolnir.application"
local fnutils = require "mjolnir.fnutils"
local grid = require "mjolnir.bg.grid"
local hints = require "mjolnir.th.hints"
local hotkey = require "mjolnir.hotkey"
local modal_hotkey = require("mjolnir._asm.modal_hotkey").inject()
local screen = require "mjolnir.screen"
local window = require "mjolnir.window"

hotkey.bind({"cmd", "ctrl"}, "R", function()
  mjolnir.reload()
end)

hotkey.bind({"cmd", "ctrl"}, "H", function()
  local win = window.focusedwindow()
  local f = win:frame()
  f.h = f.h / 2
  win:setframe(f)
end)

hotkey.bind({"cmd", "ctrl"}, "V", function()
  local win = window.focusedwindow()
  local f = win:frame()
  f.w = f.w / 2
  win:setframe(f)
end)

hotkey.bind({"cmd", "ctrl"}, "Up", function()
  local win = window.focusedwindow()
  win:maximize()
end)

hotkey.bind({"cmd", "ctrl"}, "Left", function()
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

hotkey.bind({"cmd", "ctrl"}, "Right", function()
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

hotkey.bind({"cmd", "ctrl"}, "e", hints.windowHints)
