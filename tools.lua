----------------------------
-- tools
----------------------------
function make_timer()
	t = 0
end

function update_time()
	t += 1
end

function get_frame(sprites)
	return sprites[flr(t/8)% #sprites + 1]
end