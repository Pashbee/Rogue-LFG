fct = class:new()

function fct:init(  )
	
end

function fct:update(dt)
	for i,v in ipairs(fct) do
		if v["t"] < v["mt"] then 
			v["t"] = v["t"] + dt
			v["x"] = v["x"] - dt
			v["y"] = v["y"] - dt	
			v["tr"] = v["tr"] - 0.09 --(dt + dt)
		else
			table.remove(fct, i)
		end   
	end 
end

function fct:draw(  )
	-- set font
	love.graphics.setFont( fnt_med_2 )
	for i,v in ipairs(fct) do
		
		if v["p"] < 0 then 
			love.graphics.setColor(0, 0, 0, v["tr"])
			love.graphics.print(v["p"], v["x"], v["y"])
			love.graphics.setColor(255, 0, 0, v["tr"])
			love.graphics.print(v["p"], v["x"] - 1, v["y"] - 1)
		else
			love.graphics.setColor(0, 0, 0, v["tr"])
			love.graphics.print("+"..tostring(v["p"]), v["x"], v["y"])
			love.graphics.setColor(0, 255, 0, v["tr"])
			love.graphics.print("+"..tostring(v["p"]), v["x"] - 1, v["y"] - 1)
		end 
		
	end
	-- reset the draw color
	love.graphics.setColor(255,255,255)
end

-- This should only be called from duck functions
function fct:spawn( points, sx, sy, ts, mxt )
	local trans = 255
	if ts == 0 then
		table.insert(fct, {p = points, x = sx, y = sy, t = ts, mt = mxt, tr = trans})
	else
		ts = 0
		table.insert(fct, {p = points, x = sx, y = sy, t = ts, mt = mxt, tr = trans})
	end  
end

