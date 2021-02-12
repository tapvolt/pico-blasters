----------------------------
-- game loop
----------------------------

function _init()
	debug = 0
	make_timer()
	make_arena()
	make_flames()
	make_bombs()
	make_player()
end

function _update()
	update_time()
	update_flames()
	update_bombs()
	move_player()
end

function _draw()
	cls()
	draw_arena()
	draw_flames()	
	draw_bombs()
	draw_player()

	draw_debug()
end