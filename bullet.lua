bullet = class:new()
bulletSpeed = 1400 -- 1400
bulletDiam = 6
bulletHitboxes = {}
function bullet:init()
	-- not needed for now
end

function bullet:draw()
	love.graphics.setColor(0, 0, 0)
    for i,v in ipairs(bullet) do
        love.graphics.draw(spr_bullet, v["x"], v["y"]) --love.graphics.circle("fill", v["x"], v["y"], bulletDiam/2)
    end
    --love.graphics.setColor(255, 255, 255)
    --for i,v in ipairs(bulletHitboxes) do
      --  love.graphics.rectangle("line", v["x"], v["y"], v["width"], v["height"])
   -- end
    love.graphics.setColor(255,255,255)
end


function bullet:update(dt)
	for i,v in ipairs(bullet) do
        v["x"] = v["x"] + (v["dx"] * dt)
        v["y"] = v["y"] + (v["dy"] * dt)
    end
    
    for i,v in ipairs(bulletHitboxes) do
        v["x"] = v["x"] + (v["hitboxDx"] * dt)
        v["y"] = v["y"] + (v["hitboxDy"] * dt)
    end 
end

function bullet:isCollidingWall()
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

    for i,v in ipairs(bulletHitboxes) do 
        if CheckCollision(v["x"],v["y"],v["width"],v["height"], rbxx,rbxy,rbxw,rbxh) or 
                CheckCollision(v["x"],v["y"],v["width"],v["height"], tbxx,tbxy,tbxw,tbxh) or 
                    CheckCollision(v["x"],v["y"],v["width"],v["height"], lbxx,lbxy,lbxw,lbxh) then
                    table.remove(bulletHitboxes, i)
                    table.remove(bullet, i)
        end 
    end 
end


function bullet:shoot(x, y, button, plycposx, plycposy)
	
    if button == "l" then 
        local startX = plycposx
        local startY = plycposy
        local mouseX = x
        local mouseY = y
        
        local angle = math.atan2((mouseY - startY), (mouseX - startX))
        
        local bulletDx = bulletSpeed * math.cos(angle)
        local bulletDy = bulletSpeed * math.sin(angle)

        table.insert(bullet, {x = startX, y = startY, dx = bulletDx, dy = bulletDy})
        table.insert(bulletHitboxes, {x = startX, y = startY, hitboxDx = bulletDx, hitboxDy = bulletDy, width = bulletDiam, height = bulletDiam})
        
    end
end