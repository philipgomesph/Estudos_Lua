-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

-- LIBRARY --
fisica = require("physics"); -- Declarando biblioteca de fisica  Solar2D
fisica.start();  -- startando ela 


-- Ajustes
display.setStatusBar( display.HiddenStatusBar )  -- Esconde barra de status do celular

--- CODIGO --
retangulo = display.newRect(display.contentCenterX,display.contentCenterX,30,70)   --- Criando retangulo // newreact(posiçao X , posiçao Y, largura, altura)
retangulo:setFillColor(0,50,255) -- dando (RGB)
fisica.addBody(retangulo,"dynamic",{desity=0,friction=1,bounce=0.2 })     --Adicionando corpo para o retangulo (densidade / atrito / quicar)


ground = display.newRect(0,500,900,50);  -- Criando o Chao 
fisica.addBody(ground,"static",{friction =1,bounec=0.4})


