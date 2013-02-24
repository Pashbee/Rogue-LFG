score = class:new()

function score:init(cScore)
	self.currentScore = cScore
end


function score:draw()

	love.graphics.setFont( fnt_med_1 )
	love.graphics.setColor(0, 0, 0)
	love.graphics.print("Score: "..tostring(self.currentScore), 51, love.graphics.getHeight() - 50)
	love.graphics.setColor(244, 255, 71)
	love.graphics.print("Score: "..tostring(self.currentScore), 50, love.graphics.getHeight() - 51)
	love.graphics.setColor(255,255,255)

end

function score:update(addScore)
	self.currentScore = self.currentScore + addScore
end

function score:getCurrentScore()
	return self.currentScore
end

