if(isServer || !hasInterface)exitWith{};
[
	{
		if([] call TFAR_fnc_isTeamSpeakPluginEnabled)then{
		
			cutText ["","BLACK",0.5,true];
		
		}else{
		
			cutText ["","BLACK IN",0.5,true];
		
		};	
	
	},
	0.5,
	[]
] call CBA_fnc_addPerFrameHandler;