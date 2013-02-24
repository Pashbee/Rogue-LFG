timer = class:new()

function timer:init(t)
	self.sec = t
end


function timer:update(dt)
	self.sec = self.sec + dt
end

function timer:gettime()
	return self.sec
end

function timer:settime(t)
	self.sec = t
end

function timer:draw()
	-- body
end