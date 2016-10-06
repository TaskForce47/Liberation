private _unit = player;

private _arr = [""];

{_arr pushBack _x;}forEach GRLIB_arsenal_weapons;
{_arr pushBack _x;}forEach GRLIB_arsenal_items;
{_arr pushBack _x;}forEach GRLIB_arsenal_backpacks;

private _checkarr = [
	uniform _unit, 
	vest _unit, 
	primaryWeapon _unit, 
	secondaryWeapon _unit, 
	handgunWeapon _unit, 
	goggles _unit, 
	backpack _unit
];

{
	if (!(_x in _arr))exitWith {
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeAllAssignedItems _unit;
		removeUniform _unit;
		removeVest _unit;
		removeBackpack _unit;
		removeHeadgear _unit;
		removeGoggles _unit;
	};
} forEach _checkarr;