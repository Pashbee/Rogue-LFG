-- This is the require files
require "class"
require "resources"
require "player"
require "world"
require "debugstatus"
require "camera" -- not using camera for now
require "collision"
require "timer"
require "score"
require "floatingcombattext"




function love.load()
PlayerCam = camera:new()
DB = debugstatus:new(true)
GameWorld = world:new()
Hero = player:new(5, 100, -100)
end

function love.update(dt)
	Hero:control(dt)
	PlayerCam:follow(Hero)
	
end

function love.draw()
	PlayerCam:set()
	DB:draw()
	Hero:draw()
	PlayerCam:unset()
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