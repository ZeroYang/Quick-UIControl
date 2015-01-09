local UIInputTestScene = class("UIInputTestScene", function()
    return display.newScene("UIInputTestScene")
end)

function UIInputTestScene:ctor()
    local layer=display.newColorLayer(cc.c4b(110,110,110,255))
    self.layer = layer
    self:addChild(self.layer)
    
    self:addTextUIInput()
    self:addPDUIInput()
end

--文本输入框
function UIInputTestScene:addTextUIInput()

    local function onEdit(event, editbox)
        if event == "began" then
            -- 开始输入
            print("开始输入")
        elseif event == "changed" then
            -- 输入框内容发生变化
            print("输入框内容发生变化")
            local text = editbox:getText()
            print(text)
        elseif event == "ended" then
            -- 输入结束
            print("输入结束")
        elseif event == "return" then
            -- 从输入框返回
            print("从输入框返回")
        end
    end

    local editbox = cc.ui.UIInput.new({
        image = "editbox.png", -- 输入控件的背景
        listener = onEdit,  -- 输入事件监听
        x = display.width / 2,
        y = display.height / 2,
        size = cc.size(200, 40)
    })
    --editbox:setPosition(display.width / 2, display.height / 2)
    self:addChild(editbox)
    --editbox:setText("默认文本")
    editbox:setFontColor(display.COLOR_BLACK)
    editbox:setPlaceHolder("文本输入控件")--提示输入文本

end

--密码输入框
function UIInputTestScene:addPDUIInput()

    local function onEdit(event, editbox)
        if event == "began" then
            -- 开始输入
            print("开始输入")
        elseif event == "changed" then
            -- 输入框内容发生变化
            print("输入框内容发生变化")
            local text = editbox:getText()
            print(text)
        elseif event == "ended" then
            -- 输入结束
            print("输入结束")
        elseif event == "return" then
            -- 从输入框返回
            print("从输入框返回")
        end
    end

    local editbox = cc.ui.UIInput.new({
        image = "editbox.png", -- 输入控件的背景
        listener = onEdit, -- 可选
        size = cc.size(200, 40)
    })
    editbox:setPosition(display.width / 2, display.height / 2 - 100)
    editbox:setFontColor(display.COLOR_BLACK)
    self:addChild(editbox)
    editbox:setPlaceHolder("请输入密码")
    editbox:setInputFlag(0) 

end


function UIInputTestScene:onEnter()
end

function UIInputTestScene:onExit()
end

return UIInputTestScene