waitUntil { !isNil "huron_typename" };
[
	{
		Overlord setCuratorCoef ["edit", -1e8];
		Overlord setCuratorCoef ["place", -1e8];
		Overlord setCuratorCoef ["synchronize", 0];
		Overlord setCuratorCoef ["delete", 0];
		Overlord setCuratorCoef ["destroy", -1e8];
	},
	30,
	[]
] call CBA_fnc_addPerFrameHandler;
