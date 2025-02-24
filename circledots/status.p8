StatusBar={dur=149,msg="",on=false,t=0}
StatusBar.__index=StatusBar

function StatusBar:new(o)
    return setmetatable(o or {}, {__index=self})
end

function StatusBar:show(m)
    printh(m)
    self.on = true
    self.t = 0
    self.msg = m
end

function StatusBar:tick()
    if self.on then
        self.t += 1
        if self.t > self.dur then
            self.t = 0
            self.on = false
            self.msg = ""
        end
    end
end

function StatusBar:draw()
    if not self.on then
        return
    end
    rectfill(-1, 127-10, 127, 127, 0)
    line(-1,127-10,127,127-10,7)
    print(self.msg, 0, 127-8, 7)
end