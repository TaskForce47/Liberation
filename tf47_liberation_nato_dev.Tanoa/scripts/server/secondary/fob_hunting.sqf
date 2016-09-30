TF47_FobMissionisActive = true;
_defenders_amount = 15 * ( sqrt ( GRLIB_unitcap ) );
if ( _defenders_amount > 15 ) then { _defenders_amount = 15 };
_fob_templates = [
	"scripts\fob_templates\template5.sqf",
	"scripts\fob_templates\template4.sqf",
	"scripts\fob_templates\template3.sqf",
	"scripts\fob_templates\template2.sqf",
	"scripts\fob_templates\template1.sqf"
];

_spawn_marker = [2000,999999,false] call F_findOpforSpawnPoint;
if ( _spawn_marker == "" ) exitWith { diag_log "Could not find position for fob hunting mission"; };
_markeddownpos = (getMarkerPos _spawn_marker) getPos [random 1000, random 359];
private _index = TF47_Missionarray pushback [ _markeddownpos, { }, localize "STR_SECONDARY_MISSION0", localize "STR_SECONDARY_BRIEFING0", "", "res\secondary\fob_hunting.jpg"];
publicVariable "TF47_Missionarray";

//___________________________________________ Notification ___________________________________________//

["TF47_TaskAssigned",	[(localize "STR_SECONDARY_MISSION0")] ]	remoteExec ["BIS_fnc_showNotification", TF47_helper_opposingFaction, false];

//___________________________________________ Notification ___________________________________________//


if (isNil "used_positions") then {used_positions = [];};

used_positions = used_positions + [ _spawn_marker ];
private _base_position = markerpos _spawn_marker;
private _base_objects = [];
private _base_objectives = [];
private _base_defenders = [];
_template = ([] call (compile preprocessFileLineNumbers ( selectRandom _fob_templates)));

_objects_to_build = _template select 0;
_objectives_to_build = _template select 1;
_defenders_to_build = _template select 2;
_base_corners =  _template select 3;

{
	_nextclass = _x select 0;
	_nextpos = _x select 1;
	_nextpos = [((_base_position select 0) + (_nextpos select 0)),((_base_position select 1) + (_nextpos select 1)),0];
	_nextdir = _x select 2;

	_nextobject = _nextclass createVehicle _nextpos;
	_nextobject setVectorUp [0,0,1];
	_nextobject setpos _nextpos;
	_nextobject setdir _nextdir;
	_nextobject setVectorUp [0,0,1];
	_nextobject setpos _nextpos;
	_nextobject setdir _nextdir;
	_base_objects = _base_objects + [_nextobject];

} foreach _objects_to_build;

sleep 1;

{
	_nextclass = _x select 0;
	_nextpos = _x select 1;
	_nextpos = [((_base_position select 0) + (_nextpos select 0)), ((_base_position select 1) + (_nextpos select 1)),0.5];
	_nextdir = _x select 2;

	_nextobject = _nextclass createVehicle [(_nextpos select 0) + (random 500),(_nextpos select 1) + (random 500),0.5];
	_nextobject setVectorUp [0,0,1];
	_nextobject setpos _nextpos;
	_nextobject setdir _nextdir;
	_nextobject setVectorUp [0,0,1];
	_nextobject setpos _nextpos;
	_nextobject setdir _nextdir;
	_nextobject lock 2;

	_base_objectives = _base_objectives + [_nextobject];
} foreach _objectives_to_build;

sleep 1;

{ _x setDamage 0; } foreach (_base_objectives + _base_objects);
Waituntil {sleep 10; ([ (getMarkerPos _spawn_marker) ] call F_sectorOwnership != independent) || (( { alive _x } count _base_objectives ) <= 1) };
if (( { alive _x } count _base_objectives ) > 1) then {
		
	_grpdefenders = createGroup TF47_helper_opposingFaction;
	_idxselected = [];
	while { count _idxselected < _defenders_amount } do {
		_idx = floor (random (count _defenders_to_build));
		if ( !(_idx in _idxselected) ) then {
			_idxselected pushback _idx;
		};
	};

	{
		_nextentry = _defenders_to_build select _x;
		_nextclass = _nextentry select 0;
		_nextpos = _nextentry select 1;
		_nextpos = [((_base_position select 0) + (_nextpos select 0)),((_base_position select 1) + (_nextpos select 1)),(_nextpos select 2)];
		_nextdir = _nextentry select 2;
		_nextdefender = _grpdefenders createUnit [_nextclass, _nextpos, [], 0, "NONE"];
		_nextdefender setpos _nextpos;
		_nextdefender setdir _nextdir;
		[_nextdefender] call building_defence_ai;
	} foreach _idxselected;

	_sentry = ceil ((3 + (floor (random 4))) * ( sqrt ( GRLIB_unitcap ) ) );

	_grpsentry = createGroup TF47_helper_opposingFaction;
	_base_sentry_pos = [(_base_position select 0) + ((_base_corners select 0) select 0), (_base_position select 1) + ((_base_corners select 0) select 1),0];
	for [ {_idx=0},{_idx < _sentry},{_idx=_idx+1} ] do {
		opfor_sentry createUnit [_base_sentry_pos, _grpsentry,"", 0.5, "private"];
	};

	while {(count (waypoints _grpsentry)) != 0} do {deleteWaypoint ((waypoints _grpsentry) select 0);};
	{
		_waypoint = _grpsentry addWaypoint [[((_base_position select 0) + (_x select 0)), ((_base_position select 1) + (_x select 1)),0], 0];
		_waypoint setWaypointType "MOVE";
		_waypoint setWaypointSpeed "LIMITED";
		_waypoint setWaypointBehaviour "SAFE";
		_waypoint setWaypointCompletionRadius 5;
	} foreach _base_corners;

	_waypoint = _grpsentry addWaypoint [[(_base_position select 0) + ((_base_corners select 0) select 0), (_base_position select 1) + ((_base_corners select 0) select 1),0], 0];
	_waypoint setWaypointType "CYCLE";
	_objectives_alive = true;

	secondary_objective_position = _base_position;
	secondary_objective_position_marker = [(((secondary_objective_position select 0) + 800) - random 1600), (((secondary_objective_position select 1) + 800) - random 1600),0];
	publicVariable "secondary_objective_position_marker";
	sleep 1;
	GRLIB_secondary_in_progress = 0; publicVariable "GRLIB_secondary_in_progress";
	[ [ 2 ] , "remote_call_intel" ] call BIS_fnc_MP;

};
waitUntil { sleep 5;  ( { alive _x } count _base_objectives ) <= 1 };
combat_readiness = round (combat_readiness * GRLIB_secondary_objective_impact);
stats_secondary_objectives = stats_secondary_objectives + 1;
sleep 1;
trigger_server_save = true;
sleep 60;
TF47_FobMissionisActive = false;
TF47_Missionarray deleteat _index;
{ deleteVehicle _x; } foreach _base_objects;
{ deleteVehicle _x; } foreach _base_objectives;
[ [ 3 ] , "remote_call_intel" ] call BIS_fnc_MP;
publicVariable "TF47_Missionarray";
GRLIB_secondary_in_progress = -1; publicVariable "GRLIB_secondary_in_progress";