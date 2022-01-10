-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

local cX = display.contentCenterX -- Decalarando posição no centro da tela em X
local cY = display.contentCenterY -- Decalarando posição no centro da tela em Y
local background = display.newImageRect("background.png", 200 , 200); -- Declarando imagem(no caso background)


background.x = cX
background.y =  cY


local circulo = display.newCircle(cX,cY-200,20); --Declarando um circulo qualquer

circulo:setFillColor(0.25,0.75,0);  -- Dando cor ao circulo, o Corona trabalha com %da cor 

local linha = display.newLine(cX,0,cX, 140);
linha:setStrokeColor(1, 0.75, 0)
linha.StrokeWidth = 100

local texto = display.newText("Cria jogo", cX, cY+200,"Arial", 48);

texto:setFillColor(1,0.75,0)

local poligonos = display.newGroup() -- Declarando novo grupo  de objetos

poligonos:insert(circulo)
poligonos.alpha = 0.5
-- poligonos.isVisible = false
poligonos:removeSelf();
