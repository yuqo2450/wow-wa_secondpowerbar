--[[
  Default second power trigger
  Events: UNIT_POWER_UPDATE
  ]]
function(allstates,event,arg1,arg2,...)
  if arg1 ~= "player" then
    return false;
  end

  local class = UnitClassBase("player");
  if class ~= "DEATHKNIGHT" then
    return false;
  end

  local powerIndex,powerName,maxPower = aura_env.GetUnitPowerType("player");
  --[[
    There exists an issue with event PLAYER_ENTERING_WORLD and function UnitPowerMax().
    On the named event UnitPowerMax() retunrs for Chi and HolyPower a value smaller than the actual.
    This causes a lua error that is fixed with the following code.
  ]]
  aura_env.TestStates(allstates, maxPower, powerIndex);
  aura_env.SetPowerValue(allstates,maxPower,powerIndex);
  return true;
end