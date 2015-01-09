local myButtonLayer = class("myButtonLayer", function()
    return display.newLayer()
end)

myButtonLayer.CHECKBOX_BUTTON_IMAGES = {
    off = "button/CheckBoxButtonOff.png",
    off_pressed = "button/CheckBoxButtonOffPressed.png",
    off_disabled = "button/CheckBoxButtonOffDisabled.png",
    on = "button/CheckBoxButtonOn.png",
    on_pressed = "button/CheckBoxButtonOnPressed.png",
    on_disabled = "button/CheckBoxButtonOnDisabled.png",
}

myButtonLayer.CHECKBOX_BUTTON2_IMAGES = {
    off = "button/CheckBoxButton2Off.png",
    on = "button/CheckBoxButton2On.png",
}

myButtonLayer.PUSH_BUTTON_IMAGES = {
    normal = "button/Button01.png",
    pressed = "button/Button01Pressed.png",
    disabled = "button/Button01Disabled.png",
}

myButtonLayer.RADIO_BUTTON_IMAGES = {
    off = "button/RadioButtonOff.png",
    off_pressed = "button/RadioButtonOffPressed.png",
    off_disabled = "button/RadioButtonOffDisabled.png",
    on = "button/RadioButtonOn.png",
    on_pressed = "button/RadioButtonOnPressed.png",
    on_disabled = "button/RadioButtonOnDisabled.png",
}
local pushBtn
function myButtonLayer:ctor()

--UIPushButton
    self:createUIPushButton()
    
    self:createTextUIPushButton()
    
    self:createImageUIPushButton()
    
--CheckButton
    self:createCheckButton()
    
--RadioButton
    self:createCheckBoxButtonGroup()
    

end

function myButtonLayer:createUIPushButton()
    pushBtn = cc.ui.UIPushButton.new(myButtonLayer.PUSH_BUTTON_IMAGES, {scale9 = true})
        :setButtonSize(240, 60) --设置大小
        :setButtonLabel("normal", cc.ui.UILabel.new({
            UILabelType = 2,
            text = "This is a PushButton",
            size = 18
        }))-- 设置各个状态的按钮显示文字
        :setButtonLabel("pressed", cc.ui.UILabel.new({
            UILabelType = 2,
            text = "Button Pressed",
            size = 18,
            color = cc.c3b(255, 64, 64)
        }))
        :setButtonLabel("disabled", cc.ui.UILabel.new({
            UILabelType = 2,
            text = "Button Disabled",
            size = 18,
            color = cc.c3b(0, 0, 0)
        }))
        :onButtonClicked(function(event) -- 按钮的clicked事件处理
            print("pushButton click")
        end)
        :align(display.LEFT_CENTER, display.left + 80, display.top - 80) --设置位置 锚点位置和坐标x,y
        :addTo(self)   
end

function myButtonLayer:createTextUIPushButton()
    local switchBtn = cc.ui.UIPushButton.new()
    switchBtn:setButtonLabel("normal", cc.ui.UILabel.new({
        UILabelType = 2,
        text = "on",
        size = 24,
        color = cc.c4b(255, 255, 255,255)
    })) 
    switchBtn:setButtonLabel("pressed", cc.ui.UILabel.new({
        UILabelType = 2,
        text = "pressed",
        size = 24,
        color = cc.c4b(255, 255, 255,255)
    }))
    switchBtn:setButtonLabel("disabled", cc.ui.UILabel.new({
        UILabelType = 2,
        text = "disabled",
        size = 24,
        color = cc.c4b(255, 255, 255,255)
    }))
    switchBtn:onButtonClicked(function()
        print("switchBtn clicked!")
    end)
    switchBtn:setPosition(350,150)
    self:addChild(switchBtn)
end

function myButtonLayer:createImageUIPushButton()

    local closeBtn = cc.ui.UIPushButton.new()
    closeBtn:setButtonImage(cc.ui.UIPushButton.NORMAL, "CloseNormal.png", true)
    closeBtn:setButtonImage(cc.ui.UIPushButton.PRESSED, "CloseSelected.png", true)
    closeBtn:setPosition(250,150)
    closeBtn:onButtonClicked(function()
        print("closeBtn clicked!")
    end)
    self:addChild(closeBtn)

end


function myButtonLayer:createCheckButton()
    local function updateCheckBoxButtonLabel(checkbox)
        local state = ""
        if checkbox:isButtonSelected() then
            state = "on"
            pushBtn:setButtonEnabled(true) -- 禁用按钮
        else
            state = "off"
            pushBtn:setButtonEnabled(false) -- 禁用按钮
        end
        if not checkbox:isButtonEnabled() then
            state = state .. " (disabled)"
        end
        checkbox:setButtonLabelString(string.format("state is %s", state))
    end

   local checkBoxButton1 = cc.ui.UICheckBoxButton.new(myButtonLayer.CHECKBOX_BUTTON_IMAGES)
        :setButtonLabel(cc.ui.UILabel.new({text = "", size = 22,  color = cc.c3b(255, 96, 255)}))
        :setButtonLabelOffset(0, -40) --设置文本显示的偏移位置
        :setButtonLabelAlignment(display.CENTER) --设置文本对齐方式
        :onButtonStateChanged(function(event) --处理按钮状态变化
            updateCheckBoxButtonLabel(event.target)
        end)
        :align(display.LEFT_CENTER, display.left + 40, display.top - 180)--设置锚点和位置
        :addTo(self)
end

function myButtonLayer:createCheckBoxButtonGroup()

    local group = cc.ui.UICheckBoxButtonGroup.new(display.TOP_TO_BOTTOM) --创建checkButton组件
        :addButton(cc.ui.UICheckBoxButton.new(myButtonLayer.RADIO_BUTTON_IMAGES)
            :setButtonLabel(cc.ui.UILabel.new({text = "option 1", color = display.COLOR_WHITE}))
            :setButtonLabelOffset(20, 0)
            :align(display.LEFT_CENTER)) -- 添加checkButton
        :addButton(cc.ui.UICheckBoxButton.new(myButtonLayer.RADIO_BUTTON_IMAGES)
            :setButtonLabel(cc.ui.UILabel.new({text = "option 2", color = display.COLOR_WHITE}))
            :setButtonLabelOffset(20, 0)
            :align(display.LEFT_CENTER))
        :addButton(cc.ui.UICheckBoxButton.new(myButtonLayer.RADIO_BUTTON_IMAGES)
            :setButtonLabel(cc.ui.UILabel.new({text = "option 3", color = display.COLOR_WHITE}))
            :setButtonLabelOffset(20, 0)
            :align(display.LEFT_CENTER))
        :addButton(cc.ui.UICheckBoxButton.new(myButtonLayer.RADIO_BUTTON_IMAGES)
            :setButtonLabel(cc.ui.UILabel.new({text = "option 4 disabled", color = display.COLOR_WHITE}))
            :setButtonEnabled(false)
            :setButtonLabelOffset(20, 0)
            :align(display.LEFT_CENTER))
        :setButtonsLayoutMargin(10, 10, 10, 10) -- 设置Margin边缘值
        :onButtonSelectChanged(function(event)
            printf("Option %d selected, Option %d unselected", event.selected, event.last)
        end) -- 处理checkButton的选中事件
        :align(display.LEFT_CENTER, display.left + 40, display.top - 440) -- 设置锚点和位置
        :addTo(self)
    group:getButtonAtIndex(4):setButtonSelected(true) --获取指定index的按钮并设置选中
    
end

return myButtonLayer