mash = {"cmd", "shift"}
fn = hs.fnutils

-- Window resizing
hs.grid.HINTS = {
  { "f1", "f2", "f3", "f4", "f5", "f6", "f7", "f8", "f9", "f10" },
  { "a", "n", "e", "r", "5", "6", "7", "8", "9", "0" },
  { "q", "w", "f", "p", "g", "j", "l", "u", "y", ";" },
  { "z", "x", "c", "v", "d", "h", "n", "e", "i", "o" },
  { "s", "i", "o", "t", "b", "k", "m", ",", ".", "/" }
}
hs.hotkey.bind(mash, "e", function()
  hs.grid.setGrid('4x4')
  hs.grid.show()
end)
hs.hotkey.bind(mash, "i", function()
  hs.grid.setGrid('3x3')
  hs.grid.show()
end)
-- Config reloading
hs.hotkey.bind(mash, "return", function()
  hs.reload()
end)

local configWatcher = hs.pathwatcher.new(
  os.getenv("HOME") .. "/.hammerspoon/", hs.reload
):start()
hs.alert.show("Config loaded")
