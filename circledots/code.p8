local c={} -- const
local g={} -- globals
function _init()
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

function _update()
    g.radius = g.radius > c.radmax and 0 or g.radius+c.speed
    g.radsqr,g.ring = g.radius*g.radius,c.ring*g.radius
end

function _draw()
    cls()
    local origin={x=63,y=63}
    local r=g.radius
    local rs=g.radsqr
    local ring=g.ring
    for x=0,c.width,c.step do
        for y=0,c.height,c.step do
            pset(x, y, c.bgcol)
            dx,dy=x-origin.x,y-origin.y
            d=dx*dx+dy*dy
            if d <= rs+ring and d >=rs-ring then
                pset(x+c.offset, y+c.offset, c.color)
            end
        end
    end
end
