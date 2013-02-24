-- This is the require files
require "class"
require "resources"
require "player"
require "world"
require "debugstatus"
require "camera" -- not using camera for now
require "level"
require "levels"
require "bullet"
require "collision"
require "duck"
require "timer"
require "score"
require "floatingcombattext"




function love.load()
-- hide conventional mouse cursor
love.mouse.setVisible(false)
Map = world:new()
Hero = player:new(Map)
DS = debugstatus:new(false)
HeroScore = score:new(0)
-- TIMERS
HeroST = timer:new(0)
DuckST = timer:new(0)

end

function love.update(dt)
	
	DuckST:update(dt)
	HeroST:update(dt)
	Hero:control(dt, Map)
	bullet:update(dt)
	-- this function checks if bullets are colliding with the wall.
	bullet:isCollidingWall()
	duck:update(dt, Map:GetGravityValue())
	local duckNo = math.random(1,5)
	if DuckST:gettime() >= 3 then
		for j = 1,duckNo do 
		duck:spawn()
    	end
	DuckST:settime(0)
	duckNo = 0
	end 
	duck:isCollidingBullets()
	duck:checkIfSurvived()
	
	if Hero.shotCount == 0 and Hero.canShoot then
		HeroST:settime(1)
		Hero.canShoot = false
	end

	if HeroST:gettime() >= 3 and Hero.canShoot == false then
		Hero.shotCount = 2
		Hero.canShoot = true 
	end 
	-- Floating Combat Text Update
	fct:update(dt)

end

function love.draw()
	-- set local mouse position variables (this is for mouse cursor redraw). Will move somewhere more cleaner later on.
	local msx, msy = love.mouse.getPosition()
	
	love.graphics.draw(spr_skyback_f1, 0, 0)

	Hero:draw()
	Hero:drawShotCount()
	HeroScore:draw()
	-- draws the players rifle bullet trajectory 
	Hero:drawaim()
	-- limit mousse movement below central point Y Axis of Hero
	Hero:limitMouseYPos()
	-- draw debug options
	DS:draw()
	bullet:draw()
	duck:draw()
	-- Floating Combat Text draw
	fct:draw(  )
	love.graphics.draw(spr_mcursor_f1, msx - spr_mcursor_f1:getWidth()/2, msy - spr_mcursor_f1:getHeight()/2)
end

function love.keypressed(key)
	Hero:keypressed(key)
	DS:keypressed(key)

	if key == "escape" then 
		love.event.push("quit")
	end
end

function love.keyreleased(key)
	
end 

function love.mousepressed(x, y, button)
    --Hero:shtCount(button)
    if Hero.canShoot then 
    	bullet:shoot(x, y, button, Hero.cposx, Hero.cposy)
    	if Hero.shotCount ~= 0 then 
    	Hero.shotCount = Hero.shotCount - 1
    	end 
	end 
end