/*
 * Author: mindbl4ster
 * check wether va arsenal loadouts have items not used or are prohibited
 *
 * Arguments:
 * nothing
 *
 * Return Value:
 * nothing
 *
 * Example:
 *  [] call tf47_arsenal_fnc_preInitArsenal;
 *
 * Public: yes
*/
#define ISSTRING(ARG) ( ARG isEqualType "" )
#define ISARRAY(ARG) ( ARG isEqualType [] )
#define EVAL(ARG,LIST) ARG = if !(ARG in LIST)then{ "" }else{ ARG }

private _pathToConfigs = "tf47\config\liberation\modconfig\";
tf47_arsenal_modconfig_rhs_usaf = compileFinal preprocessFileLineNumbers (_pathToConfigs + "tf47_config_rhs_usaf.sqf");
tf47_arsenal_modconfig_s4 = compileFinal preprocessFileLineNumbers (_pathToConfigs + "tf47_config_s4Gear.sqf");
tf47_arsenal_modconfig_milGear = compileFinal preprocessFileLineNumbers (_pathToConfigs + "tf47_config_milGear.sqf");
tf47_arsenal_modconfig_niarms = compileFinal preprocessFileLineNumbers (_pathToConfigs + "tf47_config_niarms.sqf");
tf47_arsenal_modconfig_bwa3 = compileFinal preprocessFileLineNumbers (_pathToConfigs + "tf47_config_bwa3.sqf");
tf47_arsenal_modconfig_3cb = compileFinal preprocessFileLineNumbers (_pathToConfigs + "tf47_config_3cb_baf.sqf");
tf47_arsenal_modconfig_ace3 = compileFinal preprocessFileLineNumbers (_pathToConfigs + "tf47_config_ace3.sqf");

private _modListToUse =[];
{
  if !(isNil _x) then {_modListToUse pushBack _x; };
} forEach [
  "tf47_arsenal_modconfig_rhs_usaf",
  "tf47_arsenal_modconfig_s4",
  "tf47_arsenal_modconfig_milGear",
  "tf47_arsenal_modconfig_niarms",
  "tf47_arsenal_modconfig_bwa3",
  //"tf47_arsenal_modconfig_3cb",
  "tf47_arsenal_modconfig_ace3"
];

private _weapons = [];
private _magazines = [];
{
  {
    if( isClass (configFile >> "cfgWeapons" >> _x) ) then {
      _weapons pushBack _x;
      private _mags = getArray (configfile >> "cfgweapons" >> _x >> "magazines" );
      { if !( _x in _magazines )then{ _magazines pushBack _x; }; }forEach _mags;
    };
  }forEach ( ["w"] call (call compile _x) );
}forEach _modListToUse;

private _items = [];
{
  {
    if( isClass (configFile >> "cfgWeapons" >> _x) ) then {
      _items pushBack _x;
    };
    false
  }count ( ["i"] call (call compile _x) );
  false
}count _modListToUse;

private _backpacks = [];
{
  {
    if( isClass (configFile >> "CfgVehicles" >> _x) ) then {
      _backpacks pushBack _x;
    };
    false
  }count ( ["b"] call (call compile _x) );
  false
}count _modListToUse;

private _cargo = [_items,_weapons,_magazines,_backpacks];
player setvariable ["bis_addVirtualWeaponCargo_cargo",_cargo];
[] call tf47_arsenal_fnc_preInitGetGear;
