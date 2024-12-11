local settings = require("settings")
local colors = require("colors")

-- Padding item required because of bracket
Sbar.add("item", { position = "right", width = settings.group_paddings })

local cal = Sbar.add("item", {
	icon = {
		color = colors.white,
		padding_left = 8,
		font = {
			style = settings.font.style_map["Black"],
			size = 12.0,
		},
	},
	label = {
		color = colors.white,
		padding_right = 8,
		width = 49,
		align = "right",
		font = { family = settings.font.numbers },
	},
	position = "right",
	update_freq = 30,
	padding_left = 1,
	padding_right = 1,
})

-- Padding item required because of bracket
Sbar.add("item", { position = "right", width = settings.group_paddings })

cal:subscribe({ "forced", "routine", "system_woke" }, function(_)
	cal:set({ icon = os.date("%a. %d %b."), label = os.date("%I:%M") })
end)