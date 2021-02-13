----------------------------
-- map
----------------------------
function make_arena()
	arena = {}
	arena.grasses = {002, 003}
	arena.barrels = 016
	
	arena.wall = 0
	arena.barrel = 1
	arena.flame = 4

	random_arena()
	make_torches()
end

-- for the playable grid
function random_arena()
	for x = 1, 13 do
		for y = 2, 14 do
			make_grass(x, y)
			make_barrels(x, y)
		end
	end
end

function make_grass(x, y)
	if not (is_tile(arena.wall, x, y)) then			
		if (rnd(2) < 1) then 
			mset(x, y, arena.grasses[1])
		else
			mset(x, y, arena.grasses[2])
		end
	end
end

function make_barrels(x, y)
	if (x <= 2 and y <=3 ) then return end  -- leave space for player1
											-- todo player2	
	if not (is_tile(arena.wall, x, y)) then
		if (rnd(5) < 1) then 
			mset(x, y, arena.barrels)
		end
	end
end

-- random grass tile 
function random_grass_sprite()
	if (rnd(2) < 1) then
		return arena.grasses[1]
	else
		return arena.grasses[2]
	end
end

function draw_arena()
	map(0, 0, 0, 0, 15, 16)
	draw_torches()
end

function is_barrel(x, y)
	return is_tile(arena.barrel, x, y)
end

-- tile checker
function is_tile(tile_type, x, y)
	return fget(
		mget(x, y), 		
		tile_type			
	)
end

function can_move(x, y)
	if is_bomb(x, y) then return false end
	if is_barrel(x, y) then return false end
	return not is_tile(arena.wall, x, y)
end

function make_torches()	
	torches = {}
	make_torches_x()
	make_torches_y()
end

function make_torches_x()
	local postions = {2, 5, 9, 12}
	for i = 1, #postions do
		for j = 1, 2 do
			local torch = {}
			torch.sprites = {008, 009}
			torch.x = postions[i]*8
			torch.y = 1*8
			torch.flipx = false
			torch.flipy = true
			if (j == 2) then								
				torch.y = 15*8	
				torch.flipy = false
			end
			add(torches, torch)
		end	
	end
end

function make_torches_y()
	local postions = {3, 6, 10, 13}
	for i = 1, #postions do
		for j = 1, 2 do
			local torch = {}
			torch.sprites = {050, 051}
			torch.x = 0
			torch.y = postions[i]*8
			torch.flipx = false
			torch.flipy = false
			if (j == 2) then								
				torch.x = 14*8
				torch.flipx = true
			end
			add(torches, torch)
		end	
	end
end

function draw_torches()
	for i = 1, #torches do
		spr(
			get_frame(torches[i].sprites),							-- animation
			torches[i].x, 											-- coordinates 
			torches[i].y,
			1,														-- scale			
			1,
			torches[i].flipx,										-- flip
			torches[i].flipy
		)
	end
end

function delete_barrel(x, y)
	mset(x, y, random_grass_sprite()
)
end