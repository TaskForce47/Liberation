params [ "_targetsector" ];
private _targetpos = getMarkerPos _targetsector;
private _spawnsector = ( [ sectors_airspawn , [ _targetpos ] , { (markerpos _x) distance _input0 }, "ASCEND"] call BIS_fnc_sortBy ) select 0;

private _chopper_type = selectRandom opfor_choppers;
private _spawnPos	=	[(getMarkerPos _spawnsector) select 0,	(getMarkerPos _spawnsector) select 1,	500];
private _newvehicle = createVehicle [ _chopper_type, _spawnPos , [], 100, "FLY"];
createVehicleCrew _newvehicle;

private _pilot_group = group ((crew _newvehicle) select 0);

_newvehicle flyInHeightASL [500, (350 + random 200), 200];

sleep 0.1;

if (isNil "_pilot_group") exitWith { deleteVehicle _newvehicle; };
while {(count (waypoints _pilot_group)) != 0} do {deleteWaypoint ((waypoints _pilot_group) select 0);};

sleep 0.2;
{_x doFollow leader _pilot_group} foreach units _pilot_group;
sleep 0.2;

private _waypoint = _pilot_group addWaypoint [ _targetpos, 0];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointSpeed "NORMAL";
_waypoint setWaypointBehaviour "COMBAT";
_waypoint setWaypointCompletionRadius 100;

_waypoint = _pilot_group addWaypoint [ _targetpos, 0];
_waypoint setWaypointType "LOITER";
_waypoint setWaypointLoiterRadius 500;
_waypoint setWaypointSpeed "LIMITED";

/**********************************************************************************************************************************/
/**********************************************************************************************************************************/
/**********************************************************************************************************************************/
if(	(_newvehicle emptyPositions "cargo")	>= 6)then{
    { _x setWaypointBehaviour "CARELESS" } foreach (waypoints _pilot_group);
	private _para_group = createGroup TF47_helper_opposingFaction;
	private _sqComp =  [] call F_getAdaptiveSquadComp;
	
	for "_u" from 1 to (_newvehicle emptyPositions "cargo") do {
		(_sqComp select (_u -1)	) createUnit [ getmarkerpos _spawnsector, _para_group, ''];
		sleep 0.5;
	};

	{ _x moveInCargo _newvehicle } foreach (units _para_group);

	while {(count (waypoints _para_group)) != 0} do {deleteWaypoint ((waypoints _para_group) select 0);};
	{_x doFollow leader _para_group} foreach units _para_group;
	
	_para_group setCombatMode "RED";
	
	_waypoint = _para_group addWaypoint [ _targetpos, 100];
	_waypoint setWaypointType "MOVE";
	_waypoint setWaypointSpeed "NORMAL";
	_waypoint setWaypointBehaviour "COMBAT";
	_waypoint setWaypointCompletionRadius 50;
	_waypoint = _para_group addWaypoint [ _targetpos, 100];
	_waypoint setWaypointType "SAD";
	_waypoint setWaypointCompletionRadius 200;
	
	[_para_group, _targetpos, 500] call bis_fnc_taskPatrol;
	
	waitUntil { sleep 1; (_newvehicle distance2D _targetpos	) < 800 };

	{
		unassignVehicle _x;
		moveout _x;

		TF47_helper_paratrooperJumpInit pushBack _x;
		
	} foreach (units _para_group);
    Waituntil {sleep 1; count (crew _newvehicle) < 3};
    { deleteWaypoint _x } foreach waypoints _pilot_group;
    _waypoint = _pilot_group addWaypoint [ _spawnPos, 0];
    _waypoint setWaypointType "Move";
    _waypoint setWaypointSpeed "FAST";
    _waypoint setWaypointBehaviour "CARELESS";
    _waypoint setWaypointStatements ["true", "{ deleteVehicle _x } foreach units this;"];


    [
		{
			(!((_this select 1)in(active_Sectors)))
		}, 
		{ 
			{ deletevehicle _x; } foreach (units (_this select 0));
		}, 
		[_para_group, _targetsector]
	] call CBA_fnc_waitUntilAndExecute;
};

[
	{
		(!((_this select 2)in(active_Sectors)))
	}, 
	{ 
		deleteVehicle (_this select 0);
		{ deletevehicle _x; } foreach (units (_this select 1));
	}, 
	[_newvehicle, _pilot_group, _targetsector]
] call CBA_fnc_waitUntilAndExecute;