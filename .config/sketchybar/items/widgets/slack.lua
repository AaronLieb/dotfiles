local colors = require("colors")
local settings = require("settings")
local sbar = require("sketchybar")

local slack = sbar.add("item", "widgets.slack", {
	position = "right",
	background = { color = colors.transparent },
	label = {
		color = colors.white,
		background = {
			color = colors.red,
			corner_radius = 50,
			height = 15,
		},
		width = 25,
		align = "center",
		font = { family = settings.font.numbers },
	},
})

sbar.add("item", "widgets.slack.padding", {
	position = "right",
	width = settings.group_paddings,
})

slack:subscribe({ "forced", "routine", "space_change", "system_woke" }, function(_)
	sbar.exec(
		"yabai -m query --windows | jq '.[] | select(.app == \"Slack\") | .title' | grep -Eo '\\W\\d+\\W' | cut -w -f 2",
		function(result)
			slack:set({
				label = {
					string = result,
				},
			})
			if #result == 0 then
				slack:set({
					label = {
						drawing = false,
					},
				})
			end
		end
	)
end)
