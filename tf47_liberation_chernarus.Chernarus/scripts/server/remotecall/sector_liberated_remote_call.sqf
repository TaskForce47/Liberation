if (isServer) then {

	params [ "_liberated_sector" ];

	_combat_readiness_increase = 0;


	if ( _liberated_sector in sectors_bigtown ) then {
		_combat_readiness_increase = (ceil (random 10)) * GRLIB_difficulty_modifier;
		[ TF47_helper_playerFaction, 5 + (ceil (random 5))] call BIS_fnc_respawnTickets;
	};

	if ( _liberated_sector in sectors_capture ) then {
		_combat_readiness_increase = (ceil (random 6)) * GRLIB_difficulty_modifier;
		[ TF47_helper_playerFaction, 2 + (ceil (random 5))] call BIS_fnc_respawnTickets;
	};

	if ( _liberated_sector in sectors_military ) then {
		_combat_readiness_increase = (5 + (ceil (random 11))) * GRLIB_difficulty_modifier;
		[ TF47_helper_playerFaction, 2 + (ceil (random 5))] call BIS_fnc_respawnTickets;
	};

	if ( _liberated_sector in sectors_factory ) then {
		_combat_readiness_increase = (3 + (ceil (random 7))) * GRLIB_difficulty_modifier;
		[ TF47_helper_playerFaction, (2 + (ceil (random 5)))] call BIS_fnc_respawnTickets;
	};

	if ( _liberated_sector in sectors_tower ) then {
		_combat_readiness_increase = (ceil (random 4));
		[ TF47_helper_playerFaction, 2 + (ceil (random 3))] call BIS_fnc_respawnTickets;
	};

	if ( GRLIB_passive_income ) then {
		resources_ammo = resources_ammo + (ceil (75 + (random 50)));
	};

	combat_readiness = combat_readiness + _combat_readiness_increase;
	if ( combat_readiness > 100.0 && GRLIB_difficulty_modifier <= 2.0 ) then { combat_readiness = 100.0 };
	stats_readiness_earned = stats_readiness_earned + _combat_readiness_increase;
	[ [ _liberated_sector, 0 ] , "remote_call_sector" ] call BIS_fnc_MP;

	reset_battlegroups_ai = true; publicVariable "reset_battlegroups_ai";

	blufor_sectors pushback _liberated_sector; publicVariable "blufor_sectors";
	[] call tf47_misc_fnc_sectorCommander;
	stats_sectors_liberated = stats_sectors_liberated + 1;

	[] call recalculate_caps;
	[] spawn check_victory_conditions;

	sleep 1;

	trigger_server_save = true;

	sleep 45;

	if ( GRLIB_endgame == 0 ) then {
		if ( (!( _liberated_sector in sectors_tower )) && (((random (200.0 / (GRLIB_difficulty_modifier * GRLIB_csat_aggressivity) )) < (combat_readiness - 20)) || ( _liberated_sector in sectors_bigtown )) && ([] call F_opforCap < GRLIB_battlegroup_cap) ) then {
			[ _liberated_sector ] spawn spawn_battlegroup;
		};
	};
};
