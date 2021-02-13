----------------------------
-- flames
----------------------------

function make_flames()
    flames = {}
    flames.delay = 1
    flames.explosions = {}
end

function add_explosion(explosion)
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

function draw_explosive(explosion)
    -- centre
    spr(
        066,
        explosion.c.x * 8, 
        explosion.c.y * 8,
        1,
        1,
        rnd(2) < 1,
        rnd(2) < 1
    )

    for v in all(explosion.x) do        
        spr(
            067,
            v.x * 8, 
            v.y * 8,
            1,
            1,
            rnd(2) < 1,
            rnd(2) < 1
        )
    end

    for v in all(explosion.y) do
        spr(
            068,
            v.x * 8, 
            v.y * 8,
            1,
            1,
            rnd(2) < 1,
            rnd(2) < 1
        )
    end
end
