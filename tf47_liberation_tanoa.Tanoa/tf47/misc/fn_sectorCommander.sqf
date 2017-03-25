/*
 * Author: mindbl4ster
 * use script to focus player efforts in conquering missionobjectives
 * runs when sector gets captured
 *
 * Arguments:
 * nothing
 *
 * Return Value:
 * nothing
 *
 * Example:
 * [] call tf47_misc_fnc_sectorCommander;
 *
 * Public: yes
*/
if !isServer exitWith {};
waitUntil {!isNil "GRLIB_all_fobs"};
tf47_mission_sectorlimit = [] ;

// get nearest opfor sectors
private _fobs = +GRLIB_all_fobs;
_fobs pushBack (getMarkerPos "respawn_west");
private _sectors = [];
{
	if !(_x in blufor_sectors)then{
		_sectors pushBack _x;
	};
}forEach sectors_allSectors;
_sectors = _sectors apply {
	//get shortest distance to any fob or spawnpoint
	private _pos = getmarkerPos _x;
	private _dis = _fobs apply { _x distance2D _pos };
	_dis sort true; //asscending
	[ _dis select 0, _x ] //smallest value
};
_sectors sort true;
_sectors = _sectors apply { _x select 1};

//check wether global array needs an update or just do nothing
private _oldSectors = +tf47_mission_sectorlimit;
tf47_mission_sectorlimit = [];
{
	if !(_x in blufor_sectors) then {
		tf47_mission_sectorlimit pushBack _x;
	};
} forEach _oldSectors;
private _n = 0;
private _limit = if(count _sectors > 5)then{5}else{count _sectors};
if(_limit <= 0)exitWith{
	{
		if( [_x, 0, 19] call BIS_fnc_trimString isEqualTo "tf47_mission_command")then{
			deleteMarker _x;
		};
	}forEach allMapMarkers;
};
while { count tf47_mission_sectorlimit < _limit }do{
	private _selectedSector = (_sectors select _n);
	if !( _selectedSector in tf47_mission_sectorlimit)then{
		tf47_mission_sectorlimit pushBack _selectedSector;
	};
	_n = _n +1;
};
{
	if( [_x, 0, 19] call BIS_fnc_trimString isEqualTo "tf47_mission_command")then{
		deleteMarker _x;
	};
}forEach allMapMarkers;
//create marker to visualize the next target
for "_i" from 0 to (_limit-1) do {
	private _str = format [ "tf47_mission_command_%1", (tf47_mission_sectorlimit select _i)];
	if !(_str in allMapMarkers) then{
		private _mkr = createMarker [_str, getMarkerPos (tf47_mission_sectorlimit select _i)];
		_mkr setMarkerShape "ELLIPSE";
		_mkr setMarkerSize [500,500];
		_mkr setMarkerColor "ColorEAST";
		_mkr setMarkerBrush "Border";
	};
};

true
