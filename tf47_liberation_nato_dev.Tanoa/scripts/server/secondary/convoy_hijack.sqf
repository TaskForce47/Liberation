private _convoy_destinations_markers = [];
private _load_box_fnc = compileFinal preprocessFileLineNumbers "scripts\client\ammoboxes\do_load_box.sqf";



_possiblemarkerarr = [ getMarkerPos ([ 2000, 5000, false ] call TF47_helper_findOpforSpawnPoint) ] call TF47_helper_isAreaReachable;
while { count _convoy_destinations_markers < 3 } do {
	_convoy_destinations_markers pushBackUnique (selectRandom _possiblemarkerarr);
};

private _couldnt_spawn = false;
{ if ( _x == "" ) exitWith { _couldnt_spawn = true; }; } foreach _convoy_destinations_markers;
if ( _couldnt_spawn ) exitWith { diag_log "Could not find enough map positions for convoy hijack mission"; };

private _convoy_destinations = [];
{ _convoy_destinations pushback ([(getPos _x), 1000] call Bis_fnc_nearestRoad); } foreach _convoy_destinations_markers;
resources_intel = resources_intel -10;
publicVariable "resources_intel";
private _spawnpos = _convoy_destinations select 0;
[ [ 4, _spawnpos ] , "remote_call_intel" ] call BIS_fnc_MP;

_index = TF47_Missionarray pushback [ _spawnpos, { }, localize "STR_SECONDARY_MISSION1", localize "STR_SECONDARY_BRIEFING1", "", "res\secondary\convoy_hijack.jpg"];
publicVariable "TF47_Missionarray";
TF47_ConvoyHijackisActive = true;
//___________________________________________ Notification ___________________________________________//

["TF47_TaskAssigned", [(localize "STR_SECONDARY_MISSION1")]] remoteExec ["BIS_fnc_showNotification", EAST, false];

//___________________________________________ Notification ___________________________________________//
_pos1 = _spawnpos; 		_pos2 = _spawnpos; 		_pos3 = _spawnpos;

_spawnposcenter = (_spawnpos nearRoads 200);
if (count _spawnposcenter != 0 ) then {
	_spawnposcenter = (getpos (_spawnposcenter select 0)) nearRoads 100;
	if ( count _spawnposcenter > 2 ) then {
		_pos1 = getPos (_spawnposcenter select 0);
		_pos2 = getPos (_spawnposcenter select 1);
		_pos3 = getPos (_spawnposcenter select 2);
	};
};

_scout_vehicle = createVehicle [(selectRandom opfor_vehicles_low_intensity), _pos1, [], 0,"NONE"];
_escort_vehicle = createVehicle [(selectRandom opfor_vehicles), _pos2, [], 0,"NONE"];
_transport_vehicle = createVehicle [opfor_ammobox_transport, _pos3, [], 0,"NONE"];

createVehicleCrew _scout_vehicle; 
createVehicleCrew _escort_vehicle; 
createVehicleCrew _transport_vehicle; 
private _convoy_group = group (driver _scout_vehicle);
((crew _escort_vehicle) + (crew _transport_vehicle) + (crew _troop_vehicle) ) joinSilent _convoy_group;

{
	for "_u" from 1 to ((_newvehicle emptyPositions "cargo")min(8+ (round (random 4)))) do {
		_unit = (group (driver _x)) createUnit [(selectRandom [opfor_sentry, opfor_rifleman, opfor_grenadier, opfor_team_leader, opfor_marksman, opfor_machinegunner, opfor_heavygunner, opfor_medic, opfor_rpg, opfor_aa]), _pos1,  [], 0, "NONE"];
		sleep 0.5;
		if (daytime > 20 || daytime < 5) then {
			_unit addPrimaryWeaponItem "rhsusf_acc_nt4_black";
		};
		_unit linkItem "rhsusf_ANPVS_15";
	};
} foreach [_scout_vehicle, _escort_vehicle];

private _boxes_amount = 0;
{
	if ( _x select 0 == opfor_ammobox_transport ) exitWith { _boxes_amount = (count _x) - 2 };
} foreach box_transport_config;

if ( _boxes_amount == 0 ) exitWith { diag_log "Opfor ammobox truck classname doesn't allow for ammobox transport, correct your classnames.sqf"; };

GRLIB_secondary_in_progress = 1; publicVariable "GRLIB_secondary_in_progress";

private _boxes_loaded = 0;

while { _boxes_loaded < _boxes_amount } do {
	_boxes_loaded = _boxes_loaded + 1;
	sleep 0.5;
	private _next_box = ammobox_o_typename createVehicle ([ _spawnpos, 15, 135 ] call BIS_fnc_relPos);
	_next_box enableRopeAttach true;
	sleep 0.5;
	[ _next_box, 50 ] call _load_box_fnc;
};

sleep 0.5;

private _troop_vehicle = [ [ _spawnpos, 30, 180 ] call BIS_fnc_relPos, opfor_transport_truck, true, true, false ] call F_libSpawnVehicle;

sleep 0.5;



sleep 2;

{
	_x addEventHandler ["HandleDamage", { private [ "_damage" ]; if ( side (_this select 3) != TF47_helper_playerFaction ) then { _damage = 0 } else { _damage = _this select 2 }; _damage } ];
} foreach [ _scout_vehicle, _escort_vehicle, _transport_vehicle, _troop_vehicle ];

_convoy_group setFormation "COLUMN";
_convoy_group setBehaviour "SAFE";
_convoy_group setSpeedMode "LIMITED";

{ deleteWaypoint _x; } foreach (waypoints _convoy_group);
{
	if (leader (group _x) != _x) then {
		_x doFollow (leader _convoy_group);
	};
} foreach (units _convoy_group);
_waypoint = _convoy_group addWaypoint [(_convoy_destinations select 1), 0];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointCompletionRadius 50;

_waypoint = _convoy_group addWaypoint [(_convoy_destinations select 2), 0];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointCompletionRadius 50;

_waypoint = _convoy_group addWaypoint [(_convoy_destinations select 0), 0];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointCompletionRadius 50;

_waypoint = _convoy_group addWaypoint [(_convoy_destinations select 0), 0];
_waypoint setWaypointType "CYCLE";
_waypoint setWaypointCompletionRadius 50;

private _troops_group = createGroup TF47_helper_opposingFaction;
{ _x createUnit [_spawnpos, _troops_group,"", 0.5, "private"]; } foreach ([] call F_getAdaptiveSquadComp);
{ _x moveInCargo _troop_vehicle } foreach (units _troops_group);

private _convoy_marker = createMarkerLocal [ format [ "convoymarker%1", round time], getpos _transport_vehicle ];
_convoy_marker setMarkerText (localize "STR_SECONDARY_CSAT_CONVOY");
_convoy_marker setMarkerType "o_armor";
_convoy_marker setMarkerColor "ColorRed";

private _convoy_marker_wp1 = createMarkerLocal [ format [ "convoymarker_wp1_%1_%2_%3", (round time), date, round (random 10)], _convoy_destinations select 0];
private _convoy_marker_wp2 = createMarkerLocal [ format [ "convoymarker_wp2_%1_%2_%3", (round time), date, round (random 10)], _convoy_destinations select 1];
private _convoy_marker_wp3 = createMarkerLocal [ format [ "convoymarker_wp3_%1_%2_%3", (round time), date, round (random 10)], _convoy_destinations select 2];

{
	_x setMarkerText (localize "STR_SECONDARY_CSAT_CONVOY_WP");
	_x setMarkerType "o_armor";
	_x setMarkerColor "ColorRed";
	_x setMarkerSize [0.6, 0.6];
} foreach [_convoy_marker_wp1, _convoy_marker_wp2, _convoy_marker_wp3];

private _mission_in_progress = true;
private _convoy_attacked = false;
private _convoy_flee = false;
private _disembark_troops = false;
_convoy_group setCurrentWaypoint (waypoints (_convoy_group select 0));
_currentdaytime = daytime - 2;
_failed = false;
while { _mission_in_progress } do {
	if (round (daytime  - _currentdaytime) == 0) then { _mission_in_progress = false; _failed = true; };
	if ( !(alive _transport_vehicle) || !(alive driver _transport_vehicle) ) then {
		_mission_in_progress = false;
	};

	_convoy_marker setMarkerPos (_transport_vehicle getPos [random 100, random 360]);

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
			_waypoint = _troop_driver_group addWaypoint [getpos _troop_vehicle, 0];
			_waypoint setWaypointType "MOVE";
			sleep 3;
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

	if ( _convoy_attacked && !_convoy_flee) then {
		_convoy_flee = true;
		_convoy_group setBehaviour "COMBAT";
		_convoy_group setSpeedMode "FULL";
	};

	sleep 5;
};

sleep 20;

deleteMarker _convoy_marker;
{ deleteMarker _x } foreach [_convoy_marker_wp1, _convoy_marker_wp2, _convoy_marker_wp3 ];
TF47_Missionarray deleteAt _index;
publicVariable "TF47_Missionarray";

if (_failed) then {
	combat_readiness = round (combat_readiness * 0.85);
	[ [ 5 ] , "remote_call_intel" ] call BIS_fnc_MP;
	["TF47_TaskFailed", [(localize "STR_SECONDARY_MISSION1")]] remoteExec ["BIS_fnc_showNotification", TF47_helper_playerFaction, false];
} else {
	combat_readiness = round (combat_readiness * 1.2);
	{
		_vehicle = _x;
		if ( TF47_helper_playerFaction countSide (allPlayers select { (_x distance2D (getpos _vehicle)) < 1700 }) <= 1 ) then {
			{ deletevehicle _x; } foreach (crew _vehicle);
			deleteVehicle _vehicle;
		};
	} forEach [_scout_vehicle, _escort_vehicle, _transport_vehicle, _troop_vehicle];
	["TF47_TaskSucceeded", [(localize "STR_SECONDARY_MISSION1")]] remoteExec ["BIS_fnc_showNotification", TF47_helper_playerFaction, false];
};

GRLIB_secondary_in_progress = -1; publicVariable "GRLIB_secondary_in_progress";
sleep 1;
sleep 60;
TF47_ConvoyHijackisActive = false;
trigger_server_save = true;