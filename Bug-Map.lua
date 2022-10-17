local function checkPos(x, y)
 xyz = g_game.getLocalPlayer():getPosition()
 xyz.x = xyz.x + x
 xyz.y = xyz.y + y
 tile = g_map.getTile(xyz)
 if tile then
  return g_game.use(tile:getTopUseThing())  
 else
  return false
 end
end

setDefaultTab("Main")
bugMap = macro(1, "Bug-Map", function() 
 if modules.corelib.g_keyboard.isKeyPressed('Up') then
  checkPos(0, -5)
 elseif modules.corelib.g_keyboard.isKeyPressed('Right') then
  checkPos(5, 0)
 elseif modules.corelib.g_keyboard.isKeyPressed('Down') then
  checkPos(0, 5)
 elseif modules.corelib.g_keyboard.isKeyPressed('Left') then
  checkPos(-5, 0)
 end
end)
