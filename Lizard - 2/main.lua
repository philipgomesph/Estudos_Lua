-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

------------ AULA 2

display.setStatusBar(display.HiddenStatusBar);
-- Your code here

-- Funcao que devolve altura e largura da tela
local largura = display.contentWidth
local altura = display.contentHeight

-- CRIANDO VETOR
local arg = {} 

arg[1] = 0
arg[2] = 50
arg[3] = 255




--Criando retangulo
local retangulo = display.newRect(100,100,100,100);
local circulo = display.newCircle(100,100,100,100);
retangulo.x = largura/2   -- Coloca o retangulo no meio da tela em X
retangulo.y = altura/2    --  Coloca o retangulo no meio da tela em Y
circulo.x = 300
circulo.y = display.contentCenterY -230
retangulo:setFillColor(RGB1,RGB2,RGB3) -- dando cores diferentes para o triangulo

-- Funcao que muda a cor do retangulo aleatoriamente
    local function cor()
       local cont = 1
        for cont =1, 3, 1 do  -- for( valor inicia, valor maximo que ela chega, como chegar) // ou seja, começa no 1, vai ate 3, e vai de 1 em 1
            arg[cont] = math.random(0,1)
        end
      
        retangulo:setFillColor(arg[1],arg[2],arg[3])
       --retangulo:setFillColor(RGB1,RGB2,RGB3) -- dando cores diferentes para o triangulo
        -- body
    end

retangulo:addEventListener("tap", cor)
--cor()