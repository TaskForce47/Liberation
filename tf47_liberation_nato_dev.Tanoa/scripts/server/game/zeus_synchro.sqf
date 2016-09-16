waitUntil { !isNil "huron_typename" };
[
	{
		_zeusunits = [];
		{
			if ( (side group _x == TF47_helper_playerFaction ) && ( _x distance lhd > 1000 ) && alive _x ) then {
				_zeusunits pushback _x;
			};
		} foreach allUnits;

		_units_to_remove = [];
		{
			if ( !(alive _x) ) then {
				_units_to_remove pushback _x;
			};
		} foreach (curatorEditableObjects Overlord);

		Overlord addCuratorEditableObjects [_zeusunits,true];
		Overlord removeCuratorEditableObjects [_units_to_remove,true];
		Overlord setCuratorCoef ["edit", -1e8];
		Overlord setCuratorCoef ["place", -1e8];
		Overlord setCuratorCoef ["synchronize", 0];
		Overlord setCuratorCoef ["delete", 0];
		Overlord setCuratorCoef ["destroy", -1e8];
	},
	30,
	[]
] call CBA_fnc_addPerFrameHandler;
