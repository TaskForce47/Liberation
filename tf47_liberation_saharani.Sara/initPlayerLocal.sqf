0 enableChannel [false, false];
1 enableChannel [false, false];
2 enableChannel [false, false];
3 enableChannel [false, false];
{
  [west, (configName _x)] call BIS_fnc_addRespawnInventory;
}forEach ("true" configClasses (missionConfigFile >> "CfgRespawnInventory"));
