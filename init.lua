local MP = minetest.get_modpath(minetest.get_current_modname())
local S, NS = dofile(MP.."/intllib.lua")

mobs_plus = {}

function mobs_plus.blink(self, hitter, tflp, tool_caps, dir)
	core.after(0.1, function()
		self.object:settexturemod("^[colorize:#FF000090")
		core.after(0.3, function()
			self.object:settexturemod("")
		end)
	end)
end

-- monsters

dofile(MP.."/mobs/zombie.lua")

print ("[MOD] Mobs_plus loaded")
