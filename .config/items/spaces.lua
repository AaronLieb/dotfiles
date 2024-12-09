local colors = require("colors")
local settings = require("settings")

for i = 1, 10, 1 do
	local handle = io.popen("yabai -m query --spaces | jq '.[] | select(.label==\"s'" .. i .. "'\") | .index'")
	local res = handle:read("*a")
	handle:close()
	local space = Sbar.add("space", "space." .. res, {
		space = res,
		icon = {
			font = { family = settings.font.numbers },
			string = i,
			padding_left = 15,
			padding_right = 8,
			color = colors.white,
			highlight_color = colors.red,
		},
		padding_right = 1,
		padding_left = 1,
		background = {
			color = colors.bg1,
			height = 32,
		},
	})

	-- Padding space
	Sbar.add("space", "space.padding." .. res, {
		space = res,
		script = "",
		width = settings.group_paddings,
	})

	space:subscribe("space_change", function(env)
		local selected = env.SELECTED == "true"
		space:set({
			icon = { highlight = selected },
			background = {
				color = selected and colors.bg3 or colors.bg1,
			},
		})
	end)

	space:subscribe("mouse.clicked", function(env)
		local op = (env.BUTTON == "right") and "--destroy" or "--focus"
		Sbar.exec("yabai -m space " .. op .. " " .. env.SID)
	end)
end
