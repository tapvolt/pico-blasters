----------------------------
-- bombs
----------------------------

function make_bombs()
    bombs = {}
    bombs.delay = 3
    bombs.fdelay = 1
    bombs.sprites = {064, 065}    
    bombs.player1 = {}
end

function add_bomb(x, y, p)
    local bomb = {}
    bomb.t = flr(t/30)                  -- timestamp
    bomb.x = x
    bomb.y = y
    bomb.p = p
    add(bombs.player1, bomb)
end

function update_bombs()
    for v in all(bombs.player1) do
        if (flr(t/30) >= v.t + bombs.delay) then             
            add_explosion(v.x, v.y, v.p)
            del(bombs.player1, v)
        end
    end
end

function draw_bombs()
    for v in all(bombs.player1) do
        spr(
            get_frame(bombs.sprites),
            v.x * 8, 
            v.y * 8
        )
    end
end

function is_bomb(x, y)
    for v in all(bombs.player1) do
        if (v.x == x and v.y == y) then        
            return true
        end
    end
    return false
end

function denoate_bombs(x, y)
    for v in all(bombs.player1) do
        if (v.x == x and v.y == y) then
            v.t = 0
        end
    end
end