_grp = _this select 0;
_basepos = getpos (leader _grp);

while {(count (waypoints _grp)) != 0} do {deleteWaypoint ((waypoints _grp) select 0);};

if ((ceil random 7) == 7) then {
	[_grp , _basepos, (250 + random 250)] call BIS_fnc_taskPatrol;
} else {
	_waypoint = _grp addWaypoint [_basepos, 0];
	_waypoint setWaypointType "LOITER";
};	