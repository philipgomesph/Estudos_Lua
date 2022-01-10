-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

--  AULA 3 

display.setStatusBar(display.HiddenStatusBar);

--Background
local background = display.newImage("background.png",display.contentCenterX,display.contentCenterY-15);

-- Quadrado // Pesonagem
local player1 = display.newRect(display.contentCenterX,display.contentCenterY,30,30);

-- Vetor botoes
local buttons = {}

buttons[1] = display.newImage("botoes.jpg",display.contentCenterX+95,display.contentCenterY+200); -- Direcional Pra cima
buttons[1].myName = "up"

buttons[2] = display.newImage("botoes.jpg",display.contentCenterX+95,display.contentCenterY+250); -- Direcional pra baixo
buttons[2].rotation = -180
buttons[2].myName = "down"

buttons[3] = display.newImage("botoes.jpg",display.contentCenterX+45,display.contentCenterY+225);  -- Direcional esquerda
buttons[3].rotation = -90
buttons[3].myName = "left"

buttons[4] = display.newImage("botoes.jpg",display.contentCenterX+140,display.contentCenterY+225); -- Direcional direita
buttons[4].rotation = 90
buttons[4].myName = "right"


-- Criando evento para os botoes

local passosX = 0
local passosY = 0

local touchFunction = function(e)
    if e.phase == "began" or e.phase == "moved" then
        if e.target.myName == "up" then
         passosY = -3
         passosX = 0
        elseif e.target.myName == "down" then
            passosY = 3
            passosX = 0
        elseif e.target.myName == "left" then   
            passosX = -3
            passosY = 0
        elseif e.target.myName == "right" then
            passosX = 3
            passosY = 0
        end
    else
        passosX = 0
        passosY = 0

    end
end

local j=1

for j=1, #buttons do
    buttons[j]:addEventListener("touch", touchFunction)
end



local update = function()
    player1.x = player1.x + passosX
    player1.y = player1.y + passosY
end


-- atuliza jogo
Runtime:addEventListener("enterFrame",update)