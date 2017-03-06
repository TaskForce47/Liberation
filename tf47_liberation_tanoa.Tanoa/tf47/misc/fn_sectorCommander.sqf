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
 *
 * Public: yes
*/
if !isServer exitWith {};
waitUntil {!isNil "GRLIB_all_fobs"};
if isNil "tf47_mission_sectorlimit" then { tf47_mission_sectorlimit = [] };

// get nearest opfor sectors
private _fobs = +GRLIB_all_fobs;
_fobs pushBack (getMarkerPos "respawn_west");
private _sectors = +sectors_allSectors;
_sectors = _sectors - blufor_sectors; //marker
private _sectorDis = _sectors apply {
	//get shortest distance to any fob or spawnpoint
	private _pos = getmarkerPos _x;
	private _dis = _fobs apply { _x distance2D _pos };
	_dis sort true; //asscending
	[ _dis select 0, _x ] //smallest value
};
_sectorDis sort true;
_sectorDis resize 3;
_sectorDis = _sectorDis apply { _x params ["_distance","_mkr"]; _mkr};

//check wether global array needs an update or just do nothing
private _oldSectors = +tf47_mission_sectorlimit;
tf47_mission_sectorlimit = [];
{
	if _x in blufor_sectors then {
		//cleanup old mapmarker
		deleteMarker format ["tf47_mission_command_%1", _x];
	} else {
		tf47_mission_sectorlimit pushBack _x;
	};
} forEach _oldSectors;
private _n = 0;
while {count tf47_mission_sectorlimit < 3 }do{
	tf47_mission_sectorlimit pushBack (_sectorDis select _n);
	_n = _n +1;
};

//create marker to visualize the next target
for "_i" from 0 to 4 do {
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
