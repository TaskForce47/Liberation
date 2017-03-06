if(!hasInterface) exitWith {};
_debug = false;
_pl = _this select 0;
if (!isMultiplayer) then {Systemchat format ["Start Saving for: %1", _pl];};

private _position = getPos _pl;
private _dir = getDir _pl;
private _position_dir_arr = [_position, _dir];
private _uniform = uniform _pl;
private _vest = vest _pl;
private _headgear = headgear _pl;
private _backpack = backpack _pl;
private _priWeaponmag = primaryWeaponMagazine _pl;
private _priWeapon = primaryWeapon  _pl;
private _secWeaponmag = secondaryWeaponMagazine _pl;
private _secWeapon = secondaryWeapon _pl;
private _hndgunmag = handgunMagazine _pl;
private _hndgun = handgunWeapon _pl;
private _linkedItems = assignedItems _pl;
{
	if (count _x > 11)	then {
		if (([_x, 0, 10] call BIS_fnc_trimString) == "tf_anprc152") then {
			_linkedItems set [_foreachIndex, "ItemRadio"];
		};
	};
} foreach _linkedItems;
private _weappriacc = _pl weaponAccessories (primaryWeapon _pl);
private _weapsecacc = _pl weaponAccessories (secondaryWeapon _pl);
private _weaphandacc = _pl weaponAccessories (handgunWeapon _pl);
private _Cloth_Weap_arr = [ _uniform, _vest, _headgear, _backpack, _priWeaponmag, _secWeaponmag, _hndgunmag, _priWeapon, _secWeapon, _hndgun];
private _BackpackItems = backpackItems _pl;
private _uniformItems = uniformItems _pl;
private _vestItems = vestItems _pl;
private _AtrInvArray = [getPlayerUID _pl, _position_dir_arr, _Cloth_Weap_arr, _BackpackItems, _uniformItems, _vestItems, _linkedItems, _weappriacc, _weapsecacc, _weaphandacc];
if (isNil "_AtrInvArray" ) exitWith{true};
if (typeName _AtrInvArray == "ARRAY") then {
	profilenamespace setVariable [  ((format ["TF47_Inventory_Liberation_on_%1", worldName])), _AtrInvArray];
};
