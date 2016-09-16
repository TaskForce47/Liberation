if(GRLIB_endgame == 1 ) exitWith {};

/********************************/
/* kill fnc call if there are	*/
/* still bg units active		*/
/********************************/
if ( isNil "TF47_battlegroup_activeGroups" ) then { TF47_battlegroup_activeGroups = 0 };
if(	TF47_battlegroup_activeGroups	>=	0)exitWith{};

/********************************/
/* some balancing 				*/
/********************************/
private _players	=	count allPlayers;
private _attackSize = 	"none";
switch(true)do{
	case(_players	>10):{_attackSize 	=	"small";	};
	case(_players	>20):{_attackSize 	=	"medium";	};
	case(_players	>30):{_attackSize	=	"mayhem";	};
};
if(_attackSize	==	"none")exitWith{TF47_helper_battlegroupSlumber 	=	TF47_helper_battlegroupSlumber 	+1;};

/********************************/
/* find the spawnpoint			*/
/********************************/
private _spawn_marker 	= "";
if ( count _this == 1 ) then {
	// sector_liberated_remote_call.sqf
	_spawn_marker = [ 2000, 5000, false, _this select 0 ] call F_findOpforSpawnPoint;
} else {
	_spawn_marker = [ 2000, 5000, false ] call TF47_helper_findOpforSpawnPoint;
};
if(_spawn_marker	==	"")exitWith{TF47_helper_battlegroupSlumber 	=	TF47_helper_battlegroupSlumber 	+1;};

private _bg_groups 		= [];
private _bg_counter 	= 0;

/********************************/
/* now let's get serious		*/
/********************************/
GRLIB_last_battlegroup_time = time;

private _composition =	selectRandom [	"mot",	"mech",	"air",	"arm"];	

private _selected_opfor_battlegroup =	[_attackSize,_composition] call TF47_battlegroup_config;
private _tf74_rhs_transports		=	["RHS_UH60M","rhsusf_M1083A1P2_B_wd_fmtv_usarmy","rhsusf_M1078A1P2_B_M2_wd_fmtv_usarmy","RHS_CH_47F","rhsusf_CH53E_USMC"];
private _tf47_rhs_small_transports	=	["RHS_UH1Y","RHS_M2A3_BUSKIII_wd","rhsusf_m113_usarmy_M240"];

{

	private _vehicle = [markerpos _spawn_marker, _x] call F_libSpawnVehicle;
	private _nextgrp =	group ((crew _vehicle) select 0);
	_nextgrp	setVariable ["TF47_battlegroup_isBattlegroup",true];
	_bg_groups pushback _nextgrp;
	_bg_counter = _bg_counter + 1;
	while {(count (waypoints _nextgrp)) != 0} do {deleteWaypoint ((waypoints _nextgrp) select 0);};
	
	if ( ( _x in _tf74_rhs_transports ) &&  ( [] call F_opforCap < GRLIB_battlegroup_cap ) ) then {
		
		private _grp	=	createGroup	TF47_helper_opposingFaction;
		{
			private _ent 	=	_grp	createUnit [_x, [0,0,10000], [],5,"NONE"];
			_ent moveInCargo _vehicle;
		} foreach ([] call F_getAdaptiveSquadComp);
		_grp setVariable ["TF47_battlegroup_isBattlegroup",true];
		_bg_groups pushback _grp;
		_bg_counter = _bg_counter + 1;
		while {(count (waypoints _grp)) != 0} do {deleteWaypoint ((waypoints _grp) select 0);};
		
		// fill those big birds with extrapunch
		if ( ( _x in ["RHS_CH_47F","rhsusf_CH53E_USMC"] ) &&  ( [] call F_opforCap < GRLIB_battlegroup_cap ) ) then {
			private _grp	=	createGroup	TF47_helper_opposingFaction;
			{
				private _ent 	=	_grp	createUnit [_x, [0,0,10000], [],5,"NONE"];
				_ent moveInCargo _vehicle;
			} foreach ([] call F_getAdaptiveSquadComp);
			_grp setVariable ["TF47_battlegroup_isBattlegroup",true];
			_bg_groups pushback _grp;
			_bg_counter = _bg_counter + 1;
			while {(count (waypoints _grp)) != 0} do {deleteWaypoint ((waypoints _grp) select 0);};
		};
	};
	if ( ( _x in _tf47_rhs_small_transports ) &&  ( [] call F_opforCap < GRLIB_battlegroup_cap ) ) then {
		
		private _grp	=	createGroup	TF47_helper_opposingFaction;
		{
			private _ent 	=	_grp	createUnit [_x, [0,0,10000], [],5,"NONE"];
			_ent moveInCargo _vehicle;
		} foreach (	([] call F_getAdaptiveSquadComp)	resize 6);
		_grp setVariable ["TF47_battlegroup_isBattlegroup",true];
		_bg_groups pushback _grp;
		_bg_counter = _bg_counter + 1;
		while {(count (waypoints _grp)) != 0} do {deleteWaypoint ((waypoints _grp) select 0);};
		
	};
	
} foreach _selected_opfor_battlegroup;

[ [ _spawn_marker ] , "remote_call_battlegroup" ] call BIS_fnc_MP;
sleep 5;
combat_readiness = combat_readiness - (round _bg_counter);
if ( combat_readiness < 0 ) then { combat_readiness = 0 };

stats_hostile_battlegroups = stats_hostile_battlegroups + 1;

/*	HC offloading	*/
{
	if ( local _x ) then {
		_headless_client = [] call F_lessLoadedHC;
		if ( !isNull _headless_client ) then {
			_x setGroupOwner ( owner _headless_client );
		};
	};

} foreach _bg_groups;

/********************************/
/* give that battlegroup a 		*/
/* destination					*/
/********************************/
sleep 10; // wait until desync is over and groups distributed to hcs
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

		private _wp = _x addWaypoint [_objectivepos, 0];
		_wp setWaypointType "SAD";
		_wp setWaypointCompletionRadius 100;

		//Set group properties.
		_x setBehaviour "AWARE";

	};
}foreach _bg_groups;

TF47_helper_battlegroupSlumber	=	0;
