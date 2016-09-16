private [ "_weathers", "_weathertime" ];
0 setFog [0,0,0];
[
	{
		600 setFog [0,0,0];
	},
	600, 
	[]
] call CBA_fnc_addPerFrameHandler;