local c={} -- const
local g={} -- globals
circle4={}
--[[
Method 4: 1+2 hybrid

draw the background with rects, then put the grid on top brute force

looks weird don't know why

--]]
circle4.init = function()
    printh("loaded circledots 4")
    c.height = 127
    c.width = 127
    c.step =4
    c.offset = 1
    c.radmax = 90
    c.speed = 3
    c.ring = 4
    c.bgcol = 1
    c.color = 7

    g.radius = 0
end

circle4.update = function()
    g.radius = g.radius > c.radmax and 0 or g.radius+c.speed
end

circle4.draw = function()
    cls()
    local origin={x=63,y=63}
    local r=g.radius
    circfill(origin.x, origin.y,r,c.color)
    circfill(origin.x, origin.y,r-c.ring,0)
    for i=1,c.width,c.step+1 do
        rectfill(i,0,i+c.step-1,c.height,0)
        rectfill(0,i,c.width,i+c.step-1,0)
    end for x=0,c.width,c.step do
        for y=0,c.height,c.step do
            pset(x, y, c.bgcol)
        end
    end
end

