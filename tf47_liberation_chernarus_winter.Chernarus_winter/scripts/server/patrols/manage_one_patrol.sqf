params [ "_minimum_readiness", "_is_infantry" ];
private [ "_headless_client", "_vehicle_object"];

_grp = grpNull;

private _spawn_marker = "";
private _range = 5000;
while { _spawn_marker == "" } do {
	_spawn_marker = [2000, _range, true] call F_findOpforSpawnPoint;
	_range = _range + 1000;
};

private _sector_spawn_pos0 = (markerpos _spawn_marker) getPos [1000, random 360];
private _sector_roads = _sector_spawn_pos0 nearRoads 100;
if (count _sector_roads > 0) then {
	_sector_spawn_pos = getPos (_sector_roads select 0);
} else {
	_sector_spawn_pos = _sector_spawn_pos0;
};

if ( (combat_readiness > 75) && ((random 100) > 80) ) then {
	_vehicle_object = [ _sector_spawn_pos, (selectRandom opfor_choppers) ] call F_libSpawnVehicle;
	_vehicle_object flyInHeightASL [(400 + random 50), 200, 800];
} else {
	_vehicle_object = [ _sector_spawn_pos, ([] call F_getAdaptiveVehicle) ] call F_libSpawnVehicle;
};

_grp = group ((crew _vehicle_object) select 0);
if (isNil "_grp")exitWith{
	[
		{	({alive _x } count units (_this select 0) >= 1) && (combat_readiness >= ((_this select 0) / GRLIB_difficulty_modifier) && ([] call F_opforCap > GRLIB_patrol_cap)) }, 
		{	[(_this select 1), (_this select 2)]call manage_one_patrol;	}, 
		[_grp, _minimum_readiness, _is_infantry]
	] call CBA_fnc_waitUntilAndExecute;
};
[_grp] call patrol_ai;

[
	{	({alive _x } count units (_this select 0) >= 1) && (combat_readiness >= ((_this select 0) / GRLIB_difficulty_modifier) && ([] call F_opforCap > GRLIB_patrol_cap)) }, 
	{	[(_this select 1), (_this select 2)]call manage_one_patrol;	}, 
	[ _grp, _minimum_readiness, _is_infantry ]
] call CBA_fnc_waitUntilAndExecute;

