// diag_log format [ "Spawning cargopost squad at %1", time ];

params [ "_squadpos" ];
private [ "_spawned_units_local", "_allposts", "_grp2", "_building_positions", "_unitclasspost", "_totalx2", "_totaly2", "_avgx2", "_avgy2", "_vd2", "_newdir2" ];

_spawned_units_local = [];

_allposts = (nearestObjects [ _squadpos, [ 
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
], GRLIB_capture_size ]) select { alive _x};
if ( count _allposts > 0 ) then {
	_grp2 = createGroup TF47_helper_opposingFaction;

	{
		_building_positions = 	[_x] call BIS_fnc_buildingPositions;
		_unitclasspost = opfor_marksman;
		_nextunit_post = objNull;
		if ( random 100 > 60 ) then {
			_unitclasspost = opfor_machinegunner;
		};
		_nextunit_post =  _grp2 createUnit [ _unitclasspost, _squadpos, [], 0.5, "NONE"];
		_nextunit_post setpos (selectRandom _building_positions);
		_nextunit_post setdir (180 + (getdir _x ));

	} foreach _allposts;

	_totalx2 = 0;
	_totaly2 = 0;

	{
		[_x] call building_defence_ai;
		_x setUnitPos 'UP';
		_spawned_units_local pushback _x;
		_totalx2 = _totalx2 + ((getpos _x) select 0);
		_totaly2 = _totaly2 + ((getpos _x) select 1);
	} foreach (units _grp2);

	_avgx2 = _totalx2 / ( count (units _grp2) );
	_avgy2 = _totaly2 / ( count (units _grp2) );

	{
		_vd2 = (getPosASL _x) vectorDiff [_avgx2, _avgy2, (getPosASL _x) select 2];
		_newdir2 = (_vd2 select 0) atan2 (_vd2 select 1);
		if (_newdir2 < 0) then {_dir = 360 + _newdir2 };
		_x setdir (_newdir2);
	} foreach (units _grp2);
	[TF47_helper_opposingFaction, _grp2 ] call tf47_misc_fnc_swapSide;
};
// diag_log format [ "Done spawning cargopost squad at %1", time ];


_spawned_units_local