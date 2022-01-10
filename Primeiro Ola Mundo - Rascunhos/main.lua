-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
display.setStatusBar( display.HiddenStatusBar )

print("hello World!")
display.setStatusBar( display.HiddenStatusBar )
local options =
{
    text = "o rander é o de baixo",
    x = display.contentCenterX,
    y = display.contentCenterY,
    with = 128,
    font = native.systemFont,
    align = "center"  -- Alignment parameter
}


local welcomeMessage = display.newText(options)
welcomeMessage:setFillColor(1,1,1)


local worldMap = display.newImageRect ( "world.png", 250, 250)
worldMap.x = display.contentCenterX+20
worldMap.y = display.contentCenterY-200

