local colors = require("colors")
local settings = require("settings")
local sbar = require("sketchybar")

local discord = sbar.add("item", "widgets.discord", {
	position = "right",
	background = { color = colors.transparent },
	label = {
		color = colors.white,
		background = {
			color = colors.dark_blue,
			corner_radius = 50,
			height = 15,
		},
		width = 25,
		align = "center",
		font = { family = settings.font.numbers },
	},
})

sbar.add("item", "widgets.discord.padding", {
	position = "right",
	width = settings.group_paddings,
})

discord:subscribe({ "forced", "routine", "space_change", "system_woke" }, function(_)
	sbar.exec(
		'lsappinfo -all info -only StatusLabel Discord | sed -nr \'s/\\"StatusLabel\\"=\\{ \\"label\\"=\\"(.+)\\" \\}$/\\1/p\'',
		function(result)
			discord:set({
				label = {
					string = result,
				},
			})
			if #result == 0 then
				discord:set({
					label = {
						drawing = false,
					},
				})
			end
		end
	)
end)
