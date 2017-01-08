

_grp = param[0];
if (isNil "_grp")exitWith{};
_sectors_patrol = [];
_patrol_startpos = getpos (leader _grp);
{
	if ((_patrol_startpos distance (markerpos _x)) < 4000) then {
		_sectors_patrol pushBack _x;
	};
} foreach (sectors_allSectors - blufor_sectors);
while { (count (waypoints _grp)) != 0} do {deleteWaypoint ((waypoints _grp) select 0); };
{_x doFollow leader _grp} foreach units _grp;

{
	_list = ( markerpos _x ) nearRoads 50;
	if (count _list != 0) then {
		_waypoint = _grp addWaypoint [(getPos (_list select 0)), 0];
		_waypoint setWaypointSpeed "LIMITED";
		_waypoint setWaypointBehaviour "SAFE";
		_waypoint setWaypointCompletionRadius 120;
	} else {
		_waypoint = _grp addWaypoint [(markerpos _x), 0];
		_waypoint setWaypointSpeed "LIMITED";
		_waypoint setWaypointBehaviour "SAFE";
		_waypoint setWaypointCompletionRadius 120;
	};
} foreach _sectors_patrol;
_waypoint = _grp addWaypoint [_patrol_startpos, 400];
_waypoint setWaypointCompletionRadius 100;
_waypoint = _grp addWaypoint [_patrol_startpos , 400];
_waypoint setWaypointType "CYCLE";



_grp setCurrentWaypoint ((waypoints _grp) select 0);
true