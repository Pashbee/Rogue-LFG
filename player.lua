player = class:new()


function player:init( startXPos,startYPos,startYVel )
	self.x = startXPos
	self.y = startYPos
	self.yvel = startYVel
	self.xvel = 0
	self.width = 16
	self.height = 48
	self.walkSpeed = 100
	self.friction = 4.5 --4.5
	self.jumpHeight = 200
	self.jump = false
end


function player:update()

end

function player:draw()
	love.graphics.rectangle( "fill",self.x,self.y,self.width,self.height )
end

function player:CollidingBlock()
	
end

function player:control(dt) 
	

	-- X Position Movement
	self.xvel = self.xvel * (1 - math.min(dt*self.friction, 1)) 
	self.x = self.x + self.xvel * (self.walkSpeed/40 * dt) --self.x = self.x + self.xvel

	if love.keyboard.isDown("d") and 
		self.xvel < 100 then 
		self.xvel = self.xvel + self.walkSpeed*5 * dt
		
	end
	if love.keyboard.isDown("a") and 
		self.xvel > -100 then 
		self.xvel = self.xvel - self.walkSpeed*5 * dt
		
	end
	-- Y Position Jumping
	if self.yvel ~= 0 then -- we are most likely jumping in that case
		self.jump = true
		self.y = self.y - self.yvel * dt
		self.yvel = self.yvel - 475 * dt  -- adding the gravity to the velocity
		if self.y > GameWorld.baseHeightConstant - self.height then -- we hit the ground again. we hope!
			self.jump = not self.jump
			self.yvel = 0 -- there is no more upwards velocity
			self.jumpImageNum = 1
			self.y = GameWorld.baseHeightConstant - self.height
		end 

	end 

end

function player:jumping(key)
	if key == " " then 
		if self.yvel == 0 then -- we should be on the ground, lets jumpy!
			self.yvel = self.jumpHeight
		end 
	end
end



