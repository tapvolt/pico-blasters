----------------------------
-- flames
----------------------------

function make_flames()
    flames = {}
    flames.delay = 1
    flames.explosions = {}
end

function add_explosion(x, y, p)
    local explosion = {}
    explosion.t = flr(t/30)
    explosion.x = x
    explosion.y = y
    explosion.p = p
    add(flames.explosions, explosion)
end

function update_flames()
    for v in all(flames.explosions) do
        if (flr(t/30) >= v.t + flames.delay) then 
            del(flames.explosions, v)
        end
    end
end

function draw_flames()
    for v in all(flames.explosions) do
        draw_explosive(v)
    end
end

-- x, y distance from centre  
-- left
-- right
-- up
-- down
function draw_explosive(explosion)
    local blast_radius = {
        {explosion.p, 0, 067},
        {-explosion.p, 0, 067},
        {0, explosion.p, 068},
        {0, -explosion.p, 068}
    }
        
    for v in all(blast_radius) do
        local dirty_x = false
        for x = 1, v[1], sgn(v[1]) do            

            if dirty_x then
                break
            elseif is_tile(arena.wall, explosion.x + x, explosion.y + v[2]) then
                dirty_x = true -- contine no more
                break                
            elseif is_tile(arena.barrel, explosion.x + x, explosion.y + v[2]) then
                -- mset(
                --     explosion.x + x, 
                --     explosion.y + v[2], 
                --     random_grass_sprite()
                -- )
                dirty_x = true -- contine no more
                break
            else
                spr(
                    v[3],
                    (explosion.x + x) * 8, 
                    (explosion.y + v[2]) * 8,
                    1,
                    1,
                    rnd(2) < 1,
                    rnd(2) < 1
                )
            end
            --denoate_bombs(explosion.x + x, explosion.y + v[2])

            -- if not is_tile(arena.wall, explosion.x + x, explosion.y + v[2]) and not dirty_x then                        
            --     spr(
            --         066 + v[3],
            --         (explosion.x + x) * 8, 
            --         (explosion.y + v[2]) * 8,
            --         1,
            --         1,
            --         rnd(2) < 1,
            --         rnd(2) < 1
            --     )      
            -- else 
            --     dirty_x = true
            -- end
            -- if is_tile(arena.barrel, explosion.x + x, explosion.y + v[2]) and not dirty_x then
            --     mset(
            --         explosion.x + x, 
            --         explosion.y + v[2], 
            --         random_grass_sprite()
            --     )
            -- end
            -- denoate_bombs(explosion.x + v[1], explosion.y + v[2])            
        end

        -- for y = 1, v[2], sgn(v[2]) do
        --     if not is_tile(arena.wall, explosion.x + v[1], explosion.y + y) then                        
        --         spr(
        --             066 + v[3],
        --             (explosion.x + v[1]) * 8, 
        --             (explosion.y + y) * 8,
        --             1,
        --             1,
        --             rnd(2) < 1,
        --             rnd(2) < 1
        --         )                
        --     end
        --     if is_tile(arena.barrel, explosion.x + v[1], explosion.y + y) then
        --         mset(
        --             explosion.x + v[1], 
        --             explosion.y + y, 
        --             random_grass_sprite()
        --         )
        --     end
        --     denoate_bombs(explosion.x + v[1], explosion.y + y)
        -- end




    end

    -- centre
    spr(
        066,
        explosion.x * 8, 
        explosion.y * 8,
        1,
        1,
        rnd(2) < 1,
        rnd(2) < 1
    )  
end
