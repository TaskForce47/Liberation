[
	{
		if (( daytime > 20 && daytime < 4 )) then {
			setTimeMultiplier 8;
		};
		if (( daytime < 8 && daytime > 4 )) then {
			setTimeMultiplier 1;
		};
		if (( daytime < 20 && daytime > 16 )) then {
			setTimeMultiplier 1;
		};
		if (( daytime > 8 && daytime < 16 )) then {
			setTimeMultiplier 4;
		};
	},
	180,
	[]
] call CBA_fnc_addPerFrameHandler;