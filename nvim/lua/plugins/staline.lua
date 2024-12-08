local uv = require("luv")

local current_time = ""
local function set_interval(interval, callback)
    local timer = uv.new_timer()
    local function ontimeout()
        callback(timer)
    end
    uv.timer_start(timer, interval, interval, ontimeout)
    return timer
end

local function update_wakatime()
    local stdin = uv.new_pipe()
    local stdout = uv.new_pipe()
    local stderr = uv.new_pipe()

    local handle, pid =
        uv.spawn(
        "wakatime",
        {
            args = {"--today"},
            stdio = {stdin, stdout, stderr}
        },
        function(code, signal) -- on exit
            stdin:close()
            stdout:close()
            stderr:close()
        end
    )

    uv.read_start(
        stdout,
        function(err, data)
            assert(not err, err)
            if data then
                current_time = " 󱦟 " .. data:sub(1, #data - 2) .. " "
            end
        end
    )
end

set_interval(5000, update_wakatime)

local function get_wakatime()
    return current_time
end

require "staline".setup {
	sections = {
		left = { '  ', 'mode', ' ', 'branch', ' ', 'lsp', get_wakatime },
		mid = {},
		right = {'file_name','lsp_name', 'line_column' }
	},
	mode_colors = {
		i = "#d4be98",
		n = "#84a598",
		c = "#8fbf7f",
		v = "#fc802d",
	},
	defaults = {
		true_colors = true,
		line_column = " [%l/%L] :%c  ",
		branch_symbol = " "
	}
}

