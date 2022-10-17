g_ui.loadUIFromString([[
outfitidWindow < MainWindow
  !text: tr('OutfitHack Settings')
  size: 200 160
  @onEscape: self:hide()

  BotLabel
    id: OutfitID
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    text-align: center


  Label
    id: label1
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    text-align: center
    text: ID da Outfit:
    color: teal

  TextEdit
    id: IDAQUI
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: label1.bottom
    margin-top: 5
    text-align: center

  BotSwitch
    id: findOutfit
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: IDAQUI.bottom
    text-align: center
    text: FIND OUTFIT

  HorizontalSeparator
    id: separator
    anchors.right: parent.right
    anchors.left: parent.left
    anchors.top: findOutfit.bottom
    margin-bottom: 8 

  Label
    id: label2
    anchors.top: separator.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    text-align: center
    text: start to count!
    color: teal

  Button
    id: closeButton
    !text: tr('Close')
    font: cipsoftFont
    anchors.right: parent.right
    anchors.bottom: parent.bottom
    size: 45 21
    margin-top: 15
    margin-right: 5    

  Button
    id: resetButton
    !text: tr('Reset')
    font: cipsoftFont
    anchors.left: parent.left
    anchors.top: parent.bottom
    size: 45 21
    margin-top: -20
    margin-right: 5   

]])

UI.Label()


local panelName = "outfit"
local ui = setupUI([[
Panel
  height: 17

  Label 
    id: label 
    text: ~ Outfit:
    anchors.top: parent.top 
    anchors.left: parent.left 
    margin-left: 50
    font: cipsoftFont
    color: #E0FFFF

  BotSwitch
    id: titleoutfit
    anchors.top: label.bottom
    anchors.left: parent.left
    text-align: center
    width: 115
    font: terminus-14px-bold

  Button
    id: outfitid
    anchors.top: prev.top
    anchors.left: prev.right
    anchors.right: parent.right
    margin-left: 6
    height: 17
    text: SETUP
    font: verdana-11px-rounded

  ]], leftPanel)
  ui:setId(panelName)

  if not storage[panelName] then
  storage[panelName] = {
    enabled = false,
    outfitid = "0",
    outfithack = false,
    findOutfit = false
  }
  end

  local config = storage[panelName]

  ui.titleoutfit:setOn(config.enabled)
  ui.titleoutfit.onClick = function(widget)
  config.enabled = not config.enabled
  widget:setOn(config.enabled)
  end

  ui.outfitid.onClick = function(widget)
    outfitidWindow:show()
    outfitidWindow:raise()
    outfitidWindow:focus()
  end
macro(1, function()
  if ui.titleoutfit:isOn() then 
    ui.titleoutfit:setText("ENABLED")
  else 
    ui.titleoutfit:setText("DISABLED")
  end
end)
  rootWidget = g_ui.getRootWidget()
    if rootWidget then

      outfitidWindow = UI.createWindow('outfitidWindow', rootWidget)
      outfitidWindow:hide()

      outfitidWindow.closeButton.onClick = function(widget)
      outfitidWindow:hide()
    end
      outfitidWindow.IDAQUI.onTextChange = function(widget, text)
      config.outfitid = text
    end
   outfitidWindow.IDAQUI:setText(config.outfitid)
 end
       outfitidWindow.findOutfit:setOn(config.findOutfit)
      outfitidWindow.findOutfit.onClick = function(widget)
      config.findOutfit = not config.findOutfit
      widget:setOn(config.findOutfit)
        end

macro(1, function()
if config.enabled then
  if not config.findOutfit then
    if player:getOutfit().type ~= tonumber(config.outfitid) then
      player:setOutfit({type = tonumber(config.outfitid)})
    end
end
end
end)

local tiype = 0
macro(100,function()
  if config.findOutfit then
    tiype = tiype +1
    player:setOutfit({type = tiype})
    outfitidWindow.label2:setText(tiype)
    outfitidWindow.label2:setColor("pink")
end
end)

outfitidWindow.resetButton.onClick = function(widget)
  tiype = 0
  outfitidWindow.label2:setText("start to count!")
  outfitidWindow.label2:setColor("teal")
  player:setOutfit({type = tonumber(config.outfitid)})
end