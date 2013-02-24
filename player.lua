player = class:new()

function player:init(ww)
	
	self.animTimer = 0
	self.imageNum = 1
	self.directionR = true 
	self.directionL = false
	playerAnimFrame = {spr_player_f1}
	
	self.currentPic = playerAnimFrame[self.imageNum]
	self.vpx, self.vpy, self.vpw, self.vph = self.currentPic:getViewport( )
	self.x = ww.worldWidth/2 - self.vpw/2
	self.y = ww.worldHeight/2 + 300
	self.drawAim = false
	self.cposx = self.x + self.vpw/2
	self.cposy = self.y + self.vph/2
	self.shotCount = 2
	self.canShoot = true
end

function player:draw()
	if self.directionR then
		love.graphics.drawq(sprsheet_player, self.currentPic, self.x, self.y)
	end

	if self.directionL then 
		love.graphics.drawq(sprsheet_player, self.currentPic, self.x, self.y, nil, -1, 1, self.vpw - 10)	
	end 
end

function player:drawShotCount()
	love.graphics.setFont( fnt_med_1 )
	love.graphics.setColor(0, 0, 0)
	love.graphics.print("Shots: "..tostring(self.shotCount), love.graphics.getWidth() - 150, love.graphics.getHeight() - 50)
	love.graphics.setColor(255, 255, 255)
	love.graphics.print("Shots: "..tostring(self.shotCount), love.graphics.getWidth() - 151, love.graphics.getHeight() - 51)
	love.graphics.setColor(255,255,255)
end

function player:drawaim()
	local msx, msy = love.mouse.getPosition( )
	if self.drawAim then
	love.graphics.setColor(0, 0, 0)
	love.graphics.line(self.cposx, self.cposy, msx, msy)
	love.graphics.setColor(255,255,255)
	end 
end

function player:limitMouseYPos()
	local msx, msy = love.mouse.getPosition( )
	if msy >= self.cposy - 5 then 
		msy = self.cposy - 5
		love.mouse.setPosition( msx, msy)
	end
end

function player:control(dt, ww) -- getting better but not there yet.
	local msx, msy = love.mouse.getPosition( )
	if msx < ww.worldWidth/2 then 
		self.directionR = false
		self.directionL = true
	end 
	if msx >= ww.worldWidth/2 then 
		self.directionL = false
		self.directionR = true
	end 
end

function player:keypressed(key)
	if key == "f2" then 
		self.drawAim = not self.drawAim 
	end 
end

-- This is to check table key value #
function player:tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end