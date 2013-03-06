platforms = class:new()

function platforms:init()

	platforms = {}
	platformBlockHeight = 16
	platformBlockWidth = 16
end

function platforms:draw()
	
	for i=1, #platforms do
		local bxs = platforms[i].x
		local bys = platforms[i].y
		local bxp = platforms[i].x
		local byp = platforms[i].y
		local psize = platforms[i].blockColumns * platforms[i].blockRows
		for b=1, psize, 1 do
			if bxp - (platforms[i].blockColumns * platformBlockWidth) > bxs - platformBlockWidth then
				bxp = bxs
				byp = byp + platformBlockHeight
			end 
			love.graphics.draw( spr_platformBlock_2, bxp, byp )
			bxp = bxp + platformBlockWidth
		end  
	end 
end


function platforms:update()


end 


function platforms:spawnplatform( sx,sy,bc,br,ty )
		
table.insert(platforms, {x = sx, y = sy, blockColumns = bc, blockRows = br})

end 