--OBS: Frame = quadro de anima��o. Ex: a sprite q usaremos contem 12 quadros de anima��o.

display.setStatusBar (display.HiddenStatusBar) -- esconde a barra de status 

local w = display.contentWidth -- largura da tela
local h = display.contentHeight -- altura da tela

local background = display.newImage("background.png") -- cria uma nova imagem de fundo

local sheetData =  { width=45, height=63, numFrames=12 }
-- width: largura de cada frame
-- height: altura de cada frame
-- numFrames: n�mero de frames da sprite

local sheet = graphics.newImageSheet("gaara.png", sheetData)
-- cria uma nova imagem usando a sprite "gaara.png" e as propriedades vistas acima

local sequenceData = 
{
	{ name = "idleDown", start = 1, count = 1, time = 0, loopCount = 1 }, --idleDown = parado para baixo (� s� um nome, vc quem nomeia como quiser)
	-- name: nome desse movimento
	-- start: frame da sprite onde a anima��o come�a (nesse caso come�a no primeiro frame da sprite)
	-- count: n�mero de frames para essa anima��o (nesse caso essa anima��o s� ter� um frame, o primeiro, aquele q o gaara t� parado pra baixo)
	-- time: tempo de dura��o da anima��o (est� zero pq essa anima��o s� tem um quadro
	-- loopCount: n�mero de vezes que a anima��o � executada, nesse caso a anima��o s� � executada uma vez, pois s� tem um frame
	
	-- os outros vetores s�o da mesma forma, cada um com a sua anima��o
    { name = "idleLeft", start = 4, count = 1, time = 0, loopCount = 1 }, --parado pra esquerda
    { name = "idleRight", start = 7, count = 1, time = 0, loopCount = 1 }, --parado pra direita
    { name = "idleUp", start = 10, count = 1, time = 0, loopCount = 1 }, --parado pra cima
	
	-- esses vetores j� contem mais do q um frame de anima��o, ent�o eles j� mostram um movimento
    { name = "moveDown", start = 2, count = 2, time = 300, loopCount = 0 },
	-- nesse caso a anima��o come�a do segundo frame e termina do terceiro (j� q o count � igual a 2)
	-- e o 'time' � igual a 300, isso significa q essa anima��o (moveDown), ser� executada em 300 cent�simos de segundo, ou 0,3 segundos
	-- o loopCount � igual a zero, isso significa q anima��o ser� executada para sempre, at� q algu�m cancele essa anima��o ou execute outra
    { name = "moveLeft", start = 5, count = 2, time = 300, loopCount = 0 },
	-- mesmo principio da anima��o de cima, mas agora come�a no quinto frame (start=5) e cont�m 2 frames de anima��o apenas
    { name = "moveRight", start = 8, count = 2, time = 300, loopCount = 0 },
    { name = "moveUp", start = 11, count = 2, time = 300, loopCount = 0 },
}

local player = display.newSprite(sheet, sequenceData)
-- cria finalmente a sprite utilizando as propriedades vistas acima
player.x = w * .5
player.y = h * .5

player:setSequence("idleDown")
-- configura um valor inicial para sprite, nesse caso � o "idleDown", por isso o gaara come�a olhando para baixo

local buttons = {}

buttons[1] = display.newImage("button.png")
buttons[1].x = 250
buttons[1].y = 380
buttons[1].myName = "up"
buttons[1].rotation = -90

buttons[2] = display.newImage("button.png")
buttons[2].x = 250
buttons[2].y = 440
buttons[2].myName = "down"
buttons[2].rotation = 90

buttons[3] = display.newImage("button.png")
buttons[3].x = 210
buttons[3].y = 410
buttons[3].myName = "left"
buttons[3].rotation = 180

buttons[4] = display.newImage("button.png")
buttons[4].x = 290
buttons[4].y = 410
buttons[4].myName = "right"

local yAxis = 0
local xAxis = 0

local touchFunction = function(e)
	local eventName = e.phase
	local direction = e.target.myName
	
	if eventName == "began" or eventName == "moved" then
		if direction == "up" then 
			player:setSequence("moveUp")
			-- caso o bot�o pra cima for precionado ou arrastado, 
			-- anima��o � trocada para a "moveUp" q mostra uma anima��o do gaara se movimentando para cima
			
			yAxis = -5
			xAxis = 0
		elseif direction == "down" then 
			player:setSequence("moveDown")
			-- mesmo principio do moveUp, mas agora � mostrada a anima��o do gaara olhando para baixo

			yAxis = 5
			xAxis = 0
		elseif direction == "right" then
			player:setSequence("moveRight")

			xAxis = 5
			yAxis = 0
		elseif direction == "left" then
			player:setSequence("moveLeft")

			xAxis = -5
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
		
		yAxis = 0
		xAxis = 0
	end
end

local j=1

for j=1, #buttons do 
	buttons[j]:addEventListener("touch", touchFunction)
end

local update = function()
	player.x = player.x + xAxis
	player.y = player.y + yAxis

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

Runtime:addEventListener("enterFrame", update)