[
	{
		if (( daytime > 20 || daytime < 4 )) then {
			setTimeMultiplier 8;
		} else {
			setTimeMultiplier 4;
		};
	},
	180,
	[]
] call CBA_fnc_addPerFrameHandler;
