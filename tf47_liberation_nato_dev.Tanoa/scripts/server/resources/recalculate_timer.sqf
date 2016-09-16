waitUntil { !isNil "save_is_loaded" };
[
	{
		please_recalculate = true;
	},
	3,
	[]
] call CBA_fnc_addPerFrameHandler;
