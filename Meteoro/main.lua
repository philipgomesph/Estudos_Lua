-----------------------------------------------------------------------------------------
--
-- Codigo na qual trabalha a fisica do meteoro
--
-----------------------------------------------------------------------------------------

-- Your code here
local meteoro = display.newImage( "meteoro.png") --adiciona meteoro na tela
meteoro.x = display.contentCenterX
meteoro.y = display.contentCenterY

local physics = require("physics")
physics.start()

physics.addBody(meteoro, "dynamic", {radius = 100}) -- dynamic = ele sofre pela gavridade // radius = 