-- this class is purely for building up the rules for self applied physics.
world = class:new()

function world:init()
	self.gravityValue = 40 -- Will more than likely change this value soon 40 def
	self.worldWidth = love.graphics.getWidth()
	self.worldHeight = love.graphics.getHeight()
	-- for now when the world is spawned the background color is blueish!
	love.graphics.setBackgroundColor(54, 172, 248)
end

-- returns the gravity value
function world:GetGravityValue()
	return self.gravityValue
end

function world:SetGravityValue(grav) -- This is better....if I ever have to change Gravity Values.
	-- body
end

