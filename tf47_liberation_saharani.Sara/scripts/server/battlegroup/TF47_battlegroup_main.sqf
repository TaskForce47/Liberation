private [ "_sleeptime", "_target_player", "_target_pos" ];

if ( isNil "infantry_weight" ) then { infantry_weight = 33 };
if ( isNil "armor_weight" ) then { armor_weight = 33 };
if ( isNil "air_weight" ) then { air_weight = 33 };
if ( isNil "TF47_battlegroup_activeGroups" ) then { TF47_battlegroup_activeGroups = 0 };

waitUntil { !isNil "blufor_sectors" };
waitUntil { !isNil "combat_readiness" };
waitUntil { !isNil "sectors_bigtown" };
waitUntil { !isNil "active_sectors" };
waitUntil { !isnil "GRLIB_csat_aggressivity"};
GRLIB_last_battlegroup_time	= if ( !isNil "GRLIB_last_battlegroup_time" ) then {
	//GRLIB_last_battlegroup_time = 3600/GRLIB_csat_aggressivity;	// value gets readjusted in "spawn_baatlegroup"
}else{
	 100
};
tf47_christmas_fnc_guerillia = compileFinal preprocessFileLineNumbers "scripts\server\battlegroup\tf47_fnc_christmasguerillia.sqf";

[
	{
		//"[ INFO ] TF47 Battlegroup: Loop start" remoteExec ["systemchat",0];
		if(GRLIB_csat_aggressivity >= 0.9 && GRLIB_endgame == 0) then {

			{
				private _grp = _x;
				{
					private _sector	=	_x;
					if ( ( (getMarkerPos _sector) distance2D (getPos (leader _grp) ) ) > GRLIB_sector_size )then{
						{
							if(vehicle _x != _x)then{deleteVehicle (vehicle _x)};
							deleteVehicle _x;
							false
						}count (units _grp);
						_grp remoteExec ["deleteGroup", groupowner _grp];
					};
				}forEach blufor_sectors;
			}forEach (allgroups select {_x getVariable ["TF47_BATTLEGROUP_GUERILLIA",false]} );


			[] call TF47_helper_getPlayerBalance;
			// counter battlegroup
			if(
				( combat_readiness >= 30 ) &&
				( (armor_weight >= 50) || (air_weight >= 50) )
			) then {
				if( (count (allPlayers - entities "headlessclient_f") >= 15 ) && (diag_fps > 30.0) )then{
					[] call TF47_battlegroup_air;
				};
			};
			// random guerilliatroop
			if( time > GRLIB_last_battlegroup_time ) then {
				if( (count (allPlayers - entities "headlessclient_f") >= 15 ) && (diag_fps > 20.0) )then{
					if ( ([] call F_opforCap < GRLIB_battlegroup_cap) && (combat_readiness >= 30) ) then{
						[] call tf47_christmas_fnc_guerillia;
					};
				};
			};
		}else{
			[_this select 1] call CBA_fnc_removePerFrameHandler;
		};
	},
	(60*60),
	[]
] call CBA_fnc_addPerFrameHandler;



[
	{
		if ( combat_readiness > 100.0 && GRLIB_difficulty_modifier < 2 ) then { combat_readiness = 100.0 };
	},
	3,
	[]
] call CBA_fnc_addPerFrameHandler;
