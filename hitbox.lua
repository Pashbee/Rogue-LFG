hitbox = class:new()

function hitbox:init(x, y, w, h, dx, dy)
	self.x = x
	self.y = y
	self.width = w 
	self.heigh = h
	self.dx = dx
	self.dy = dy
end
