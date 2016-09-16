/*
	Parameter:
	0:	ARRAY	-	Position
	1:	NUMBER	-	cycles between start and end 
*/
params [ 
	["_bullseye",[]],
	["_sweeps",1]
];

if(	count _bullseye == 0)exitWith{

	diag_log "[ FAIL ] TF47 FNC COMBATAIRPATROL: No bullseye given, exiting function!";
	false;

};

private ["_planes_number","_plane_type","_grp","_air_spawnpos","_air","_ende"];

_plane_type = "RHS_T50_vvs_051";	//f22

_air_spawnpos = getMarkerPos (	( [ sectors_airspawn , [ _bullseye ] , { (markerpos _x) distance _input0 }, "ASCEND"] call BIS_fnc_sortBy ) select 0);
_ende = getMarkerPos (	( [ sectors_airspawn , [ _bullseye ] , { (markerpos _x) distance _input0 }, "DESCEND"] call BIS_fnc_sortBy ) select 0);

_air_spawnpos = 
[
	(((_air_spawnpos select 0) + 500) - random 1000),
	(((_air_spawnpos select 1) + 500) - random 1000),
	1000
];
_air = createVehicle [_plane_type, _air_spawnpos, [], 0, "NONE"];
createVehicleCrew _air;
private _dir 	=	-(_air_spawnpos getDir	_bullseye);
_air setVectorDir [sin(_dir),cos(_dir),0];
_air setVelocity [-sin(_dir)*50, -cos(_dir)*50,0]; // armalogic

_grp	=	group ((crew _air)select 0 );
{_x setvariable ["NOAI",true];}forEach units _grp;
_air flyInHeightASL [500, 500, 400];	//showoff

sleep 0.5;
while {(count (waypoints _grp)) != 0} do {deleteWaypoint ((waypoints _grp) select 0);};

for "_i" from 0 to _sweeps do {

	_grp addwaypoint [_bullseye,0,_i,""];
	[_grp,_i] setWaypointBehaviour "COMBAT";
	[_grp,_i] setWaypointType "MOVE";
	[_grp,_i] setWaypointSpeed "LIMITED";

	_grp addwaypoint [_ende,0,(_i +1),""];
	[_grp,(_i +1)] setWaypointBehaviour "COMBAT";
	[_grp,(_i +1)] setWaypointType "MOVE";
	[_grp,(_i +1)] setWaypointSpeed "LIMITED";
	
	_grp addwaypoint [_air_spawnpos,0,(_i +2),""];
	[_grp,(_i +2)] setWaypointBehaviour "COMBAT";
	[_grp,(_i +2)] setWaypointType "MOVE";
	[_grp,(_i +2)] setWaypointSpeed "LIMITED";
	
};
waitUntil{!(alive _air) || (air_weight < 50)};
sleep 300;
if(alive _air)then{
	{deleteVehicle _x}foreach([_air]+(crew _air))
};