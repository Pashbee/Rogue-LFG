---- PLAYER RESOURCES ----
-- This is the player sprite sheet
sprsheet_player = love.graphics.newImage("images/placeholders/hero_spritesheet_0.png")
-- These will be player frame quads for walking - without firing or jumping
spr_player_f1 = love.graphics.newQuad(15,110,65,80,640,470)
-- This is the duck sprite
spr_duck_f1 = love.graphics.newImage("images/placeholders/spr_duck1.png")

-- This is the mouse cursor
spr_mcursor_f1 = love.graphics.newImage("images/placeholders/mcursor_f2.png")


-- This is the sky placeholder
spr_skyback_f1 = love.graphics.newImage("images/placeholders/sky-placeholder.jpg")


-- This is a bullet spr
spr_bullet = love.graphics.newImage("images/placeholders/bullet.png")

fnt_default_1 = love.graphics.newFont(12)
fnt_med_1 = love.graphics.newFont(20)
fnt_med_2 = love.graphics.newFont(18)
