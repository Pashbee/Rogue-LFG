duck = class:new()
duckSpeed = 250 -- 250
DuckDiam = 20
duckHitboxes = {}

function duck:init()
	
end

function duck:draw()
	-- draw zee ducks
    for i,v in ipairs(duck) do
        love.graphics.draw(spr_duck_f1, v["x"], v["y"], v["r"], 1, 1, spr_duck_f1:getWidth()/2, spr_duck_f1:getHeight()/2) 
    end
    

    --love.graphics.setColor(0, 0, 0)
    --for i,v in ipairs(duckHitboxes) do
      --love.graphics.rectangle("line", v["x"], v["y"], DuckDiam, DuckDiam)
    --end
   --love.graphics.setColor(255,255,255)
end

function duck:update(dt, wg)
	for i,v in ipairs(duck) do
        v["x"] = v["x"] + (v["dx"] * dt)
        v["y"] = v["y"] - v["vel"] * dt -- v["y"] = v["y"] + (v["dy"] * dt) << old way
        v["vel"] = v["vel"] - wg * dt
        -- this is rotation for turning the ducks 
        v["r"] = v["r"] + dt 
    end
    
    for i,v in ipairs(duckHitboxes) do
        v["x"] = v["x"] + (v["hitboxDx"] * dt) 
        v["y"] = v["y"] - v["vel"] * dt
        v["vel"] = v["vel"] - wg * dt 
    end 
end

function duck:isCollidingWall()
	local rbxx = love.graphics.getWidth() - 50
    local rbxy = 50
    local rbxw = 50
    local rbxh = love.graphics.getHeight() - 50
    local tbxx = 0
    local tbxy = 0
    local tbxw = love.graphics.getWidth()
    local tbxh = 50
    local lbxx = 0
    local lbxy = 50
    local lbxw = 50
    local lbxh = love.graphics.getHeight() - 50


end

function duck:isCollidingBullets()
	local deadDuckPoints = 20
    for i,v in ipairs(duckHitboxes) do
        
        for a,b in ipairs(bulletHitboxes) do
            if CheckCollision(v["x"],v["y"],v["width"],v["height"], b["x"],b["y"],b["width"],b["height"]) then
                HeroScore:update(deadDuckPoints)
                fct:spawn( deadDuckPoints, v["x"] -15 , v["y"] -5, 0, 2)
                table.remove(duckHitboxes, i)
                table.remove(duck, i)
            end 

        end 

    end 

end

function duck:checkIfSurvived()
    local deadDuckPoints = -15
    for i,v in ipairs(duckHitboxes) do
        if v["x"] > love.graphics.getWidth() then
            HeroScore:update(deadDuckPoints)
            fct:spawn( deadDuckPoints, v["x"] -50 , v["y"] -5, 0, 2)
            table.remove(duckHitboxes, i)
            table.remove(duck, i)
        end 
    end 

end

function duck:spawn()
		-- local duckSpeed = math.random(250,500)
        local startX = 50
        local startY = love.graphics.getHeight() - love.graphics.getHeight()/2
        local targetX = math.random(600,900)
        local targetY = math.random(50,100)
        
        local angle = math.atan2((targetY - startY), (targetX - startX))
        
        local DuckDx = duckSpeed * math.cos(angle)
        local DuckDy = duckSpeed * math.sin(angle)
        -- this is for rotating the duck while moving
        local dRotation = 0
        local velNo = math.random(50,150)

        table.insert(duck, {x = startX, y = startY, dx = DuckDx, dy = DuckDy, r = dRotation, vel = velNo})
        table.insert(duckHitboxes, {x = startX - DuckDiam/2, y = startY - DuckDiam/2, hitboxDx = DuckDx, hitboxDy = DuckDy, width = DuckDiam, height = DuckDiam, vel = velNo})
end


