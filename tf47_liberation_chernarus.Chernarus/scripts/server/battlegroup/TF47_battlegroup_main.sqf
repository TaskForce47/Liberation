private [ "_sleeptime", "_target_player", "_target_pos" ];

if ( isNil "infantry_weight" ) then { infantry_weight = 33 };
if ( isNil "armor_weight" ) then { armor_weight = 33 };
if ( isNil "air_weight" ) then { air_weight = 33 };
if ( isNil "TF47_battlegroup_activeGroups" ) then { TF47_battlegroup_activeGroups = 0 };

if ( !isNil "GRLIB_last_battlegroup_time" ) then {	
	//GRLIB_last_battlegroup_time = 3600/GRLIB_csat_aggressivity;	// value gets readjusted in "spawn_baatlegroup"
};
GRLIB_last_battlegroup_time	= 100;
private _sleep = 30*60;

//private _sleep = 90;
[
	{
		//"[ INFO ] TF47 Battlegroup: Loop start" remoteExec ["systemchat",0];
		if(GRLIB_csat_aggressivity >= 0.9 && GRLIB_endgame == 0) then {
			
			// counter battlegroup
			if(combat_readiness >= 30 && 	(armor_weight >= 50 || air_weight >= 50)	) then {
				if( (count allPlayers >= (10 / GRLIB_csat_aggressivity) ) && (diag_fps > 15.0) )then{
					[] call TF47_battlegroup_air;
				};
			};
			
			// random battlegroup
			if(time > GRLIB_last_battlegroup_time) then {
			
				if( (count allPlayers >= (10 / GRLIB_csat_aggressivity) ) && (diag_fps > 15.0) )then{
				
					if ( ([] call F_opforCap < GRLIB_battlegroup_cap) && (combat_readiness >= 40)) then {
					
						"[ INFO ] TF47 Battlegroup: The dragon awakens!" remoteExec ["diag_log",0];
						//( daytime > 20 || daytime < 4 )
						if(	true )then{
							[] spawn TF47_battlegroup_initParaGroup;
						}else{
							//[] spawn spawn_battlegroup;						
						};
					}else{
					
						TF47_helper_battlegroupSlumber 	=	TF47_helper_battlegroupSlumber 	+1;
						
					};
				};				
			};
		}else{
			[_this select 1] call CBA_fnc_removePerFrameHandler;
		};
	},
	_sleep,
	[]
] call CBA_fnc_addPerFrameHandler;

waitUntil { !isNil "blufor_sectors" };
waitUntil { !isNil "combat_readiness" };
waitUntil { !isNil "sectors_bigtown" };
waitUntil { !isNil "active_sectors" };

_sleep = 42	+ random 42;
[
	{		
		[] call TF47_helper_getPlayerBalance;
			
		if ( (count blufor_sectors) >= ((count sectors_allSectors) * 0.9)) then {
			if ( combat_readiness > 0 ) then {
				combat_readiness = combat_readiness - 0.25;
			};
		} else {
			if ( 
				(combat_readiness < ((count blufor_sectors) * 2) && combat_readiness < 35 ) ||
				(combat_readiness < ((count blufor_sectors) * 1.25) && combat_readiness < 60 )
			) then {
				combat_readiness = combat_readiness + 0.25;
				stats_readiness_earned = stats_readiness_earned + 0.25;
			};
		};

		if ( combat_readiness > 100.0 && GRLIB_difficulty_modifier < 2 ) then { combat_readiness = 100.0 };
	},
	_sleep,
	[]
] call CBA_fnc_addPerFrameHandler;

/*
//retasking frame
_sleep = 20;
[
	{
		if(reset_battlegroups_ai) then {	
			
			private _battlegroups = 0;
			reset_battlegroups_ai = false;
			
			//"[ INFO ] TF47 Battlegroup: MBG: Retasking" remoteExec ["systemchat",0];
						
			{
				private _val = _x	getVariable ["TF47_battlegroup_isBattlegroup",false];
				
				if(_val) then {	
					//reset_battlegroups_ai = false;
					private _objectives = [getPos (leader _x)] call TF47_helper_isAreaReachable;

					if(count _objectives == 0)exitWith{
						{
							if(vehicle _x != _x) then {deleteVehicle (vehicle _x)};
							deleteVehicle _x;
						}foreach units _x;

					};
					
					private _objectivepos = _objectives	select 0;
					[ [ _objectivepos ] , "remote_call_incoming" ] call BIS_fnc_MP;
					while {(count (waypoints _x)) != 0} do {deleteWaypoint ((waypoints _x) select 0);};
					private _wp = _x addWaypoint [_objectivepos, 0];
					_wp setWaypointType "SAD";
					_wp setWaypointCompletionRadius 100;

					//Set group properties.
					_x setBehaviour "AWARE";
					_battlegroups = _battlegroups	+1;	
				};
			}foreach allgroups;
		TF47_battlegroup_activeGroups = _battlegroups;
		//private _str	=	format ["[ INFO ] TF47 Battlegroup: MBG: Retasking complete (%1 Groups)",TF47_battlegroup_activeGroups];
		//_str remoteExec ["systemchat",0];
		
		};
	},
	_sleep,
	[]
] call CBA_fnc_addPerFrameHandler;
*/