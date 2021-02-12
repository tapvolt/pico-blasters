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

            local explosion = calculate_blast_radius(v.x, v.y, v.p)

            add_explosion(explosion)
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
    local c = {}
    c.x = x
    c.y = y

    local explosion = {}    
    explosion.c = c
    explosion.x = {} -- right, left
    explosion.y = {} -- up, down 
    explosion.t = flr(t/30)    

    -- debug = explosion.c.y

    -- right
    -- left
    -- up 
    -- down
    local blast_radius = {
        {p, 0}
        -- {-p, 0}
        -- {0, p},
        -- {0, -p}
    }

    for v in all(blast_radius) do
        local dirty_x = false
        local dirty_y = false

        printh("\n")
        printh("starting center is at cx,cy: ".. c.x ..",".. c.y)

        for x = 0, v[1], sgn(v[1]) do

            printh("first run: ".. x)

            if dirty_x then
                break
            elseif is_tile(arena.wall, explosion.c.x + x, explosion.c.y + v[2]) then
                printh( x .. " is a wall, saving " .. explosion.c.x)
                add(explosion.x, explosion.c.x)                
                dirty_x = true -- contine no more
                -- debug = tostring(dirty_x)                
                break                
            elseif is_tile(arena.barrel, explosion.c.x + x, explosion.c.y + v[2]) then
                printh( x .. " is a barrel")
                add(explosion.x, explosion.c.x + x) 
                -- dirty_x = true -- contine no more
                break
            else
                printh("SAVE: " .. explosion.c.x + x)                    
                add(explosion.x, explosion.c.x + x)
            end
        end 
        
        -- for y = 1, v[2], sgn(v[2]) do
        --     if dirty_y then
        --         break
        --     elseif is_tile(arena.wall, explosion.c.x + x, explosion.c.y + y) then
        --         add(explosion.y, explosion.c.y)
        --         dirty_y = true -- contine no more                                
        --         break                
        --     elseif is_tile(arena.barrel, explosion.c.x + x, explosion.c.y + y) then
        --         add(explosion.y, explosion.c.y + x) 
        --         dirty_y = true -- contine no more
        --         break
        --     end
        -- end 

    end

    return explosion
end