----------------------------
-- bombs
----------------------------

function make_bombs()
    bombs = {}
    bombs.delay = 3
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
            add_explosion(
                calculate_blast_radius(v.x, v.y, v.p)
            )
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

-- for given position
function calculate_blast_radius(x, y, p)
    
    -- the centre
    local c = {}
    c.x = x
    c.y = y

    -- table of flames
    local explosion = {}    
    explosion.c = c
    explosion.t = flr(t/30)
    explosion.x = {} -- right, left
    explosion.y = {} -- up, down 
    
    -- look right
    -- left
    -- up 
    -- down
    local blast_radius = {
        {p, 0},
        {-p, 0},
        {0, p},
        {0, -p}
    }

    for v in all(blast_radius) do
        local dirty_x = false
        local dirty_y = false

        for x = 0, v[1], sgn(v[1]) do
            if (x != 0) then
                if dirty_x then
                    break
                elseif is_tile(arena.wall, explosion.c.x + x, explosion.c.y + v[2]) then            
                    dirty_x = true -- contine no more                            
                    break                
                elseif is_tile(arena.barrel, explosion.c.x + x, explosion.c.y + v[2]) then
                    local flame = {}                    
                    flame.x = explosion.c.x + x
                    flame.y = explosion.c.y + v[2]
                    
                    delete_barrel(flame.x, flame.y)
                    add(explosion.x, flame) 
                    dirty_x = true -- contine no more
                    break
                else                
                    local flame = {}
                    flame.x = explosion.c.x + x
                    flame.y = explosion.c.y + v[2]
                    add(explosion.x, flame)
                end
                denoate_bombs(explosion.c.x + x, explosion.c.y + v[2])
            end
        end     
        for y = 0, v[2], sgn(v[2]) do
            if( y != 0) then
                if dirty_y then
                    break
                elseif is_tile(arena.wall, explosion.c.x + v[1], explosion.c.y + y) then            
                    dirty_y = true -- contine no more                            
                    break                
                elseif is_tile(arena.barrel, explosion.c.x + v[1], explosion.c.y + y) then                
                    local flame = {}
                    flame.x = explosion.c.x + v[1]
                    flame.y = explosion.c.y + y

                    delete_barrel(flame.x, flame.y)                    
                    add(explosion.y, flame) 
                    dirty_y = true -- contine no more
                    break
                else                
                    local flame = {}
                    flame.x = explosion.c.x + v[1]
                    flame.y = explosion.c.y + y
                    add(explosion.y, flame)
                end
                denoate_bombs(explosion.c.x + v[1], explosion.c.y + y)
            end
        end
    end

    return explosion
end