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
#include "tf47_macros.hpp"
waitUntil {!isNil "tf47_arsenal_modconfigs"};
private _modListToUse = +tf47_arsenal_modconfigs;

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

["Preload"] call BIS_fnc_arsenal;

[] call tf47_arsenal_fnc_preInitGetGear;
