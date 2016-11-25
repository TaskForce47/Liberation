

params [ "_sector" ];
private [ "_sectorpos", "_stopit", "_spawncivs", "_building_ai_max", "_infsquad", "_building_range", "_local_capture_size", "_iedcount","_combat_readiness_increase","_vehtospawn","_managed_units","_squad1", "_squad2", "_squad3", "_squad4", "_minimum_building_positions", "_popfactor", "_sector_despawn_tickets", "_opforcount" ];

waitUntil { !isNil "combat_readiness" };

// diag_log format [ "Sector %2 checkpoint A at %1", time, _sector ];

_sectorpos = getmarkerpos _sector;
_stopit = false;
_spawncivs = false;
_building_ai_max = 0;
_infsquad = "militia";
_building_range = 50;
_local_capture_size = GRLIB_capture_size;
_iedcount = 0;
_vehtospawn = [];
_managed_units = [];
_squad1 = [];
_squad2 = [];
_squad3 = [];
_squad4 = [];
_minimum_building_positions = 5;
_sector_despawn_tickets = 12;

_popfactor = 1;
if ( GRLIB_unitcap < 1 ) then { _popfactor = GRLIB_unitcap; };

if ( isNil "active_sectors" ) then { active_sectors = [] };
if ( _sector in active_sectors ) exitWith {};
active_sectors pushback _sector;

publicVariable "active_sectors";

// diag_log format [ "Sector %2 checkpoint B at %1", time, _sector ];

_opforcount = [] call F_opforCap;
[ _sector, _opforcount ] call wait_to_spawn_sector;

// diag_log format [ "Sector %2 checkpoint C at %1", time, _sector ];

if ( (!(_sector in blufor_sectors)) &&  (([ getmarkerpos _sector , [ _opforcount ] call F_getCorrectedSectorRange , TF47_helper_playerFaction ] call F_getUnitsCount ) > 0 ) ) then {

	// diag_log format [ "Sector %2 checkpoint D at %1", time, _sector ];

	if ( _sector in sectors_bigtown ) then {
		_vehtospawn =
		[ ( [] call F_getAdaptiveVehicle ) ,
		([] call F_getAdaptiveVehicle),
		([] call F_getAdaptiveVehicle)];
		_infsquad = "csat";
		_squad1 = ([] call F_getAdaptiveSquadComp);
		_squad2 = ([] call F_getAdaptiveSquadComp);
		if ( GRLIB_unitcap >= 1) then {
			_squad3 = ([] call F_getAdaptiveSquadComp);
		};
		if ( GRLIB_unitcap >= 1.5) then {
			_squad4 = ([] call F_getAdaptiveSquadComp);
		};
		if((random 100) > (66 / GRLIB_difficulty_modifier)) then { _vehtospawn pushback ([] call F_getAdaptiveVehicle); };
		if((random 100) > (50 / GRLIB_difficulty_modifier)) then { _vehtospawn pushback ([] call F_getAdaptiveVehicle); };
		if((random 100) > (33 / GRLIB_difficulty_modifier)) then { _vehtospawn pushback ( [] call F_getAdaptiveVehicle ); };
		_spawncivs = true;

		_building_ai_max = round (50 * _popfactor) ;
		_building_range = 250; // original value: 110
		_local_capture_size = _local_capture_size * 1.4;
		_iedcount = (2 + (floor (random 4))) * GRLIB_difficulty_modifier;
		if ( _iedcount > 10 ) then { _iedcount = 10 };
	};
	/*******************************************************************************/
	if ( _sector in sectors_capture ) then {
		_vehtospawn = [];
		_infsquad = "militia";
		while { count _squad1 < ( 10 * _popfactor) } do { _squad1 pushback ( selectRandom militia_squad ) };
		if((random 100) > (66 / GRLIB_difficulty_modifier)) then { _vehtospawn pushback (selectRandom militia_vehicles); };
		if((random 100) > (33 / GRLIB_difficulty_modifier)) then { _vehtospawn pushback (selectRandom militia_vehicles); };
		_spawncivs = true;
		_building_ai_max = round ((floor (18 + (round (combat_readiness / 10 )))) * _popfactor);
		_building_range = 150; // original value: 70
		_iedcount = (floor (random 4)) * GRLIB_difficulty_modifier;
		if ( _iedcount > 7 ) then { _iedcount = 7 };
	};
	/*******************************************************************************/
	if ( _sector in sectors_military ) then {
		_infsquad = "csat";
		_squadies_to_spawn = ([] call F_getAdaptiveSquadComp);
		_squad1 = ([] call F_getAdaptiveSquadComp);
		_squad2 = ([] call F_getAdaptiveSquadComp);
		if ( GRLIB_unitcap >= 1.5) then {
			_squad3 = ([] call F_getAdaptiveSquadComp);
		};
		if ( GRLIB_unitcap >= 2) then {
			_squad4 = ([] call F_getAdaptiveSquadComp);
		};
		_vehtospawn = [( [] call F_getAdaptiveVehicle ),( [] call F_getAdaptiveVehicle )];
		if((random 100) > (33 / GRLIB_difficulty_modifier)) then { _vehtospawn pushback ( [] call F_getAdaptiveVehicle ); };
		if((random 100) > (66 / GRLIB_difficulty_modifier)) then { _vehtospawn pushback ( [] call F_getAdaptiveVehicle ); };
		_spawncivs = false;
		_building_ai_max = round ((floor (18 + (round (combat_readiness / 4 )))) * _popfactor);
		_building_range = 110;
	};
	
	if ( _sector in sectors_factory ) then {
		_vehtospawn = [];
		_infsquad = "csat";
		_squad1 = ([] call F_getAdaptiveSquadComp);
		if ( GRLIB_unitcap >= 1.25) then {
			_squad2 = ([] call F_getAdaptiveSquadComp);
		};
		if((random 100) > 66) then { _vehtospawn pushback ( [] call F_getAdaptiveVehicle ); };
		if((random 100) > 33) then { _vehtospawn pushback (selectRandom militia_vehicles); };
		_spawncivs = false;
		_building_ai_max = round ((floor (18 + (round (combat_readiness / 10 )))) * _popfactor);
		_building_range = 200; // original value: 70
		_iedcount = (floor (random 3)) * GRLIB_difficulty_modifier;
		if ( _iedcount > 5 ) then { _iedcount = 5 };
	};
	
	if ( _sector in sectors_tower ) then {
		_infsquad = "csat";
		_spawncivs = false;
		_squad1 = ([] call F_getAdaptiveSquadComp);
		if ( GRLIB_unitcap >= 1) then {
			_squad2 = ([] call F_getAdaptiveSquadComp);
		};
		_building_ai_max = 4 + (round (random 5));
		_building_range = 60;
		if((random 100) > 80) then { _vehtospawn pushback ( [] call F_getAdaptiveVehicle ); };
	};

	// diag_log format [ "Sector %2 checkpoint E at %1", time, _sector ];

	if (_building_ai_max > 0 && GRLIB_adaptive_opfor ) then {
		_building_ai_max = round ( _building_ai_max * ([] call F_adaptiveOpforFactor));
	};

	// diag_log format [ "Sector %2 checkpoint F at %1", time, _sector ];

	{
		_vehicle = [_sectorpos, _x] call F_libSpawnVehicle;
		[TF47_helper_opposingFaction, (group ((crew _vehicle) select 0)	) ] call TF47_helper_swapSide; sleep 0.05;
		[group ((crew _vehicle) select 0 ),_sectorpos] call add_defense_waypoints;
		_managed_units pushback _vehicle;
		{ _managed_units pushback _x; } foreach (crew _vehicle);
		sleep 0.25;
	} foreach _vehtospawn;

	// diag_log format [ "Sector %2 checkpoint G at %1", time, _sector ];

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

	// diag_log format [ "Sector %2 checkpoint H at %1", time, _sector ];

	_managed_units = _managed_units + ( [ _sectorpos ] call F_spawnMilitaryPostSquad );

	// diag_log format [ "Sector %2 checkpoint I at %1", time, _sector ];

	if ( count _squad1 > 0 ) then {
		private _grp = [ _sector, _squad1 ] call F_spawnRegularSquad;
		sleep 0.5;
		[ _grp, _sectorpos ] call add_defense_waypoints;
		_grp setCurrentWaypoint ((waypoints _grp) select 0);
		_managed_units = _managed_units + (units _grp);
	};

	if ( count _squad2 > 0 ) then {
		private _grp = [ _sector, _squad2 ] call F_spawnRegularSquad;
		sleep 0.5;
		[ _grp, _sectorpos ] call add_defense_waypoints;
		_grp setCurrentWaypoint ((waypoints _grp) select 0);
		_managed_units = _managed_units + (units _grp);
	};

	if ( count _squad3 > 0 ) then {
		private _grp = [ _sector, _squad3 ] call F_spawnRegularSquad;
		sleep 0.5;
		[ _grp, _sectorpos ] call add_defense_waypoints;
		_grp setCurrentWaypoint ((waypoints _grp) select 0);
		_managed_units = _managed_units + (units _grp);
	};

	if ( count _squad4 > 0 ) then {
		private _grp = [ _sector, _squad4 ] call F_spawnRegularSquad;
		sleep 0.5;
		[ _grp, _sectorpos ] call add_defense_waypoints;
		_grp setCurrentWaypoint ((waypoints _grp) select 0);
		_managed_units = _managed_units + (units _grp);
	};

	// diag_log format [ "Sector %2 checkpoint J at %1", time, _sector ];

	if ( _spawncivs && GRLIB_civilian_activity > 0) then {
		_managed_units = _managed_units + ( [ _sector ] call F_spawnCivilians );
	};

	// diag_log format [ "Sector %2 checkpoint K at %1", time, _sector ];

	[ _sector, _building_range, _iedcount ] call ied_manager;

	// diag_log format [ "Sector %2 checkpoint L at %1", time, _sector ];
	/*
	{ [TF47_helper_opposingFaction, _x  ] call TF47_helper_swapSide; } foreach (allGroups select {	(side _x == independent) && (	(	(leader _x)	distance2D	_sectorpos) < 1200)	}	);
	sleep 10;
	*/
	if ( ( _sector in sectors_factory ) || (_sector in sectors_capture ) || (_sector in sectors_bigtown ) || (_sector in sectors_military ) ) then {
		[[ _sector ] , "reinforcements_remote_call" ] call BIS_fnc_MP;
	};

	// diag_log format [ "Sector %2 checkpoint M at %1", time, _sector ];
	while { !_stopit } do {

		if ( ( [_sectorpos, _local_capture_size] call F_sectorOwnership == TF47_helper_playerFaction )) then {

			// diag_log format [ "Sector %2 checkpoint N at %1", time, _sector ];

			if (isServer) then {
				[ _sector ] spawn sector_liberated_remote_call;
			} else {
				[ [ _sector ] , "sector_liberated_remote_call" ] call BIS_fnc_MP;
			};
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
} else {
	sleep 25;
	active_sectors = active_sectors - [ _sector ]; publicVariable "active_sectors";
	// diag_log format [ "Sector %2 checkpoint S at %1", time, _sector ];
};

// diag_log format [ "Sector %2 checkpoint T at %1", time, _sector ];