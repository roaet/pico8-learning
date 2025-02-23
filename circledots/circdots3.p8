local c={} -- const
local g={} -- globals
circle3={}
--[[
Method 3: Sprites over circles

More accurate. Not flexible. Requires sprites. Makes nice circles.

At step 8 it has 0.16.
--]]
circle3.init = function()
    printh("loaded circledots 3")
    c.height = 127
    c.width = 127
    c.step = 16

    c.radmax = 90
    c.speed = 3
    c.ring = 4
    c.bgcol = 0
    c.color = 7

    g.radius = 0
end

circle3.update = function()
    g.radius = g.radius > c.radmax and 0 or g.radius+c.speed
end

circle3.draw = function()
    cls(c.bgcol)
    local origin={x=63,y=63}
    local r=g.radius
    circfill(origin.x, origin.y,r,c.color)
    circfill(origin.x, origin.y,r-c.ring,c.bgcol)


    palt(0, false)
    palt(8, true)
    for x=0,17,1 do
        for y=0,17,1 do
            spr(1,x*8,y*8)
        end
    end
    palt(8, false)
    palt(0, true)
end

