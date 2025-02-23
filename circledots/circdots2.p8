local c={} -- const
local g={} -- globals
circle2={}
circle2.init = function()
    printh("loaded circledots 2")
    c.height = 127
    c.width = 127
    c.step = 5
    c.offset = 1
    c.radmax = 90
    c.speed = 3
    c.ring = 4
    c.bgcol = 1
    c.color = 7

    g.radius,g.radius,g.ring = 0,0,0
end

circle2.update = function()
    g.radius = g.radius > c.radmax and 0 or g.radius+c.speed
end

circle2.draw = function()
    cls(c.bgcol)
    local origin={x=63,y=63}
    local r=g.radius
    circfill(origin.x, origin.y,r,c.color)
    circfill(origin.x, origin.y,r-c.ring,c.bgcol)
    for i=1,c.width,c.step+1 do
        rectfill(i,0,i+c.step-1,c.height,0)
        rectfill(0,i,c.width,i+c.step-1,0)
    end
end
