unitcap = 0;
[
	{
		_local_unitcap = 0;
		{
			if ( (side group _x == TF47_helper_playerFaction ) && (alive _x) && ((_x distance lhd) > 250 || (isPlayer _x)) ) then {
				_local_unitcap = _local_unitcap + 1;
			};
		} foreach allUnits;
		unitcap = _local_unitcap;
	},
	2,
	[]
] call CBA_fnc_addPerFrameHandler;