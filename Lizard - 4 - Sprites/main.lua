--  AULA 3 

display.setStatusBar(display.HiddenStatusBar);

--Background
local background = display.newImage("background.png",display.contentCenterX,display.contentCenterY-15);


-- Quadrado // Pesonagem
--local player1 = display.newRect(display.contentCenterX,display.contentCenterY,30,30);


-- Captando tamanho da tela
local w = display.contentWidth
local h = display.contentHeight

------------------------------------------------------------  PERSONAGEM ---------------------------------------------------------------

    -- Sprites
    -- Criando o sheet
local sheetData = {width = 45, height=80, numFrames=12}
    -- sheet
local sheet = graphics.newImageSheet("personagem.png",sheetData)
    -- passando a sequencia 
local sequenceData=
{
    { name = "idleDown", start = 1, count = 1, time = 0, loopCount = 1 }, 
    { name = "idleUp", start = 4, count = 1, time = 0, loopCount = 1 }, 
    { name = "idleLeft", start = 7, count = 1, time = 0, loopCount = 1 }, 
    { name = "idleRight", start = 10, count = 1, time = 0, loopCount = 1 }, 
    
    { name = "moveDown", start = 2, count = 2, time = 300, loopCount = 0 },
    { name = "moveUp", start = 5, count = 2, time = 300, loopCount = 0 },
    { name = "moveLeft", start = 8, count = 2, time = 300, loopCount = 0 },
    { name = "moveRight", start = 11, count = 2, time = 300, loopCount = 0 },
}

        -- CRIANDO PERSONAGEM 
local player = display.newSprite(sheet,sequenceData)  -- cria a sprite, que deve passar um sheet, e uma sequencia 
player.x = w*.5 -- Local em X e em baixo em Y
player.y = h*.5 
player:setSequence("idleDown")-- Spride começa virada pra traz


---------------------------------------------------------  Vetor botoes   -------------------------------------------------------
local buttons = {}

--buttons[1] = display.newImage("botoes.jpg",display.contentCenterX+95,display.contentCenterY+200); -- Direcional Pra cima
--buttons[1].myName = "up"

--buttons[2] = display.newImage("botoes.jpg",display.contentCenterX+95,display.contentCenterY+250); -- Direcional pra baixo
--buttons[2].rotation = -180
--buttons[2].myName = "down"

--buttons[3] = display.newImage("botoes.jpg",display.contentCenterX+45,display.contentCenterY+225);  -- Direcional esquerda
--buttons[3].rotation = -90
--buttons[3].myName = "left"

--buttons[4] = display.newImage("botoes.jpg",display.contentCenterX+140,display.contentCenterY+225); -- Direcional direita
--buttons[4].rotation = 90
--buttons[4].myName = "right"
----------- BOTOES EM LANDSCAPE-- 

buttons[1] = display.newImage("botoes.jpg",display.contentCenterX+180,display.contentCenterY+70); -- Direcional Pra cima
buttons[1].myName = "up"

buttons[2] = display.newImage("botoes.jpg",display.contentCenterX+180,display.contentCenterY+115); -- Direcional pra baixo
buttons[2].rotation = -180
buttons[2].myName = "down"

buttons[3] = display.newImage("botoes.jpg",display.contentCenterX+140,display.contentCenterY+100);  -- Direcional esquerda
buttons[3].rotation = -90
buttons[3].myName = "left"

buttons[4] = display.newImage("botoes.jpg",display.contentCenterX+220,display.contentCenterY+100); -- Direcional direita
buttons[4].rotation = 90
buttons[4].myName = "right"




-- Criando evento para os botoes

local xAxis = 0
local yAxis = 0

local touchFunction = function(e)
    if e.phase == "began" or e.phase == "moved" then
        if e.target.myName == "up" then
        player:setSequence("moveUp")
         yAxis = -3
         xAxis = 0
        elseif e.target.myName == "down" then
            player:setSequence("moveDown")
            yAxis = 3
            xAxis = 0
        elseif e.target.myName == "left" then   
            player:setSequence("moveLeft")
            xAxis = -3
            yAxis = 0
        elseif e.target.myName == "right" then
            player:setSequence("moveRight")
            xAxis = 3
            yAxis = 0
        end
    else
        -- caso os bot�es sejam soltos uma dessas fun��es ser� executada, 
		-- isso serve para q quando algu�m soltar os bot�es, o player n�o continue movimentando,
		-- ent�o a anima��o � trocada para os frames em q o gaara est� parado
		if e.target.myName == "up" then 
			player:setSequence("idleUp")
			-- a anima��o "idleUp"(parado para cima) � ativada se o jogar soltar o bot�o para cima
		elseif e.target.myName == "down" then 
			player:setSequence("idleDown")
			-- mesmo principio do "idleUp", mas agora o gaara olha para baixo
		elseif e.target.myName == "right" then
			player:setSequence("idleRight")
		elseif e.target.myName == "left" then
			player:setSequence("idleLeft")
		end
        xAxis = 0
        yAxis = 0

    end
end

local j=1

for j=1, #buttons do
    buttons[j]:addEventListener("touch", touchFunction)
end



local update = function()
    player.x = player.x + xAxis
    player.y = player.y + yAxis
    -- Faz com que a Sprite se movimente, Troca as duas sprites de movimento
    if player.x <= player.width * .5 then 
		player.x = player.width * .5
	elseif player.x >= w - player.width * .5 then 
		player.x = w - player.width * .5
	end

	if player.y <= player.height * .5 then
		player.y = player.height * .5
	elseif player.y >= h - player.height * .5 then 
		player.y = h - player.height * .5
	end 
	
	player:play() --executa a anima��o, � necess�rio usar essa fun��o para ativar a anima��o
end


-- atuliza jogo
Runtime:addEventListener("enterFrame",update)