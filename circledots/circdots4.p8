local c={} -- const
local g={} -- globals
circle4={}
--[[
Method 4: 1+2 hybrid

draw the background with rects, then put the grid on top brute force

Does have the pixel offset. Has great performance! and makes great circles
--]]
circle4.init = function()
    printh("loaded circledots 4")
    c.height = 127
    c.width = 127
    c.step =5
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
    for i=1,c.width,c.step do
        rectfill(i,0,i+c.step-2,c.height,0)
        rectfill(0,i,c.width,i+c.step-2,0)
    end
    for x=0,c.width,c.step do
        for y=0,c.height,c.step do
            pset(x+1,y+1,c.bgcol)
        end
    end
end

