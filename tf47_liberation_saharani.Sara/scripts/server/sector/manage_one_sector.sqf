#define COUNTUNITS(MARKER,RADIUS) [ getmarkerpos MARKER , RADIUS , TF47_helper_playerFaction ] call F_getUnitsCount
params [ "_sector" ];

waitUntil { !isNil "combat_readiness" };
private _sectorpos = getmarkerpos _sector;

if ( isNil "active_sectors" ) then { active_sectors = [] };
if ( _sector in active_sectors ) exitWith {};

active_sectors pushback _sector; publicVariable "active_sectors";

private _opforcount  = [] call F_opforCap;
private _sectorRange = [ _opforcount ] call F_getCorrectedSectorRange;

//checkloop to see if player are passing by or attacking sector_liberated_remote_call
private _temp = COUNTUNITS(_sector,_sectorRange);
while{  _temp > 0 }do{
	sleep 10;
	if( COUNTUNITS(_sector,_sectorRange) >= _temp )exitWith{};
	_temp = COUNTUNITS(_sector,_sectorRange);
};
if( _temp <= 0)exitWith{
	active_sectors = active_sectors - [ _sector ]; publicVariable "active_sectors";
};

/*******************************************************************************/
/*******************************************************************************/

private _building_ai_max = 0;
private _building_range = 50;
private _local_capture_size = GRLIB_capture_size;
private _iedcount = 0;

private _vehtospawn = 0;
private _squads	=	0;
private _infsquad = "csat";

if ( _sector in sectors_bigtown ) then {
	_vehtospawn = floor( random(combat_readiness/100)*7 + 3);
	_squads 	= ceil( random(combat_readiness/100)*7 + 5);

	_building_ai_max = round (50 * 1) ;
	_building_range = 250; // original value: 110
	_local_capture_size = _local_capture_size * 1.4;
	_iedcount = (2 + (floor (random 4))) * GRLIB_difficulty_modifier;
	if ( _iedcount > 10 ) then { _iedcount = 10 };
};

if ( _sector in sectors_capture ) then {
	_vehtospawn = floor( random(combat_readiness/100)*7 + 0);
	_squads 	= ceil( random(combat_readiness/100)*7 + 3);
	_infsquad = "militia";

	_building_ai_max = round ((floor (18 + (round (combat_readiness / 10 )))) * 1);
	_building_range = 150; // original value: 70
	_iedcount = (floor (random 4)) * GRLIB_difficulty_modifier;
	if ( _iedcount > 7 ) then { _iedcount = 7 };
};

if ( _sector in sectors_military ) then {
	_vehtospawn = floor( random(combat_readiness/100)*7 + 2);
	_squads 	= ceil( random(combat_readiness/100)*7 + 4);

	_building_ai_max = round ((floor (18 + (round (combat_readiness / 4 )))) * 1);
	_building_range = 110;
};

if ( _sector in sectors_factory ) then {
	_vehtospawn = floor( random(combat_readiness/100)*7 + 0);
	_squads 	= ceil( random(combat_readiness/100)*7 + 2);

	_building_ai_max = round ((floor (18 + (round (combat_readiness / 10 )))) * 1);
	_building_range = 200; // original value: 70
	_iedcount = (floor (random 3)) * GRLIB_difficulty_modifier;
	if ( _iedcount > 5 ) then { _iedcount = 5 };
};

if ( _sector in sectors_tower ) then {
	_vehtospawn = floor( random(combat_readiness/100)*7 + 0);
	_squads 	= ceil( random(combat_readiness/100)*7 + 1);
	_building_ai_max = 4 + (round (random 5));
	_building_range = 60;
	//if((random 100) > 80) then { _vehtospawn pushback ( [] call F_getAdaptiveVehicle ); };
};

/*******************************************************************************/
/*******************************************************************************/

private _managed_units = [];
private _minimum_building_positions = 5;
private _sector_despawn_tickets = 12;

if(_vehToSpawn > 0)then{
	for "_i" from 1 to _vehToSpawn do {
		private _classname = if( _infsquad isEqualTo "militia" )then{ selectRandom militia_vehicles }else{ selectRandom opfor_vehicles };
		private _veh = [_sectorpos, _classname] call F_libSpawnVehicle;
		[group ((crew _veh) select 0 ),_sectorpos] call add_defense_waypoints;
		_managed_units pushback _veh;
		{ _managed_units pushback _x; } foreach (crew _veh);
		sleep 0.25;
	};
};

if(_squads > 0)then{
	for "_i" from 1 to _squads do {
		private _classNames = if( _infsquad isEqualTo "militia" )then{
			private _return = [];
			for "_o" from 0 to ceil( ([] call f_adaptiveOpforFactor)*8) do {
				_return pushBack (selectRandom militia_squad);
			};
			_return
		}else{
			[] call F_getAdaptiveSquadComp;
		};
		private _grp = [ _sector, _classNames ] call F_spawnRegularSquad;
		sleep 0.5;
		[ _grp, _sectorpos ] call add_defense_waypoints;
		_grp setCurrentWaypoint ((waypoints _grp) select 0);
		_managed_units = _managed_units + (units _grp);
	};
};


if (_building_ai_max > 0 && GRLIB_adaptive_opfor ) then {
	_building_ai_max = round ( _building_ai_max * ([] call F_adaptiveOpforFactor));
};

if ( _building_ai_max > 0 ) then {
	_allbuildings = [ nearestObjects [_sectorpos, ["House"], _building_range ], { alive _x } ] call BIS_fnc_conditionalSelect;
	_buildingpositions = [];
	{
		_buildingpositions = _buildingpositions + ( [_x] call BIS_fnc_buildingPositions );
	} foreach _allbuildings;
	if ( count _buildingpositions > _minimum_building_positions ) then {
		_managed_units = _managed_units + ( [ _infsquad, _building_ai_max, _buildingpositions, _sectorpos, _sector ] call F_spawnBuildingSquad );
	};
};

_managed_units = _managed_units + ( [ _sectorpos ] call F_spawnMilitaryPostSquad );

[ _sector, _building_range, _iedcount ] call ied_manager;

if !(_sector in sectors_tower) then {
	[ _sector ] spawn reinforcements_manager;
};

private _stopit = false;
while { !_stopit } do {

	if ( ( [_sectorpos, _local_capture_size] call F_sectorOwnership == TF47_helper_playerFaction )) then {

		[_sector, sector_liberated_remote_call] remoteExec ["spawn",2];
		_stopit = true;
		{ [_x] call prisonner_ai; } foreach _managed_units select {(_x distance2D _sectorpos) < GRLIB_capture_size};
		sleep 60;
		active_sectors = active_sectors - [ _sector ]; publicVariable "active_sectors";
		// diag_log format [ "Sector %2 checkpoint O at %1", time, _sector ];
		sleep 600;
		// diag_log format [ "Sector %2 checkpoint P at %1", time, _sector ];
		waitUntil { sleep 10; (([_sectorpos, (([ _opforcount ] call F_getCorrectedSectorRange ) + 300 ), TF47_helper_playerFaction ] call F_getUnitsCount ) <= 4) };
		{

			if (_x getVariable ["ace_captives_ishandcuffed", false]) then {
				_newgrp = createGroup (side _x);
				[_x] joinSilent _newgrp;
				_x disableAI "FSM";
			};
			if ((_x isKindOf "Man")) then {
				if (( !(_x getVariable ["ace_captives_ishandcuffed", false]))) then {
					deleteVehicle _x;
				};
			} else {
				[ _x ] call F_cleanOpforVehicle;
			};
		} foreach _managed_units;
	} else {
		// diag_log format [ "Sector %2 checkpoint Q at %1", time, _sector ];

		if ( ( [_sectorpos, ( ( [ _opforcount ] call F_getCorrectedSectorRange ) + 300 ), TF47_helper_playerFaction ] call F_getUnitsCount ) == 0 ) then {
			_sector_despawn_tickets = _sector_despawn_tickets - 1;
		} else {
			_sector_despawn_tickets = 12;
		};

		if ( _sector_despawn_tickets <= 0 ) then {

			{
				if (_x getVariable ["ace_captives_ishandcuffed", false]) then {
					_newgrp = createGroup (side _x);
					[_x] joinSilent _newgrp;
				};
				if ((_x isKindOf "Man")) then {
					if (( !(_x getVariable ["ace_captives_ishandcuffed", false]))) then {
						deleteVehicle _x;
					};
				} else {
					[ _x ] call F_cleanOpforVehicle;
				};
			} foreach _managed_units;

			_stopit = true;
			active_sectors = active_sectors - [ _sector ]; publicVariable "active_sectors";

			// diag_log format [ "Sector %2 checkpoint R at %1", time, _sector ];
		};
	};
	sleep 5;
};
