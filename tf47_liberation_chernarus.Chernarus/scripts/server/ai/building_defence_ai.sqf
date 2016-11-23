params [ "_unit", [ "_sector", "" ] ];
private [ "_move_is_disabled", "_hostilecount", "_targett", "_resume_movement" ];

_sectorsize = 300;
if (isNil "_sector") then {
	_sectorsize  = ((getMarkerSize _sector)select 0)max((getMarkerSize _sector)select 1);
};

if (true) then {
	if (count (units (group _unit)) > 4 && (!(_unit in ((units (group _unit) select [4, 8])))) ) exitWith {
		_newgroup = createGroup (side _unit); 
		((units (group _unit) select [4, 8])) joinSilent _newgroup;
		{  [ _unit, _sector ] spawn building_defence_ai;  } foreach (units _newgroup);
		(group _unit) setCurrentWaypoint ((waypoints (group _unit)) select 0);
	};
	if ( (_unit == leader (group _unit)) ) then {
		_allposts = (nearestObjects [ (getPos _unit), [
			"Land_HBarrier_01_tower_green_F", 
			"Land_HBarrierTower_F",
			"Land_Cargo_Tower_V4_F",
			"Land_PillboxBunker_01_big_F",
			"Land_PillboxBunker_01_hex_F",
			"Land_PillboxBunker_01_rectangle_F",
			"Land_Cargo_Tower_V2_F",
			"Land_Cargo_Tower_V1_F",
			"Land_Cargo_Tower_V3_F",
			"Land_Cargo_Tower_V1_No7_F",
			"Land_Cargo_Tower_V1_No6_F",
			"Land_Cargo_Tower_V1_No5_F",
			"Land_Cargo_Tower_V1_No4_F",
			"Land_Cargo_Tower_V1_No3_F",
			"Land_Cargo_Tower_V1_No2_F",
			"Land_Cargo_Tower_V1_No1_F",
			"Land_Cargo_Patrol_V2_F",
			"Land_Cargo_Patrol_V1_F",
			"Land_Cargo_Patrol_V3_F"
		], 60 ]) select { alive _x };

		_nBuilding = (nearestObjects [(getPos _unit) getPos [(50 + (random _sectorsize) - 50), random 360], ["House", "Building"], 50]) select { ((count (_x  buildingPos -1)) > 0) };

		if ((count _nBuilding) == 0) then { _nBuildingwithpos = _nBuilding pushback (nearestBuilding (getPos _unit)); };

		_nBuildingwithpos = (selectRandom _nBuilding);
		if ((count _nBuilding) == 0 ) then { _nBuildingwithpos = (nearestBuilding (getPos _unit))};
		if ((count _allposts) > 0) then {
			_nBuildingwithpos = (selectRandom _allposts);
		};
		{ deleteWaypoint _x; } foreach waypoints group _unit;
		if (!isNil "_nBuildingwithpos") then {
			_wp1 = (group _unit) addWaypoint [(getPos _nBuildingwithpos), 0];
			_wp1 setWaypointTimeout [ 30,30,30];
			_wp2 = (group _unit) addWaypoint [(getPos _nBuildingwithpos), 0];
			_wp2 setWaypointType "HOLD";
			_wp2 waypointAttachObject _nBuildingwithpos;
		} else {
			_wp1 = (group _unit) addWaypoint [((getPos _unit) getPos [random _sectorsize, random 359]), 0];
			_wp1 setWaypointTimeout [ 30,30,30];
			_wp2 = (group _unit) addWaypoint [((getPos _unit) getPos [random _sectorsize, random 359]), 0];
			_wp2 setWaypointType "LOITER";
		};
		
	};
};
{
	if ( (getWPPos _x) distance2D [0,0,0] < 1000) then { deleteWaypoint _x;};
	if ( surfaceIsWater (getWPPos _x )) then { deleteWaypoint _x;};
} foreach waypoints group _unit;
(group _unit) setCurrentWaypoint ((waypoints (group _unit)) select 0);