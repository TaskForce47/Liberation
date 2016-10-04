params ["_unit"];

private _arr = [""]+ GRLIB_arsenal_weapons + GRLIB_arsenal_items + GRLIB_arsenal_backpacks;

private _checkarr = [
	uniform _unit, 
	vest _unit, 
	primaryWeapon _unit, 
	secondaryWeapon _unit, 
	handgunWeapon _unit, 
	goggles _unit, 
	backpack _unit
];
/*
{
	_checkarr pushBack _x;
} foreach backpackItems _unit;
*/
{
	_checkarr pushBack _x;
} foreach assignedItems _unit;
{
	_checkarr pushBack _x;
} foreach items _unit;

{
    //somewhat drastic but ok :P
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
