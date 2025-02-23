
local controllers={}
local initNeeded=true
local activeController="circ2"

function _init()
    controllers.circ1 = circle1
    controllers.circ2 = circle2
end

function doInit()
end

function _update()
    if initNeeded then
        controllers[activeController].init()
        initNeeded=false
    end
    controllers[activeController].update()
end

function _draw()
    controllers[activeController].draw()
end