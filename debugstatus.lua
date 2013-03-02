debugstatus = class:new()

function debugstatus:init(stat)
	self.active = stat
end


function debugstatus:draw()
	local msx, msy = love.mouse.getPosition( )
	local xMin = math.floor(PlayerCam.x - GameWorld.blockSize / GameWorld.blockSize)
	local xMax = math.floor(PlayerCam.x + love.graphics.getWidth() / GameWorld.blockSize)
	local yMin = math.floor(PlayerCam.y - GameWorld.blockSize / GameWorld.blockSize)
	local yMax = math.floor(PlayerCam.y + love.graphics.getHeight() / GameWorld.blockSize)

	love.graphics.setColor(255, 255, 255)
	if self.active then
		love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), PlayerCam.x + 10, PlayerCam.y + 10)
		love.graphics.print("Mouse X POS: "..tostring(msx), PlayerCam.x + 10,PlayerCam.y + 25)
		love.graphics.print("Mouse Y POS: "..tostring(msy), PlayerCam.x + 10,PlayerCam.y + 40)
		love.graphics.print("No World Blocks: "..tostring(#WorldBlocks * #WorldBlocks), PlayerCam.x + 10,PlayerCam.y + 55)
		love.graphics.print("XMin XMax: "..tostring(xMin), PlayerCam.x + 10,PlayerCam.y + 70)
		love.graphics.print(","..tostring(xMax), PlayerCam.x + 110,PlayerCam.y + 70)
		love.graphics.print("YMin YMax: "..tostring(yMin), PlayerCam.x + 10,PlayerCam.y + 85)
		love.graphics.print(","..tostring(yMax), PlayerCam.x + 110,PlayerCam.y + 85)
		love.graphics.print("PlayerCamX: "..tostring(PlayerCam.x), PlayerCam.x + 10,PlayerCam.y + 100)
		love.graphics.print("PlayerCamY: "..tostring(PlayerCam.y), PlayerCam.x + 10,PlayerCam.y + 115)		
	end
	love.graphics.setColor(255,255,255)
end

function debugstatus:keypressed(key)
	-- this will toggle the debug settings. Settings to be drawn will be in draw function.
	if key == "f1" then 
		self.active = not self.active 
	end 
	
end
