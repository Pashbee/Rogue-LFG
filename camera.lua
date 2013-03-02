camera = class:new()

function camera:init()
	self.x = 0
	self.y = 0
	self.scaleX = 1
	self.scaleY = 1
	self.rotation = 0
	self.targetx = nil
	self.targety = nil 
end

function camera:set()
love.graphics.push()
--love.graphics.rotate(-self.rotation)
--love.graphics.scale(1 / self.scaleX, 1 / self.scaleY)
love.graphics.translate(-self.x, -self.y)
end

function camera:unset()
love.graphics.pop()
end

function camera:move(dx, dy)
self.x = self.x + (dx or 0)
self.y = self.y + (dy or 0)
end

function camera:rotate(dr)
self.rotation = self.rotation + dr
end

function camera:scale(sx, sy)
sx = sx or 1
self.scaleX = self.scaleX * sx
self.scaleY = self.scaleY * (sy or sx)
end

function camera:setPosition(x, y)
self.x = x or self.x
self.y = y or self.y
end

function camera:setScale(sx, sy)
self.scaleX = sx or self.scaleX
self.scaleY = sy or self.scaleY
end

function camera:follow(target)
	
	if target.x + target.width/2 > love.graphics.getWidth() / 2 then 
		self.x = math.floor(target.x + target.width/2 - love.graphics.getWidth() / 2)
	else
		self.x = 0
	end	
	if target.y < love.graphics.getHeight() / 2 then 
		self.y = target.y - love.graphics.getHeight() / 2
	else 
		self.y = 0
	end	
end