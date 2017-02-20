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
#define EVAL(ARG,LIST) ( ARG = if !(ARG in LIST)then{ "" }else{ ARG } )

private _pathToConfigs = "tf47\config\liberation\modconfig\";
tf47_arsenal_modconfig_rhs_usaf = compileFinal preprocessFileLineNumbers (_pathToConfigs + "tf47_config_rhs_usaf.sqf");
tf47_arsenal_modconfig_s4 = compileFinal preprocessFileLineNumbers (_pathToConfigs + "tf47_config_s4Gear.sqf");
tf47_arsenal_modconfig_milGear = compileFinal preprocessFileLineNumbers (_pathToConfigs + "tf47_config_milGear.sqf");
tf47_arsenal_modconfig_niarms = compileFinal preprocessFileLineNumbers (_pathToConfigs + "tf47_config_niarms.sqf");
tf47_arsenal_modconfig_bwa3 = compileFinal preprocessFileLineNumbers (_pathToConfigs + "tf47_config_bwa3.sqf");
tf47_arsenal_modconfig_3cb = compileFinal preprocessFileLineNumbers (_pathToConfigs + "tf47_config_3cb_baf.sqf");

private _modListToUse =[];
{
  if !(isNil _x) then {_modListToUse pushBack _x; };
} forEach [
  "call tf47_arsenal_modconfig_rhs_usaf",
  "call tf47_arsenal_modconfig_s4",
  "call tf47_arsenal_modconfig_milGear",
  "call tf47_arsenal_modconfig_niarms",
  "call tf47_arsenal_modconfig_bwa3",
  "call tf47_arsenal_modconfig_3cb"
];

private _weapons = [];
private _magazines = [];
{
  {
    diag_log _x;
    if( isClass (configFile >> "cfgWeapons" >> _x) ) then {
      _weapons pushBack _x;
      diag_log _x;
      private _mags = getArray (configfile >> "cfgweapons" >> _x >> "magazines" );
      { if !( _x in _magazines )then{ _magazines pushBack _x; }; }forEach _mags;
    };
    false
  }count ( ["w"] call (compile _x) );
}forEach _modListToUse;

private _items = [];
{
  {
    if( isClass (configFile >> "cfgWeapons" >> _x) ) then {
      _items pushBack _x;
    };
    false
  }count ( ["i"] call (compile _x) );
  false
}count _modListToUse;

private _backpacks = [];
{
  {
    if( isClass (configFile >> "cfgWeapons" >> _x) ) then {
      _items pushBack _x;
    };
    false
  }count ( ["b"] call (compile _x) );
  false
}count _modListToUse;

private _cargo = [_items,_weapons,_magazines,_backpacks];
player setvariable ["bis_addVirtualWeaponCargo_cargo",_cargo];

//*************************************************************************************************************************//
//*************************************************************************************************************************//

private _vArsenalList = profileNamespace getVariable [ "bis_fnc_saveInventory_data", [] ];
private _filteredPlayerGear = [];
private _checkArray = _items + _weapons + _magazines + _backpacks;

private _max = (count _vArsenalList)-1;
if(_max > 0 )then{

  for "_i" from 1 to _max step 2 do {

    (_vArsenalList select _i) params ["_vagear",[]];
    _vaGear params ["_uniFormA","_vestA","_backpackA","_head","_goggles","_binoc","_primA","_secA","_launcherA","_itemsA"];

    _uniformA params ["_uniform","_itemsInUniform"];
    if !(_uniform isEqualTo "")then{
      EVAL(_uniform,_checkArray);
      {
        _itemsInUniform set [_forEachIndex, EVAL(_x,_checkArray)];
      }forEach _itemsInUniform;
    };
    _uniformA = [_uniform,_itemsInUniform];

    _vestA params ["_vest","_itemsInVest"];
    if !(_vest isEqualTo "")then{
      EVAL(_vest,_checkArray);
      {
        _itemsInVest set [_forEachIndex, EVAL(_x,_checkArray)];
      }forEach _itemsInVest;
    };
    _vestA = [_vest, _itemsInVest];

    _backpackA params ["_backPack","_itemsInBackpack"];
    if !(_backPack isEqualTo "")then{
      EVAL(_backPack,_checkArray);
      {
        _itemsInBackpack set [_forEachIndex, EVAL(_x,_checkArray)];
      }forEach _itemsInBackpack;
    };
    _backpackA = [_backPack, _itemsInBackpack];

    if !(_head isEqualTo "")then { EVAL(_head,_checkArray) };
    if !(_goggles isEqualTo "")then{ EVAL(_goggles,_checkArray) };
    if !(_binoc isEqualTo "")then{ EVAL(_binoc,_checkArray) };

    _primA params ["_prim","_primAttachments","_primMag"];
    if !(_prim isEqualTo "")then{
      if !(_primMag isEqualTo "")then{  EVAL(_primMag,_checkArray) };
      EVAL(_prim,_checkArray)
      {
        _primAttachments set [_forEachIndex, EVAL(_x,_checkArray)];
      }forEach _primAttachments;
    };
    _primA = [_prim,_primAttachments,_primMag];

    _secA params ["_sec","_secAttachments","_secMag"];
    if !(_sec isEqualTo "")then{
      if !(_secMag isEqualTo "")then{  EVAL(_secMag,_checkArray) };
      EVAL(_sec,_checkArray);
      {
        _secAttachments set [_forEachIndex, EVAL(_x,_checkArray)];
      }forEach _secAttachments;
    };
    _secA = [_sec, _secAttachments, _secMag];

    _launcherA params ["_launcher","_launcherAttach","_launcherMag"];
    if !(_launcher isEqualTo "")then{
      if !(_launcherMag isEqualTo "")then{  EVAL(_launcherMag,_checkArray) };
      EVAL(_launcher,_checkArray);
      {
        _launcherAttach set [_forEachIndex, EVAL(_x,_checkArray)];
      }forEach _launcherAttach;
    };
    _launcherA = [_launcher, _launcherAttach, _launcherMag];

    {
      _itemsA set [_forEachIndex, EVAL(_x,_checkArray)];
    }forEach _itemsA;

    _vaGear = [_uniFormA,_vestA,_backpackA,_head,_goggles,_binoc,_primA,_secA,_launcherA,_itemsA];
    _vArsenalList set [_i, _vaGear];
  };
};
profileNameSpace setVariable ["tf47_arsenal_filteredGear",_vArsenalList];
saveProfileNamespace;
