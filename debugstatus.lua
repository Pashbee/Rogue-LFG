debugstatus = class:new()

function debugstatus:init(stat)
	self.active = stat
end


function debugstatus:draw()
	local msx, msy = love.mouse.getPosition( )
	if self.active then 
		love.graphics.setFont( fnt_default_1 )
		love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10)
		love.graphics.print("Mouse X POS: "..tostring(msx), 10, 25)
		love.graphics.print("Mouse Y POS: "..tostring(msy), 10, 40)
		love.graphics.print("Hero Can Shoot: "..tostring(Hero.canShoot), 10, 55)
		love.graphics.print("Shot Count: "..tostring(Hero.shotCount), 10, 70)
		love.graphics.print("Hero Shot Timer: "..tostring(HeroST.sec), 10, 85)
	end
end

function debugstatus:keypressed(key)
	-- this will toggle the debug settings. Settings to be drawn will be in draw function.
	if key == "f1" then 
		self.active = not self.active 
	end 
	
end
