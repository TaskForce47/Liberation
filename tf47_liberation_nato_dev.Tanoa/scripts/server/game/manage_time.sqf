[
	{
		if (( daytime > 18.5 || daytime < 6.4 )) then {
			setTimeMultiplier 8;
		};
		if (( daytime < 7  && daytime > 6.4 )) then {
			setTimeMultiplier 1;
		};
		if (( daytime < 18.5 && daytime > 15 )) then {
			setTimeMultiplier 1;
		};
		if (( daytime > 7  && daytime < 15 )) then {
			setTimeMultiplier 4;
		};
	},
	180,
	[]
] call CBA_fnc_addPerFrameHandler;