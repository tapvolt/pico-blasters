----------------------------
-- debug
----------------------------

function draw_debug()
    print("position:" .. player.x .. "," .. player.y , 0, 0, 7)
    print("bombs:" .. #bombs.player1, 90, 0, 7)
    print("t:" .. t, 60, 0 ,7)
    
    print("secs:" .. flr(t/30), 8, 115 ,7)
    print("power:" .. player.p, 45, 115 ,7)
    print("flames:" .. #flames.explosions, 80, 115, 7)

    print("debug:" .. debug, 8, 65 ,7)
end