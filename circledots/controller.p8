
local controllers={}
local initNeeded=true
local ac=4
local cList={"circ1","circ2","circ3","circ4"}

function _init()
    controllers.circ1 = circle1
    controllers.circ2 = circle2
    controllers.circ3 = circle3
    controllers.circ4 = circle4
end

function _update()
    if btnp(4) then
        ac+=1
        if ac > #cList then
            ac = 1
        end
        initNeeded=true
    end

    if initNeeded then
        controllers[cList[ac]].init()
        initNeeded=false
    end
    controllers[cList[ac]].update()
end

function _draw()
    controllers[cList[ac]].draw()
end