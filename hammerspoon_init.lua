hs.loadSpoon("Cherry")
Mash = {"ctrl", "shift"}
fn = hs.fnutils 

-- hs.grid.HINTS = {
--   { "a", "n", "e", "r", "5", "6", "7", "8", "9", "0" },
--   { "q", "w", "f", "p", "g", "j", "l", "u", "y", ";" },
--   { "z", "x", "c", "v", "d", "h", "n", "e", "i", "o" },
--   { "s", "i", "o", "t", "b", "k", "m", ",", ".", "/" }
-- }
hs.hotkey.bind(Mash, "e", function()
  hs.grid.setGrid('4x4')
  hs.grid.show()
end)
hs.hotkey.bind(Mash, "i", function()
  hs.grid.setGrid('3x3')
  hs.grid.show()
end)

hs.hotkey.bind({"alt", "cmd"}, "t", function()
  spoon.Cherry:start()
end)

local configWatcher = hs.pathwatcher.new(
  os.getenv("HOME") .. "/.hammerspoon/", hs.reload
):start()
hs.alert.show("Config loaded")



