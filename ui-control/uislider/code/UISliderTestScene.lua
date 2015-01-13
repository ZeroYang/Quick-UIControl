local UISliderTestScene = class("UISliderTestScene", function()
    return display.newScene("UISliderTestScene")
end)

UISliderTestScene.SLIDER_IMAGES = {
    bar = "slider/SliderBar.png",
    button = "slider/SliderButton.png",
}

function UISliderTestScene:ctor()
    local layer=display.newColorLayer(cc.c4b(110,110,110,255))
    self.layer = layer
    self:addChild(self.layer)


    self:addSlider()
end

-- UISlider bar
function UISliderTestScene:addSlider()

    local barHeight = 40
    local barWidth = 400
    local valueLabel = cc.ui.UILabel.new({text = "", size = 14, color = display.COLOR_BLACK})
        :align(display.LEFT_CENTER, display.left + barWidth + 60, display.top - 60)
        :addTo(self)
    cc.ui.UISlider.new(display.LEFT_TO_RIGHT, UISliderTestScene.SLIDER_IMAGES, {scale9 = true})
        :onSliderValueChanged(function(event) --值改变事件
            valueLabel:setString(string.format("value = %0.2f", event.value))
            print(event.name)
        end)
        :onSliderStateChanged(function(event) --状态改变事件 enable/disable
            print(event.name)
        end)
        :onSliderPressed(function(event) --按下滑动块事件
            print(event.name)
        end)
        :onSliderRelease(function(event) --释放滑动块事件
            print(event.name)
        end)
        :setSliderSize(barWidth, barHeight) --修改滑动条大小
        --当创建参数设置了 scale9 为 true，那么可以通过下面的接口来改变控件的大小。
        --如果 scale9 为 false，调用这个接口会报错，程序停止运行。
        :setSliderValue(75) --设置取值修改滑动块位置
        :align(display.LEFT_BOTTOM, display.left + 40, display.top - 80)
        :addTo(self)
        --:setSliderEnabled(false)
        
    cc.ui.UILabel.new({text = "align LEFT_BOTTOM", size = 14, color = display.COLOR_BLACK})
        :align(display.LEFT_CENTER, display.left + 40, display.top - 30)
        :addTo(self)
        
        
        
    local barWidth = 40
    local barHeight = 240
    local valueLabel = cc.ui.UILabel.new({text = "", size = 14, color = display.COLOR_BLACK})
        :align(display.LEFT_CENTER, display.cx + barWidth + 160, display.cy - 60)
        :addTo(self)
    cc.ui.UISlider.new(display.TOP_TO_BOTTOM, UISliderTestScene.SLIDER_IMAGES, {scale9 = true})
        :onSliderValueChanged(function(event)
            valueLabel:setString(string.format("value = %0.2f", event.value))
        end)
        :setSliderSize(barWidth, barHeight)
        :setSliderButtonRotation(90)
        :setSliderValue(75)
        :align(display.CENTER_TOP, display.cx + 160, display.cy - 40)
        :addTo(self)
    cc.ui.UILabel.new({text = "TOP_TO_BOTTOM, align CENTER_TOP", size = 14, color = display.COLOR_BLACK})
        :align(display.LEFT_CENTER, display.cx + 40, display.cy - 30)
        :addTo(self)
end

function UISliderTestScene:onEnter()
end

function UISliderTestScene:onExit()
end

return UISliderTestScene