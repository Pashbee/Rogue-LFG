nstar = class:new()
nstarSpeed = 1400 -- 1400
nstarDiam = 6
nstarHitboxes = {}
function nstar:init()
	-- not needed for now
end

function nstar:draw()
	love.graphics.setColor(0, 0, 0)
    for i,v in ipairs(nstar) do
        love.graphics.draw(spr_nstar, v["x"], v["y"]) --love.graphics.circle("fill", v["x"], v["y"], nstarDiam/2)
    end
    --love.graphics.setColor(255, 255, 255)
    --for i,v in ipairs(nstarHitboxes) do
      --  love.graphics.rectangle("line", v["x"], v["y"], v["width"], v["height"])
   -- end
    love.graphics.setColor(255,255,255)
end


function nstar:update(dt)
	for i,v in ipairs(nstar) do
        v["x"] = v["x"] + (v["dx"] * dt)
        v["y"] = v["y"] + (v["dy"] * dt)
    end
    
    for i,v in ipairs(nstarHitboxes) do
        v["x"] = v["x"] + (v["hitboxDx"] * dt)
        v["y"] = v["y"] + (v["hitboxDy"] * dt)
    end 
end

function nstar:isCollidingWall()
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

    for i,v in ipairs(nstarHitboxes) do 
        if CheckCollision(v["x"],v["y"],v["width"],v["height"], rbxx,rbxy,rbxw,rbxh) or 
                CheckCollision(v["x"],v["y"],v["width"],v["height"], tbxx,tbxy,tbxw,tbxh) or 
                    CheckCollision(v["x"],v["y"],v["width"],v["height"], lbxx,lbxy,lbxw,lbxh) then
                    table.remove(nstarHitboxes, i)
                    table.remove(nstar, i)
        end 
    end 
end


function nstar:shoot(x, y, button, plycposx, plycposy)
	
    if button == "l" then 
        local startX = plycposx
        local startY = plycposy
        local mouseX = x
        local mouseY = y
        
        local angle = math.atan2((mouseY - startY), (mouseX - startX))
        
        local nstarDx = nstarSpeed * math.cos(angle)
        local nstarDy = nstarSpeed * math.sin(angle)

        table.insert(nstar, {x = startX, y = startY, dx = nstarDx, dy = nstarDy})
        table.insert(nstarHitboxes, {x = startX, y = startY, hitboxDx = nstarDx, hitboxDy = nstarDy, width = nstarDiam, height = nstarDiam})
        
    end
end