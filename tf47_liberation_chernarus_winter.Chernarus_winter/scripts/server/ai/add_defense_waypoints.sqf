private ["_basepos", "_wp"];
params ["_grp","_flagpos"];

if (isNil "_grp")exitWith {};

_basepos = getpos (leader _grp);

while { ((count (waypoints _grp)) != 0) } do { deleteWaypoint ((waypoints _grp) select 0); };
{ _x doFollow (leader _grp); } foreach units _grp;

if ( vehicle (leader _grp) == (leader _grp) ) then {
	[_grp, _flagpos, (GRLIB_capture_size + random 200)] call bis_fnc_taskPatrol;
	{ if ( surfaceIsWater(getWPPos _x) ) then { deleteWaypoint _x;}; } foreach waypoints _grp;
} else {
	if (vehicle (leader _grp) isKindOf "LandVehicle") then {
		for "_w" from 0 to 4 do {
			_list = (_basepos getPos [1000, random 360]) nearRoads 100;
			if (count _list != 0) then {
				_wp = _grp addWaypoint [(getPos (_list select 0)), 0];
				_wp setWaypointBehaviour "SAFE";
				_wp setWaypointSpeed  "LIMITED";
				_wp setWaypointTimeout [30, 60, 180];
			} else {
				_wp = _grp addWaypoint [(_basepos getPos [500, random 360]), 200];
				_wp setWaypointBehaviour "SAFE";
				_wp setWaypointSpeed  "LIMITED";
				_wp setWaypointTimeout [30, 60, 180];
			};
		};
		{ if ( surfaceIsWater(getWPPos _x) ) then { deleteWaypoint _x;}; } foreach waypoints _grp;
		[_grp, (count (waypoints _grp))] setWaypointType "Cycle";

	} else {
		_dir = (leader _grp) getDir (_basepos);
		for "_w" from 0 to 5 do {
			_list = _basepos getPos [400 + random 400, _dir ];
			_wp = _grp addWaypoint [([_list select 0, _list select 1]), 0];
			_wp setWaypointBehaviour "SAFE";
			_wp setWaypointSpeed  "LIMITED";
			_wp setWaypointTimeout [30, 60, 180];
			_dir = _dir + 90;
		};
		((waypoints _grp) select (count waypoints _grp)) setWaypointType "Cycle";
	};
};

_grp setCurrentWaypoint ((waypoints _grp) select 0);

true