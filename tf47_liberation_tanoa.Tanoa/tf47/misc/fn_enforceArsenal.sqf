/*

	author: TF47  mindbl4ster

	description:
		remove any item not whitelisted

	parameter:
    nothing

	return
		bool - successflag

	example
		[] call tf47_misc_fnc_enforceArsenal;

*/
private _vaArsenal = player getvariable ["bis_addVirtualWeaponCargo_cargo",[]];
private _unit = player;

private _arr = [""];

{
	private _item = _x;
	{_arr pushBack _x;false}count _item;
}forEach _vaArsenal;

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
