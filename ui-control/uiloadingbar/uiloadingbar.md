#Quick-Cocos2d-x UI控件之进度条(UILoadingBar)控件

在应用中，进度条通常用来展示下载、解压等比较耗时间的事务进度。而在游戏中，我们一样需要进度条，比如一个三消游戏的倒计时进度条、或一个通关分数进度条。

Quick 封装的进度条控件类是UILoadingBar，源码位于`framework/cc/ui/UILoadingBar.lua`。


### 进度条控件效果图

![](./res/1.gif)

## 创建

通过`cc.ui.UILoadingBar.new(options)`新建一个进度条。其中 options 是 table 类型，可用的参数有：

- scale9，boolean类型。是否缩放
- capInsets，cc.rect类型。缩放的区域
- image，string类型。进度条图片
- viewRect，cc.rect类型。显示区域
- percent，int类型。初始进度值，范围 0 到 100
- direction，方向，默认值从左到右。可选参数：
	- UILoadingBar.DIRECTION_LEFT_TO_RIGHT
	- UILoadingBar.DIRECTION_RIGHT_TO_LEFT

我们来看看如何创建一个进度条控件，在MainScene的ctor方法中加入下面代码：

```lua
    local loadBar = cc.ui.UILoadingBar.new({
        scale9 = true,
        capInsets = cc.rect(0,0,10,10), -- scale region
        image =  "loading.png", -- loading bar image
        viewRect = cc.rect(0,0,200,32), -- set loading bar rect
        percent = 30, -- set loading bar percent
        -- direction = DIRECTION_RIGHT_TO_LEFT
        -- direction = DIRECTION_LEFT_TO_RIGHT -- default
    })
    :addTo(self)
```

上面代码使用loading.png作为进度条显示图片新建了一个进度条。在新建时可以指定进度条显示图片是否进行scale9缩放，显示区域，进度条的加载方向等。

## 更新进度

进度条创建后，并不会自动地周期更新进度显示。所有UI控件只负责显示，逻辑层面的处理由开发者的其它模块完成。当底层模块数字更新后，需要同步更新进度条的显示，可以用下面的接口来更新UI：

```lua
loadBar:setPercent(percent)
```

percent取值范围 0 到 100。

## 相关源码及资源下载

[源码及资源下载](./code/code.zip)