[
	{
		if (( daytime > 18.40 || daytime < 5.5 )) then {
			setTimeMultiplier 8;
		} else {
			setTimeMultiplier 4;
		};
	},
	180,
	[]
] call CBA_fnc_addPerFrameHandler;
