
g_ui.loadUIFromString([[
MouseSourceBoxPopupMenu < ComboBoxPopupMenu
MouseSourceBoxPopupMenuButton < ComboBoxPopupMenuButton
MouseSourceBox < ComboBox
  @onSetup: |
    self:addOption("Scroll Up")
    self:addOption("Scroll Down")
    self:addOption("MButton1")
    self:addOption("MButton2")

MouseHealEntry < Label
  background-color: alpha
  text-offset: 18 0
  focusable: true
  height: 16

  CheckBox
    id: enabled
    anchors.left: parent.left
    anchors.verticalCenter: parent.verticalCenter
    width: 15
    height: 15
    margin-top: 2
    margin-left: 3

  $focus:
    background-color: #00000055

  Button
    id: remove
    !text: tr('x')
    anchors.right: parent.right
    margin-right: 15
    width: 15
    height: 15

MouseItemEntry < Label
  background-color: alpha
  text-offset: 2 0
  focusable: true
  height: 16

  $focus:
    background-color: #00000055

  Button
    id: remove
    !text: tr('x')
    anchors.right: parent.right
    margin-right: 15
    width: 15
    height: 15                       

SpellMouse < Panel
  image-source: /images/ui/panel_flat
  image-border: 6
  padding: 3
  size: 490 130

  Label
    id: whenSpell
    anchors.left: spellList.right
    anchors.top: parent.top
    text: When:
    margin-top: 10
    margin-left: 7

  MouseSourceBox
    id: spellSource
    anchors.top: parent.top
    anchors.left: whenSpell.right
    margin-top: 5
    margin-left: 35
    width: 128

  Label
    id: castSpell
    anchors.left: spellList.right
    anchors.top: whenSpell.bottom
    text: Cast:
    margin-top: 9
    margin-left: 7

  TextEdit
    id: spellFormula
    anchors.left: spellSource.left
    anchors.top: spellSource.bottom
    anchors.right: spellValue.right


  TextList
    id: spellList
    anchors.left: parent.left
    anchors.bottom: parent.bottom
    padding: 1
    size: 270 116    
    margin-bottom: 3
    margin-left: 3
    vertical-scrollbar: spellListScrollBar

  VerticalScrollBar
    id: spellListScrollBar
    anchors.top: spellList.top
    anchors.bottom: spellList.bottom
    anchors.right: spellList.right
    step: 14
    pixels-scroll: true

  Button
    id: addSpell
    anchors.right: parent.right
    anchors.bottom: parent.bottom
    margin-bottom: 2
    margin-right: 10
    text: Add
    size: 40 17
    font: cipsoftFont

  Button
    id: MoveUp
    anchors.right: prev.left
    anchors.bottom: parent.bottom
    margin-bottom: 2
    margin-right: 5
    text: Move Up
    size: 55 17
    font: cipsoftFont

  Button
    id: MoveDown
    anchors.right: prev.left
    anchors.bottom: parent.bottom
    margin-bottom: 2
    margin-right: 5
    text: Move Down
    size: 55 17
    font: cipsoftFont  

ItemMouse < Panel
  image-source: /images/ui/panel_flat
  image-border: 6
  padding: 3
  size: 490 130

  Label
    id: whenItem
    anchors.left: itemList.right
    anchors.top: parent.top
    text: When:
    margin-top: 10
    margin-left: 7

  MouseSourceBox
    id: itemSource
    anchors.top: parent.top
    anchors.left: whenItem.right
    margin-top: 5
    margin-left: 35
    width: 128


  Label
    id: useItem
    anchors.left: itemList.right
    anchors.top: whenItem.bottom
    text: Use:
    margin-left: 50
    margin-top: 40

  BotItem
    id: itemId
    anchors.left: useItem.right
    anchors.top: itemSource.bottom
    margin-left: 30
    margin-top: 24

  TextList
    id: itemList
    anchors.left: parent.left
    anchors.bottom: parent.bottom
    padding: 1
    size: 270 116  
    margin-top: 3
    margin-bottom: 3
    margin-left: 3
    vertical-scrollbar: itemListScrollBar

  VerticalScrollBar
    id: itemListScrollBar
    anchors.top: itemList.top
    anchors.bottom: itemList.bottom
    anchors.right: itemList.right
    step: 14
    pixels-scroll: true

  Button
    id: addItem
    anchors.right: parent.right
    anchors.bottom: parent.bottom
    margin-bottom: 2
    margin-right: 10
    text: Add
    size: 40 17
    font: cipsoftFont

  Button
    id: MoveUp
    anchors.right: prev.left
    anchors.bottom: parent.bottom
    margin-bottom: 2
    margin-right: 5
    text: Move Up
    size: 55 17
    font: cipsoftFont

  Button
    id: MoveDown
    anchors.right: prev.left
    anchors.bottom: parent.bottom
    margin-bottom: 2
    margin-right: 5
    text: Move Down
    size: 55 17
    font: cipsoftFont 

MouseWindow < MainWindow
  !text: tr('Mouse Bot')
  size: 520 350
  @onEscape: self:hide()

  SpellMouse
    id: spells
    anchors.top: parent.top
    anchors.left: parent.left

  ItemMouse
    id: items
    anchors.top: prev.bottom
    anchors.left: parent.left
    margin-top: 10

  HorizontalSeparator
    id: separator
    anchors.right: parent.right
    anchors.left: parent.left
    anchors.bottom: closeButton.top
    margin-bottom: 8    

  Button
    id: closeButton
    !text: tr('Close')
    font: cipsoftFont
    anchors.right: parent.right
    anchors.bottom: parent.bottom
    size: 45 21
    margin-top: 15
    margin-right: 5

]])
storage.lootStatus = ""
MousePanelName = "Mousebot"
local ui = setupUI([[
Panel
  height: 30

  Label 
    id: label 
    text: ~ MouseBot:
    anchors.top: parent.top 
    anchors.left: parent.left 
    margin-left: 50
    font: cipsoftFont
    color: #E0FFFF

  BotSwitch
    id: title
    anchors.top: label.bottom
    anchors.left: parent.left
    text-align: center
    width: 115
    font: terminus-14px-bold
    color: yellow

  Button
    id: combos
    anchors.top: prev.top
    anchors.left: prev.right
    anchors.right: parent.right
    margin-left: 3
    height: 17
    text: SETUP 
    font: verdana-11px-rounded

]])
ui:setId(MousePanelName)

if not storage[MousePanelName] or not storage[MousePanelName].spellTable or not storage[MousePanelName].itemTable then
  storage[MousePanelName] = {
    enabled = false,
    spellTable = {},
    itemTable = {}
  }
end

ui.title:setOn(storage[MousePanelName].enabled)
ui.title.onClick = function(widget)
storage[MousePanelName].enabled = not storage[MousePanelName].enabled
widget:setOn(storage[MousePanelName].enabled)
end

macro(1, function()
  if ui.title:isOn() then 
    ui.title:setText("ENABLED")
  else 
    ui.title:setText("DISABLED")
  end
end)

ui.combos.onClick = function(widget)
  MouseWindow:show()
  MouseWindow:raise()
  MouseWindow:focus()
end


rootWidget = g_ui.getRootWidget()
if rootWidget then
  MouseWindow = g_ui.createWidget('MouseWindow', rootWidget)
  MouseWindow:hide()

  local refreshSpells = function()
    if storage[MousePanelName].spellTable and #storage[MousePanelName].spellTable > 0 then
      for i, child in pairs(MouseWindow.spells.spellList:getChildren()) do
        child:destroy()
      end
      for _, entry in pairs(storage[MousePanelName].spellTable) do
        local label = g_ui.createWidget("SpellEntry", MouseWindow.spells.spellList)
        label.enabled:setChecked(entry.enabled)
        label.enabled.onClick = function(widget)
          entry.enabled = not entry.enabled
          label.enabled:setChecked(entry.enabled)
        end
        label.remove.onClick = function(widget)
          table.removevalue(storage[MousePanelName].spellTable, entry)
          reindexTable(storage[MousePanelName].spellTable)
          label:destroy()
        end
        label:setText(entry.origin.. ": ".. entry.spell)
      end
    end
  end
  refreshSpells()

  local refreshItems = function()
    if storage[MousePanelName].itemTable and #storage[MousePanelName].itemTable > 0 then
      for i, child in pairs(MouseWindow.items.itemList:getChildren()) do
        child:destroy()
      end
      for _, entry in pairs(storage[MousePanelName].itemTable) do
        local label = g_ui.createWidget("SpellEntry", MouseWindow.items.itemList)
        label.enabled:setChecked(entry.enabled)
        label.enabled.onClick = function(widget)
          entry.enabled = not entry.enabled
          label.enabled:setChecked(entry.enabled)
        end
        label.remove.onClick = function(widget)
          table.removevalue(storage[MousePanelName].itemTable, entry)
          reindexTable(storage[MousePanelName].itemTable)
          label:destroy()
        end
        label:setText(entry.origin .. entry.sign .. entry.value .. ":" .. entry.item)
      end
    end
  end
  refreshItems()

  MouseWindow.spells.MoveUp.onClick = function(widget)
    local input = MouseWindow.spells.spellList:getFocusedChild()
    if not input then return end
    local index = MouseWindow.spells.spellList:getChildIndex(input)
    if index < 2 then return end

    local move
    if storage[MousePanelName].spellTable and #storage[MousePanelName].spellTable > 0 then
      for _, entry in pairs(storage[MousePanelName].spellTable) do
        if entry.index == index -1 then
          move = entry
        end
        if entry.index == index then
          move.index = index
          entry.index = index -1
        end
      end
    end
    table.sort(storage[MousePanelName].spellTable, function(a,b) return a.index < b.index end)

    MouseWindow.spells.spellList:moveChildToIndex(input, index - 1)
    MouseWindow.spells.spellList:ensureChildVisible(input)
  end

  MouseWindow.spells.MoveDown.onClick = function(widget)
    local input = MouseWindow.spells.spellList:getFocusedChild()
    if not input then return end
    local index = MouseWindow.spells.spellList:getChildIndex(input)
    if index >= MouseWindow.spells.spellList:getChildCount() then return end

    local move
    local move2
    if storage[MousePanelName].spellTable and #storage[MousePanelName].spellTable > 0 then
      for _, entry in pairs(storage[MousePanelName].spellTable) do
        if entry.index == index +1 then
          move = entry
        end
        if entry.index == index then
          move2 = entry
        end
      end
      if move and move2 then
        move.index = index
        move2.index = index + 1
      end
    end
    table.sort(storage[MousePanelName].spellTable, function(a,b) return a.index < b.index end)

    MouseWindow.spells.spellList:moveChildToIndex(input, index + 1)
    MouseWindow.spells.spellList:ensureChildVisible(input)
  end

  MouseWindow.items.MoveUp.onClick = function(widget)
    local input = MouseWindow.items.itemList:getFocusedChild()
    if not input then return end
    local index = MouseWindow.items.itemList:getChildIndex(input)
    if index < 2 then return end

    local move
    if storage[MousePanelName].itemTable and #storage[MousePanelName].itemTable > 0 then
      for _, entry in pairs(storage[MousePanelName].itemTable) do
        if entry.index == index -1 then
          move = entry
        end
        if entry.index == index then
          move.index = index
          entry.index = index - 1
        end
      end
    end
    table.sort(storage[MousePanelName].itemTable, function(a,b) return a.index < b.index end)

    MouseWindow.items.itemList:moveChildToIndex(input, index - 1)
    MouseWindow.items.itemList:ensureChildVisible(input)
  end

  MouseWindow.items.MoveDown.onClick = function(widget)
    local input = MouseWindow.items.itemList:getFocusedChild()
    if not input then return end
    local index = MouseWindow.items.itemList:getChildIndex(input)
    if index >= MouseWindow.items.itemList:getChildCount() then return end

    local move
    local move2
    if storage[MousePanelName].itemTable and #storage[MousePanelName].itemTable > 0 then
      for _, entry in pairs(storage[MousePanelName].itemTable) do
        if entry.index == index +1 then
          move = entry
        end
        if entry.index == index then
          move2 = entry
        end
      end
      if move and move2 then
        move.index = index
        move2.index = index + 1
      end
    end
    table.sort(storage[MousePanelName].itemTable, function(a,b) return a.index < b.index end)

    MouseWindow.items.itemList:moveChildToIndex(input, index + 1)
    MouseWindow.items.itemList:ensureChildVisible(input)
  end

  MouseWindow.spells.addSpell.onClick = function(widget)
 
    local spellFormula = MouseWindow.spells.spellFormula:getText():trim()
    local spellSource = MouseWindow.spells.spellSource:getCurrentOption().text
    local source

    if spellSource == "Scroll Up" then
      source = "Scroll Up"
    elseif spellSource == "Scroll Down" then
      source = "Scroll Down"
    elseif spellSource == "MButton1" then
      source = "Mouse1"
    else
      source = "Mouse2"
    end

    if spellFormula:len() > 0 then
      table.insert(storage[MousePanelName].spellTable,  {index = #storage[MousePanelName].spellTable+1, spell = spellFormula, origin = source, enabled = true})
      MouseWindow.spells.spellFormula:setText('')
    end
    refreshSpells()
  end

  MouseWindow.items.addItem.onClick = function(widget)
 
    local id = MouseWindow.items.itemId:getItemId()
    local trigger = tonumber(MouseWindow.items.itemValue:getText())
    local src = MouseWindow.items.itemSource:getCurrentOption().text
    local eq = MouseWindow.items.itemCondition:getCurrentOption().text
    local source
    local equasion

    if not trigger then
      warn("MouseBot: incorrect trigger value!")
      MouseWindow.items.itemId:setItemId(0)
      MouseWindow.items.itemValue:setText('')
      return
    end

    if spellSource == "Scroll Up" then
      source = "Scroll Up"
    elseif spellSource == "Scroll Down" then
      source = "Scroll Down"
    elseif spellSource == "MButton1" then
      source = "Mouse1"
    elseif spellSource == "MButton2" then
      source = "Mouse2"
    end
  

    if id > 100 then
      table.insert(storage[MousePanelName].itemTable, {index = #storage[MousePanelName].itemTable+1,item = id, sign = equasion, origin = source, value = trigger, enabled = true})
      refreshItems()
      MouseWindow.items.itemId:setItemId(0)
      MouseWindow.items.itemValue:setText('')
    end
  end

  MouseWindow.closeButton.onClick = function(widget)
    MouseWindow:hide()
  end
end

local gamePanel = modules.game_interface.gameMapPanel
  gamePanel.onMouseWheel = function(widget, mousePos, scroll)
    if storage[MousePanelName].enabled then
    for _, entry in pairs(storage[MousePanelName].spellTable) do
      if entry.enabled then
        if entry.origin == "Scroll Up" then
            if scroll == 1 then
              say(entry.spell)
            end
          end
        if entry.origin == "Scroll Down" then 
          if scroll == 2 then
              say(entry.spell)
            end
          end
        end
      end
    end
  end

--spells2

macro(1, function()

if not storage[MousePanelName].enabled then return end
  for _, entry in pairs(storage[MousePanelName].spellTable) do
    if entry.enabled then
      if entry.origin == "Mouse1" then
        if g_mouse.isPressed(7) then
          say(entry.spell)
        end
      end
        if entry.origin == "Mouse2" then
          if g_mouse.isPressed(8) then
            say(entry.spell)
          end    
        end
end
end
end)

-- items
macro(1, function()
  if TargetBot.isOff() then storage.lootStatus = "" end
  if not storage[MousePanelName].enabled or storage.isUsing or #storage[MousePanelName].itemTable == 0 then return end

  if storage.lootStatus:len() > 0 then
    delay(0)
  end
  for _, entry in pairs(storage[MousePanelName].itemTable) do
    local item = findItem(entry.item)
    if item and entry.enabled then
      if entry.origin == "HP%" then
        if entry.sign == "=" and hppercent() == entry.value then
          useWith(entry.item, player)
          return
        elseif entry.sign == ">" and hppercent() >= entry.value then
          useWith(entry.item, player)
          return
        elseif entry.sign == "<" and hppercent() <= entry.value then
          useWith(entry.item, player)
          return
        end
      elseif entry.origin == "HP" then
        if entry.sign == "=" and hp() == tonumberentry.value then
          useWith(entry.item, player)
          return
        elseif entry.sign == ">" and hp() >= entry.value then
          useWith(entry.item, player)
          return
        elseif entry.sign == "<" and hp() <= entry.value then
          useWith(entry.item, player)
          return
        end
      elseif entry.origin == "MP%" then
        if entry.sign == "=" and manapercent() == entry.value then
          useWith(entry.item, player)
          return
        elseif entry.sign == ">" and manapercent() >= entry.value then
          useWith(entry.item, player)
          return
        elseif entry.sign == "<" and manapercent() <= entry.value then
          useWith(entry.item, player)
          return
        end
      elseif entry.origin == "MP" then
        if entry.sign == "=" and mana() == entry.value then
          useWith(entry.item, player)
          return
        elseif entry.sign == ">" and mana() >= entry.value then
          useWith(entry.item, player)
          return
        elseif entry.sign == "<" and mana() <= entry.value then
          useWith(entry.item, player)
          return
        end   
      end
    end
  end
end)