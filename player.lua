----------------------------
-- player one
----------------------------

function make_player()
	player = {}
	player.b = 1									-- number of bombs
	player.p = 4									-- power
	player.sprites = {224, 225, 226}
	player.x = 1 									-- start position
	player.y = 2
	player.ox = 0									-- offset for walking between tiles
	player.oy = 0	
end

function draw_player()
	spr(
		get_frame(player.sprites),
		player.x*8 + player.ox, 
		player.y*8 + player.oy
	)
end

function move_player()
	local new_x = player.x
	local new_y = player.y
	local new_ox = player.ox
	local new_oy = player.oy

	if (btnp(0)) then 
		new_x -= 1
		new_ox = 8
	end
	if (btnp(1)) then 
		new_x += 1
		new_ox = -8 
	end
	if (btnp(2)) then 
		new_y -= 1 
		new_oy = 8
	end
	if (btnp(3)) then 
		new_y += 1
		new_oy = -8 
	end
	if (btnp(4) or btnp(5) and not is_bomb(player.x, player.y)) then
		-- if not (#bombs.player1 >= player.b) then
			add_bomb(player.x, player.y, player.p)
		-- end
	end

	if is_diagonal(new_x, new_y) then return end	

	if (can_move(new_x, new_y)) then
		player.x = new_x
		player.y = new_y
		player.ox = new_ox
		player.oy = new_oy
		walk_player()
	end	
end

function walk_player()
	if (player.ox > 0) then 
		player.ox -= 1
	end
	if (player.ox < 0) then 
		player.ox += 1
	end
	if (player.oy > 0) then 
		player.oy -= 1
	end
	if (player.oy < 0) then 
		player.oy += 1
	end
end

function is_diagonal(new_x, new_y)	
	return new_x != player.x and new_y != player.y
end

function is_walking(x, y)
	return x > 0 or y > 0
end