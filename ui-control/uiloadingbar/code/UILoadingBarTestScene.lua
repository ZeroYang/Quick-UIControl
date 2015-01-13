local UILoadingBarTestScene = class("UILoadingBarTestScene", function()
    return display.newScene("UILoadingBarTestScene")
end)

function UILoadingBarTestScene:ctor()
    local layer=display.newColorLayer(cc.c4b(110,110,110,255))
    self.layer = layer
    self:addChild(self.layer)


    self:addLoadingBar()
end

--Loading bar
function UILoadingBarTestScene:addLoadingBar()

    local percentLabel = cc.ui.UILabel.new(
        {text = "",
            size = 24,
            color = display.COLOR_WHITE})
        :align(display.CENTER, display.width / 2, display.height / 2 - 30)
        :addTo(self)
    
    local bg = display.newSprite("loading-bg.png")
        :align(display.CENTER, display.width / 2, display.height / 2)
        :addTo(self)
    
    local loadBar = cc.ui.UILoadingBar.new({
        scale9 = true,
        capInsets = cc.rect(0,0,10,10), -- scale region
        image =  "loading.png", -- loading bar image
        viewRect = cc.rect(0,0,300,30), -- set loading bar rect
        percent = 30, -- set loading bar percent
        -- direction = DIRECTION_RIGHT_TO_LEFT
        -- direction = DIRECTION_LEFT_TO_RIGHT -- default
    })
    :addTo(bg)

    loadBar:setPosition(0, bg:getContentSize().height/2 - 15)
    local per = 0
    self:schedule(function ()
        per = per + 1
        loadBar:setPercent(per)
        if per == 100 then
            per = 0
        end
        percentLabel:setString(string.format("%d %s",per,"%"))
    end, 0.5)
 

end


function UILoadingBarTestScene:onEnter()
end

function UILoadingBarTestScene:onExit()
end

return UILoadingBarTestScene