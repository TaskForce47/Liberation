TF47_helper_opposingFaction		=	EAST;
TF47_helper_playerFaction		=	WEST;

GRLIB_save_key = format ["GREUH_LIBERATION_SAVEGAME_%1_%2_001", worldName, TF47_helper_playerFaction];	// change this value if you want different savegames on different map

GRLIB_difficulty_modifier 	= ["Difficulty",1] call bis_fnc_getParamValue;
GRLIB_time_factor 			= ["DayDuration",12] call bis_fnc_getParamValue;
GRLIB_resources_multiplier 	= ["ResourcesMultiplier",1] call bis_fnc_getParamValue;
GRLIB_fatigue 				= ["Fatigue",1] call bis_fnc_getParamValue;
GRLIB_revive 				= ["Revive",0] call bis_fnc_getParamValue;
GRLIB_introduction 			= ["Introduction",0] call bis_fnc_getParamValue;
GRLIB_deployment_cinematic 	= ["DeploymentCinematic",0] call bis_fnc_getParamValue;
GRLIB_unitcap 				= ["Unitcap",1] call bis_fnc_getParamValue;
GRLIB_adaptive_opfor 		= ["AdaptToPlayercount",1] call bis_fnc_getParamValue;
GRLIB_civilian_activity 	= ["Civilians",0.5] call bis_fnc_getParamValue;
GRLIB_teamkill_penalty = ["TeamkillPenalty",0] call bis_fnc_getParamValue;
GRLIB_build_first_fob = ["FirstFob",0] call bis_fnc_getParamValue;
GRLIB_param_wipe_savegame_1 = ["WipeSave1",0] call bis_fnc_getParamValue;
GRLIB_param_wipe_savegame_2 = ["WipeSave2",0] call bis_fnc_getParamValue;
GRLIB_passive_income = ["PassiveIncome",0] call bis_fnc_getParamValue;
GRLIB_permissions_param = ["Permissions",1] call bis_fnc_getParamValue;
GRLIB_halo_param = ["HaloJump",0] call bis_fnc_getParamValue;
GRLIB_use_whitelist = ["Whitelist",0] call bis_fnc_getParamValue;
GRLIB_cleanup_vehicles = ["CleanupVehicles",0] call bis_fnc_getParamValue;
GRLIB_csat_aggressivity = ["Aggressivity",2] call bis_fnc_getParamValue;
GRLIB_weather_param = ["Weather",3] call bis_fnc_getParamValue;
GRLIB_shorter_nights = ["ShorterNights",0] call bis_fnc_getParamValue;
GRLIB_ammo_bounties = ["AmmoBounties",0] call bis_fnc_getParamValue;
GRLIB_remote_sensors = ["DisableRemoteSensors",0] call bis_fnc_getParamValue;
GRLIB_blufor_defenders = ["BluforDefenders",1] call bis_fnc_getParamValue;
GRLIB_autodanger = ["Autodanger",0] call bis_fnc_getParamValue;
GRLIB_maximum_fobs = ["MaximumFobs",26] call bis_fnc_getParamValue;

if ( GRLIB_fatigue < 0.1 ) then { GRLIB_fatigue = false } else { GRLIB_fatigue = true };
if ( GRLIB_introduction == 1 ) then { GRLIB_introduction = true } else { GRLIB_introduction = false };
if ( GRLIB_deployment_cinematic == 1 ) then { GRLIB_deployment_cinematic = true } else { GRLIB_deployment_cinematic = false };
if ( GRLIB_build_first_fob == 1 ) then { GRLIB_build_first_fob = true } else { GRLIB_build_first_fob = false };
if ( GRLIB_teamkill_penalty == 1 ) then { GRLIB_teamkill_penalty = true } else { GRLIB_teamkill_penalty = false };
if ( GRLIB_adaptive_opfor == 1 ) then { GRLIB_adaptive_opfor = true } else { GRLIB_adaptive_opfor = false };
if ( GRLIB_passive_income == 1 ) then { GRLIB_passive_income = true } else { GRLIB_passive_income = false };
if ( GRLIB_permissions_param == 1 ) then { GRLIB_permissions_param = true } else { GRLIB_permissions_param = false };
if ( GRLIB_use_whitelist == 1 ) then { GRLIB_use_whitelist = true } else { GRLIB_use_whitelist = false };
if ( GRLIB_shorter_nights == 1 ) then { GRLIB_shorter_nights = true } else { GRLIB_shorter_nights = false };
if ( GRLIB_ammo_bounties == 1 ) then { GRLIB_ammo_bounties = true } else { GRLIB_ammo_bounties = false };
if ( GRLIB_blufor_defenders == 1 ) then { GRLIB_blufor_defenders = true } else { GRLIB_blufor_defenders = false };
if ( GRLIB_autodanger == 1 ) then { GRLIB_autodanger = true } else { GRLIB_autodanger = false };

TF47_helper_battlegroupSlumber 	=	0;

GRLIB_sector_size = 1000;
GRLIB_capture_size = 350;
GRLIB_radiotower_size = 2500;
GRLIB_recycling_percentage = 0.65;
GRLIB_endgame = 0;
GRLIB_vulnerability_timer = 1200;
GRLIB_defended_buildingpos_part = 0.4;
GRLIB_sector_military_value = 3;
GRLIB_secondary_objective_impact = 0.6;
GRLIB_blufor_cap = 100					* GRLIB_unitcap;		// unit_cap = 1
GRLIB_sector_cap = 120					* GRLIB_unitcap;
GRLIB_battlegroup_cap = 150				* GRLIB_unitcap;
GRLIB_patrol_cap = 120					* GRLIB_unitcap;
GRLIB_battlegroup_size = 4				* (sqrt GRLIB_unitcap) * (sqrt GRLIB_csat_aggressivity);
GRLIB_civilians_amount = 10				* GRLIB_civilian_activity;
GRLIB_fob_range = 125;
GRLIB_cleanup_delay = 1200;
GRLIB_surrender_chance = 80;
GRLIB_secondary_missions_costs = [ 10, 10, 10 ];
GRLIB_halo_altitude = 4000;

if ( GRLIB_blufor_cap > 100 ) then { GRLIB_blufor_cap = 100 }; // Don't forget that the human commander manages those, not the server

GRLIB_offload_diag = false;