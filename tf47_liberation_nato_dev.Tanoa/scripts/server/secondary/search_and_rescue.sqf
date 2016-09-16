private _convoy_destinations_markers = [];
while { count _convoy_destinations_markers < 3 } do { 
	_convoy_destinations_markers pushback ([2000,999999,false] call F_findOpforSpawnPoint); 
};
private _couldnt_spawn = false;
{ if ( _x == "" ) exitWith { _couldnt_spawn = true; }; } foreach _convoy_destinations_markers;
if ( _couldnt_spawn ) exitWith { diag_log "Could not find enough map positions for convoy hijack mission"; };

private _convoy_destinations = [];
{ _convoy_destinations pushback (getMarkerPos _x); } foreach _convoy_destinations_markers;

private _convoyspawnpos = _convoy_destinations select 0;
private _spawn_marker = _convoy_destinations select 2;


if (isNil "_spawn_marker") then {
	private _spawn_marker = [ 3000,999999,false] call F_findOpforSpawnPoint;
};

if ( str _spawn_marker == "" ) exitWith { diag_log "Could not find position for search and rescue mission"; };

private _pilots_have_been_found = true;
if ( random 100 > 60 ) then {
	_pilots_have_been_found = false;
};

private _helopos = _spawn_marker getPos  [(200 + random 300), random 359];  
private _helofire = GRLIB_sar_fire createVehicle _helopos;
private _helowreck = GRLIB_sar_wreck createVehicle _helopos;
_helowreck allowDamage false;
_index = TF47_Missionarray pushback [ _spawn_marker, { }, localize "STR_SECONDARY_MISSION2", localize "STR_SECONDARY_BRIEFING2", "", "res\secondary\search_rescue.jpg"];
publicVariable "TF47_Missionarray";
TF47_SARisActive = true;
//___________________________________________ Notification ___________________________________________//

["TF47_TaskAssigned", [(localize "STR_SECONDARY_MISSION2")]] remoteExec ["BIS_fnc_showNotification", EAST, false];

//___________________________________________ Notification ___________________________________________//
_helowreck setPos _helopos;
_helowreck setDir (random 360);
player setPos (_helopos getpos [10, random 359]);
_pilotgroup = createGroup TF47_helper_playerFaction;
_pilot1 = _pilotgroup createUnit [pilot_classname, [0,0,2500], [], 0, "NONE"];
_pilot2 = _pilotgroup createUnit [pilot_classname, [0,0,2500], [], 0, "NONE"];
{ 
    _x setVariable ['NOAI',true,false];
    _x setVariable ['VCOM_NOPATHING_Unit',1,false];
    _x setVariable ["TF47_Missioncritical", true, true];
} foreach [_pilot1, _pilot2];



private _spawnpos = _convoyspawnpos;
[ [ 4, _spawnpos ] , "remote_call_intel" ] call BIS_fnc_MP;

private _scout_vehicle = [ [ _spawnpos, 30, 0 ] call BIS_fnc_relPos, opfor_mrap, true, false, false ] call F_libSpawnVehicle;
private _escort_vehicle = [ [ _spawnpos, 10, 0 ] call BIS_fnc_relPos, selectRandom opfor_vehicles_low_intensity, true, false, false ] call F_libSpawnVehicle;
private _transport_vehicle = [ [ _spawnpos, 10, 180 ] call BIS_fnc_relPos, opfor_ammobox_transport, true, true, false ] call F_libSpawnVehicle;

private _boxes_amount = 0;
{
	if ( _x select 0 == opfor_ammobox_transport ) exitWith { _boxes_amount = (count _x) - 2 };
} foreach box_transport_config;

if ( _boxes_amount == 0 ) exitWith { diag_log "Opfor ammobox truck classname doesn't allow for ammobox transport, correct your classnames.sqf"; };

GRLIB_secondary_in_progress = 1; publicVariable "GRLIB_secondary_in_progress";

private _boxes_loaded = 0;
private _load_box_fnc = compileFinal preprocessFileLineNumbers "scripts\client\ammoboxes\do_load_box.sqf";
while { _boxes_loaded < _boxes_amount } do {
	_boxes_loaded = _boxes_loaded + 1;
	private _next_box = ammobox_o_typename createVehicle ([ _spawnpos, 15, 135 ] call BIS_fnc_relPos);
	_next_box enableRopeAttach true;
	[ [_next_box, 200 ] , "F_setMass" ] call BIS_fnc_MP;
	[ _next_box, 50 ] call _load_box_fnc;
	sleep 1;
};

sleep 1;

_pilot1 setPos (_helopos getPos  [10, random 359] );
_pilot2 setPos (_helopos getPos  [10, random 359] );

private _troop_vehicle = [ [ _spawnpos, 30, 180 ] call BIS_fnc_relPos, opfor_transport_truck, true, true, false ] call F_libSpawnVehicle;

sleep 1;

private _convoy_group = group driver _scout_vehicle;
( crew _escort_vehicle + crew _transport_vehicle + crew _troop_vehicle ) joinSilent _convoy_group;

{
	_x addEventHandler ["HandleDamage", { private [ "_damage" ]; if ( side (_this select 3) != TF47_helper_playerFaction ) then { _damage = 0 } else { _damage = _this select 2 }; _damage } ];
} foreach [ _scout_vehicle, _escort_vehicle, _transport_vehicle, _troop_vehicle ];

_convoy_group setFormation "FILE";
_convoy_group setBehaviour "SAFE";
_convoy_group setSpeedMode "LIMITED";

while {(count (waypoints _convoy_group)) != 0} do {deleteWaypoint ((waypoints _convoy_group) select 0);};
{_x doFollow leader _convoy_group} foreach units _convoy_group;

_waypoint = _convoy_group addWaypoint [_spawn_marker, 0];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointCompletionRadius 50;

_waypoint = _convoy_group addWaypoint [_convoyspawnpos, 0];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointCompletionRadius 50;

_waypoint = _convoy_group addWaypoint [_convoyspawnpos, 0];
_waypoint setWaypointType "CYCLE";
_waypoint setWaypointCompletionRadius 50;

private _troops_group = createGroup TF47_helper_opposingFaction;
{ _x createUnit [_spawnpos, _troops_group,"", 0.5, "private"]; } foreach ([] call F_getAdaptiveSquadComp);
{ _x moveInCargo _troop_vehicle } foreach (units _troops_group);

private _convoy_marker = createMarkerLocal [ format [ "convoymarker%1", round time], getpos _transport_vehicle ];
_convoy_marker setMarkerText (localize "STR_SECONDARY_CSAT_CONVOY");
_convoy_marker setMarkerType "o_armor";
_convoy_marker setMarkerColor "ColorRed";

private _convoy_marker_wp1 = createMarkerLocal [ format [ "convoymarkerwp1%1", round time], _convoyspawnpos];
private _convoy_marker_wp3 = createMarkerLocal [ format [ "convoymarkerwp3%1", round time], _spawn_marker];

{
	_x setMarkerText (localize "STR_SECONDARY_CSAT_CONVOY_WP");
	_x setMarkerType "o_armor";
	_x setMarkerColor "ColorRed";
	_x setMarkerSize [0.6, 0.6];
} foreach [_convoy_marker_wp1, _convoy_marker_wp3];

private _mission_in_progress = true;
private _convoy_attacked = false;
private _convoy_flee = false;
private _disembark_troops = false;

_currentdaytime = daytime - 2;
_failed = false;

while { _mission_in_progress } do {
	if (round (daytime  - _currentdaytime) == 0) then { _mission_in_progress = false; _failed = true; };
	_convoy_marker setMarkerPos (getpos _transport_vehicle);

	if ( !_convoy_attacked ) then {
		{
			if ( !(alive _x) || (damage _x > 0.3) || !(alive driver _x)) exitWith { _convoy_attacked = true; };
		} foreach [_scout_vehicle, _escort_vehicle, _transport_vehicle, _troop_vehicle];
	};

	if ( _convoy_attacked && !_disembark_troops) then {

		_disembark_troops = true;

		if (alive (driver _troop_vehicle)) then {
			private _troop_driver_group = (createGroup TF47_helper_opposingFaction);
			[ driver _troop_vehicle ] joinSilent _troop_driver_group;
			sleep 1;
		};
		{
			unAssignVehicle _x;
			_x action ["eject", vehicle _x];
			_x action ["getout", vehicle _x];
			unAssignVehicle _x;
			sleep 0.7;
		} foreach (units _troops_group);

		_troops_group setBehaviour "COMBAT";
	};
	if ((([getPos _pilot2]call F_getNearestFOB) distance2D (getPos _pilot2) < 200) || (([getPos _pilot1]call F_getNearestFOB) distance2D (getPos _pilot1) < 200)) then {
		_mission_in_progress = false;
		
	};	
	if ((!alive _pilot1) && (!alive _pilot2)) then {
		_failed = true;
		_mission_in_progress = false;
	};

	if ( _convoy_attacked && !_convoy_flee) then {
		_convoy_flee = true;
		_convoy_group setBehaviour "COMBAT";
		_convoy_group setSpeedMode "FULL";
	};
	sleep 5;
};

TF47_Missionarray deleteAt _index;
publicVariable "TF47_Missionarray";
sleep 20;
if (_failed) then {
	combat_readiness = round (combat_readiness * 1.1);
	["TF47_TaskFailed", [(localize "STR_SECONDARY_MISSION2")]] remoteExec ["BIS_fnc_showNotification", EAST, false];
} else {
	resources_intel = resources_intel + 20;
	combat_readiness = round (combat_readiness * (1 - (0.125 * ({alive _x} count (units _pilotgroup)))));
	["TF47_TaskSucceeded", [(localize "STR_SECONDARY_MISSION2")]] remoteExec ["BIS_fnc_showNotification", EAST, false];
};

{ deleteMarker _x; } foreach [ _convoy_marker, _convoy_marker_wp1, _convoy_marker_wp3 ];

GRLIB_secondary_in_progress = -1; 
publicVariable "GRLIB_secondary_in_progress";
publicVariable "resources_intel";
publicVariable "combat_readiness";

trigger_server_save = true;
sleep 600;
deleteVehicle _helofire;
deleteVehicle _helowreck;
TF47_SARisActive = false;