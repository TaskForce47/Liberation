// AI
add_civ_waypoints 							= compileFinal preprocessFileLineNumbers "scripts\server\ai\add_civ_waypoints.sqf";
add_defense_waypoints 						= compileFinal preprocessFileLineNumbers "scripts\server\ai\add_defense_waypoints.sqf";
battlegroup_ai 								= compileFinal preprocessFileLineNumbers "scripts\server\ai\battlegroup_ai.sqf";
building_defence_ai 						= compileFinal preprocessFileLineNumbers "scripts\server\ai\building_defence_ai.sqf";
patrol_ai 									= compileFinal preprocessFileLineNumbers "scripts\server\ai\patrol_ai.sqf";
prisonner_ai 								= compileFinal preprocessFileLineNumbers "scripts\server\ai\prisonner_ai.sqf";
troup_transport 							= compileFinal preprocessFileLineNumbers "scripts\server\ai\troup_transport.sqf";

// Battlegroup
TF47_battlegroup_initParaGroup				= compileFinal preprocessFileLineNumbers "scripts\server\battlegroup\TF47_para_fnc_initParaBattlegroup.sqf";
TF47_battlegroup_closeairsupport			= compileFinal preprocessFileLineNumbers "scripts\server\battlegroup\TF47_fnc_spawnCloseAirSupport.sqf";
TF47_battlegroup_combatAirPatrol			= compileFinal preprocessFileLineNumbers "scripts\server\battlegroup\TF47_fnc_spawnCombatAirPatrol.sqf";
TF47_battlegroup_spawnDropship				= compileFinal preprocessFileLineNumbers "scripts\server\battlegroup\TF47_para_fnc_spawnPlane.sqf";

[] spawn compileFinal preprocessFileLineNumbers "scripts\server\battlegroup\TF47_para_fnc_paratrooperHandler.sqf";

TF47_battlegroup_air 						= compileFinal preprocessFileLineNumbers "scripts\server\battlegroup\TF47_battlegroup_air.sqf";
TF47_battlegroup_config						= compileFinal preprocessFileLineNumbers "scripts\server\battlegroup\TF47_battlegroup_config.sqf";
spawn_battlegroup 							= compileFinal preprocessFileLineNumbers "scripts\server\battlegroup\spawn_battlegroup.sqf";

// Game
check_victory_conditions 					= compileFinal preprocessFileLineNumbers "scripts\server\game\check_victory_conditions.sqf";

// Patrol
manage_one_civilian_patrol 					= compileFinal preprocessFileLineNumbers "scripts\server\patrols\manage_one_civilian_patrol.sqf";
manage_one_patrol 							= compileFinal preprocessFileLineNumbers "scripts\server\patrols\manage_one_patrol.sqf";
reinforcements_manager 						= compileFinal preprocessFileLineNumbers "scripts\server\patrols\reinforcements_manager.sqf";
send_paratroopers 							= compileFinal preprocessFileLineNumbers "scripts\server\patrols\send_paratroopers.sqf";

// Resources
recalculate_caps 							= compileFinal preprocessFileLineNumbers "scripts\server\resources\recalculate_caps.sqf";

// Secondary objectives
fob_hunting 								= compileFinal preprocessFileLineNumbers "scripts\server\secondary\fob_hunting.sqf";
convoy_hijack 								= compileFinal preprocessFileLineNumbers "scripts\server\secondary\convoy_hijack.sqf";
search_and_rescue 							= compileFinal preprocessFileLineNumbers "scripts\server\secondary\search_and_rescue.sqf";
TF47_SeaMines 								= compileFinal preprocessFileLineNumbers "scripts\server\secondary\TF47_SeaMines.sqf";

TF47_spawnSideMissionARTY 					=	compileFinal preprocessFileLineNumbers "scripts\server\secondary\TF47_ArtySide.sqf";
TF47_spawnSideMissionAAA  					=	compileFinal preprocessFileLineNumbers "scripts\server\secondary\TF47_AAASide.sqf";
TF47_helper_isAreaReachable					=	compileFinal preprocessFileLineNumbers "scripts\server\battlegroup\TF47_fnc_isAreaReachable.sqf";
TF47_helper_getPlayerBalance				=	compileFinal preprocessFileLineNumbers "scripts\server\battlegroup\TF47_fnc_getPlayerBalance.sqf";
TF47_helper_findOpforSpawnPoint				=	compileFinal preprocessFileLineNumbers "scripts\server\battlegroup\TF47_fnc_findOpforSpawnPoint.sqf";


TF47_helper_swapSide						=	{

	private ["_grpNew"];
	params ["_side",["_grp",nil]];

	_grpNew	=	createGroup	_side;

	if(!isNil "_grp")then{

		(units _grp)	joinSilent	_grpNew;

	};
	deleteGroup _grp;
	_grpNew;
	
};

// Sector
attack_in_progress_fob 		= compileFinal preprocessFileLineNumbers "scripts\server\sector\attack_in_progress_fob.sqf";
attack_in_progress_sector 	= compileFinal preprocessFileLineNumbers "scripts\server\sector\attack_in_progress_sector.sqf";
destroy_fob 				= compileFinal preprocessFileLineNumbers "scripts\server\sector\destroy_fob.sqf";
ied_manager 				= compileFinal preprocessFileLineNumbers "scripts\server\sector\ied_manager.sqf";
manage_ammoboxes 			= compileFinal preprocessFileLineNumbers "scripts\server\sector\manage_ammoboxes.sqf";
manage_one_sector 			= compileFinal preprocessFileLineNumbers "scripts\server\sector\manage_one_sector.sqf";
wait_to_spawn_sector 		= compileFinal preprocessFileLineNumbers "scripts\server\sector\wait_to_spawn_sector.sqf";



[] spawn compileFinal preprocessFileLineNumbers "scripts\server\battlegroup\TF47_battlegroup_main.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\server\game\TF47_Sidemissionmanagement.sqf";


[] spawn compileFinal preprocessFileLineNumbers "scripts\server\base\startgame.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\server\base\huron_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\server\game\apply_saved_scores.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\server\game\capture_vehicles.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\server\game\cleanup_vehicles.sqf";

[] spawn compileFinal preprocessFileLineNumbers "scripts\server\game\manage_time.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\server\game\periodic_save.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\server\game\playtime.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\server\game\save_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\server\game\spawn_radio_towers.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\server\game\synchronise_vars.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\server\game\zeus_synchro.sqf";

[] spawn compileFinal preprocessFileLineNumbers "scripts\server\offloading\offload_calculation.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\server\offloading\offload_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\server\offloading\show_fps.sqf";

[] spawn compileFinal preprocessFileLineNumbers "scripts\server\patrols\civilian_patrols.sqf";
//[] spawn compileFinal preprocessFileLineNumbers "scripts\server\patrols\manage_patrols.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\server\patrols\reinforcements_resetter.sqf";

[] spawn compileFinal preprocessFileLineNumbers "scripts\server\resources\manage_resources.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\server\resources\recalculate_resources.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\server\resources\recalculate_timer.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\server\resources\unit_cap.sqf";

[] spawn compileFinal preprocessFileLineNumbers "scripts\server\sector\lose_sectors.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\server\sector\manage_sectors.sqf";

[] call compileFinal preprocessFileLineNumbers "scripts\server\base\TF47_CheckPrisoners.sqf";
