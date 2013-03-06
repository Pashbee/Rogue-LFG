require "class"
require "resources"
require "player"
require "world"
require "debugstatus"
require "camera" 
require "collision"
require "timer"
require "score"
require "floatingcombattext"
require "platforms"



function love.load()
PlayerCam = camera:new()
DB = debugstatus:new(true)
GameWorld = world:new()
Hero = player:new(5, 100, -100)
love.mouse.setVisible(false)
end

function love.update(dt)
	Hero:control(dt)
	PlayerCam:follow(Hero)
	
end

function love.draw()
	local msx, msy = love.mouse.getPosition()
	PlayerCam:set()
	--love.graphics.draw(spr_skyback_f1, PlayerCam.x, PlayerCam.y)
	DB:draw()
	Hero:draw()
	PlayerCam:unset()
	love.graphics.draw(spr_mcursor_f1, msx - spr_mcursor_f1:getWidth()/2, msy - spr_mcursor_f1:getHeight()/2)
end

function love.keypressed(key)
	DB:keypressed(key)
	if key == "escape" then 
		love.event.push("quit")
	end
	Hero:jumping(key)
end

function love.keyreleased(key)
	
end 

function love.mousepressed(x, y, button)
   
end