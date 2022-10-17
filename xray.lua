

macro(1, function()

    for _, spec in ipairs(getSpectators(true)) do
        if spec:getPosition().z > posz() then
            local tile = g_map.getTile({x = spec:getPosition().x, y = spec:getPosition().y, z = posz()})
            if tile then
                if spec:isPlayer() then
                    tile:setText("[USER] ".. spec:getName(), "lightGray")
                elseif spec:isMonster() then
                    tile:setText("[MONSTER] ".. spec:getName(), "lightGray")
                elseif spec:isNpc() then 
                    tile:setText("[NPC] ".. spec:getName(), "lightGray")
                end
            end
        end
    end
end)

onCreaturePositionChange(function(creature, newPos, oldPos)
  if creature == player then return end
  if type(oldPos) ~= "table" then return end  
      oldPos = {x = oldPos.x, y = oldPos.y, z = posz()}
      local tile = g_map.getTile(oldPos)
      if (tile) then
          tile:setText()
      end
end)