if ( !(isNil "GRLIB_param_wipe_savegame_1") && !(isNil "GRLIB_param_wipe_savegame_2") ) then {
	if ( GRLIB_param_wipe_savegame_1 == 1 && GRLIB_param_wipe_savegame_2 == 1 ) then {
		profileNamespace setVariable [ GRLIB_save_key,nil ];
		saveProfileNamespace;
	};
};

TF47_FixedWingBlacklist = profileNamespace getVariable ["TF47_FixedWingBlacklist", []];
TF47_ArmoredBlacklist = profileNamespace getVariable ["TF47_ArmoredBlacklist", []];
TF47_HeliBlacklist = profileNamespace getVariable ["TF47_HeliBlacklist", []];
TF47_BuildBlacklist = profileNamespace getVariable ["TF47_BuildBlacklist", []];
TF47_BuildBlacklist = profileNamespace getVariable ["TF47_BuildBlacklist", []];
TF47_TL_Whitlelist = profileNamespace getVariable ["TF47_TLWhitelist",["76561197992256569","76561198002813252","76561197960489271","76561197963794597","76561198002813252","76561197960489271","76561197963794597","76561198057152487","76561198093331206","76561198083598937","76561198043617179","76561198057808323","76561197991090099","76561198017253407","76561198060354231","76561197997340019","76561197997804176","76561198107147607","76561198075771437","76561198010638416","76561198026525307","76561198071872589","76561198043320125","76561198088566694","76561198070395053","76561197990703314","76561198122032581","76561198005476324","76561197996296785","76561197981809309","76561198023782694","76561198022749433","76561198135942291","76561197986395577","76561198002813252","76561197960489271", "76561197963794597"]];

publicVariable "TF47_BuildBlacklist";
publicVariable "TF47_ArmoredBlacklist";
publicVariable "TF47_HeliBlacklist";
publicVariable "TF47_FixedWingBlacklist";
publicVariable "TF47_TL_Whitlelist";
date_year = date select 0;
date_month = date select 1;
date_day = date select 2;
blufor_sectors = [];
GRLIB_all_fobs = [];
buildings_to_save= [];
combat_readiness = 0;
saved_ammo_res = 0;
stats_opfor_soldiers_killed = 0;
stats_opfor_killed_by_players = 0;
stats_blufor_soldiers_killed = 0;
stats_player_deaths = 0;
stats_opfor_vehicles_killed = 0;
stats_opfor_vehicles_killed_by_players = 0;
stats_blufor_vehicles_killed = 0;
stats_blufor_soldiers_recruited = 0;
stats_blufor_vehicles_built = 0;
stats_civilians_killed = 0;
stats_civilians_killed_by_players = 0;
stats_sectors_liberated = 0;
stats_playtime = 0;
stats_spartan_respawns = 0;
stats_secondary_objectives = 0;
stats_hostile_battlegroups = 0;
stats_ieds_detonated = 0; 
stats_saves_performed = 0;
stats_saves_loaded = 0;
stats_reinforcements_called = 0;
stats_prisonners_captured = 0;
stats_blufor_teamkills = 0;
stats_vehicles_recycled = 0;
stats_ammo_spent = 0;
stats_sectors_lost = 0;
stats_fobs_built = 0;
stats_fobs_lost = 0;
stats_readiness_earned = 0;
infantry_weight = 33;
armor_weight = 33;
air_weight = 33;
GRLIB_vehicle_to_military_base_links = [];
GRLIB_permissions = [];
ai_groups = [];
saved_intel_res = 0;
GRLIB_player_scores = [];
TF47_respawnTickets	=	10;
TF47_Missionarray = profileNamespace getVariable ["TF47_Missionarray_lastgame", []];

no_kill_handler_classnames = [FOB_typename, huron_typename];
_classnames_to_save = [FOB_typename, huron_typename];
_classnames_to_save_blu = [];
_building_classnames = [FOB_typename];
{
	no_kill_handler_classnames pushback (_x select 0);
	_classnames_to_save pushback (_x select 0);
	_building_classnames pushback (_x select 0);
} foreach buildings;

{
	_classnames_to_save_blu pushback (_x select 0);
} foreach (static_vehicles + air_vehicles + heavy_vehicles + light_vehicles + support_vehicles);

_classnames_to_save = _classnames_to_save + _classnames_to_save_blu + all_hostile_classnames;

trigger_server_save = false;
greuh_liberation_savegame = profileNamespace getVariable GRLIB_save_key;

if ( !isNil "greuh_liberation_savegame" ) then {

	blufor_sectors 								= greuh_liberation_savegame select 0;
	GRLIB_all_fobs 								= greuh_liberation_savegame select 1;
	buildings_to_save 							= greuh_liberation_savegame select 2;
	time_of_day 								= greuh_liberation_savegame select 3;
	combat_readiness 							= greuh_liberation_savegame select 4;
	saved_ammo_res 								= greuh_liberation_savegame select 8;

	if ( count greuh_liberation_savegame > 9 ) then {
		_stats = greuh_liberation_savegame select 9;
		stats_opfor_soldiers_killed 			= _stats select 0;
		stats_opfor_killed_by_players 			= _stats select 1;
		stats_blufor_soldiers_killed 			= _stats select 2;
		stats_player_deaths 					= _stats select 3;
		stats_opfor_vehicles_killed 			= _stats select 4;
		stats_opfor_vehicles_killed_by_players 	= _stats select 5;
		stats_blufor_vehicles_killed 			= _stats select 6;
		stats_blufor_soldiers_recruited 		= _stats select 7;
		stats_blufor_vehicles_built 			= _stats select 8;
		stats_civilians_killed 					= _stats select 9;
		stats_civilians_killed_by_players 		= _stats select 10;
		stats_sectors_liberated 				= _stats select 11;
		stats_playtime 							= _stats select 12;
		stats_spartan_respawns 					= _stats select 13;
		stats_secondary_objectives 				= _stats select 14;
		stats_hostile_battlegroups 				= _stats select 15;
		stats_ieds_detonated 					= _stats select 16; publicVariable "stats_ieds_detonated";
		stats_saves_performed 					= _stats select 17;
		stats_saves_loaded 						= _stats select 18;
		stats_reinforcements_called 			= _stats select 19;
		stats_prisonners_captured 				= _stats select 20;
		stats_blufor_teamkills 					= _stats select 21;
		stats_vehicles_recycled 				= _stats select 22;
		stats_ammo_spent 						= _stats select 23;
		stats_sectors_lost 						= _stats select 24;
		stats_fobs_built 						= _stats select 25;
		stats_fobs_lost 						= _stats select 26;
		stats_readiness_earned 					= _stats select 27;
	};

	if ( count greuh_liberation_savegame > 10 ) then {
		_weights = greuh_liberation_savegame select 10;
		infantry_weight = _weights select 0;
		armor_weight = _weights select 1;
		air_weight = _weights select 2;
	};

	if ( count greuh_liberation_savegame > 11 ) then {
		GRLIB_vehicle_to_military_base_links = greuh_liberation_savegame select 11;
	};

	if ( count greuh_liberation_savegame > 12 ) then {
		GRLIB_permissions = greuh_liberation_savegame select 12;
	};

	if ( count greuh_liberation_savegame > 13 ) then {
		ai_groups = greuh_liberation_savegame select 13;
	};

	if ( count greuh_liberation_savegame > 14 ) then {
		saved_intel_res = greuh_liberation_savegame select 14;
	};

	if (count TF47_Missionarray > 0 ) then {
		{
			if (  !((_x select 2) == "Destroy AAA Side") && !((_x select 2) == "Destroy Artillery Side") ) then {
				saved_intel_res = saved_intel_res + 10;
			};
		} foreach TF47_Missionarray;
	};
	TF47_Missionarray = [];

	if ( count greuh_liberation_savegame > 15 ) then {
		GRLIB_player_scores = greuh_liberation_savegame select 15;
	};
    
    if ( count greuh_liberation_savegame >= 16 ) then {
		TF47_respawnTickets = greuh_liberation_savegame select 16;
	};
	setDate [ 2016, 6, 6, time_of_day, 0];

	_correct_fobs = [];
	{
		_next_fob = _x;
		_keep_fob = true;
		{
			if ( _next_fob distance (markerpos _x) < 200 && !("military" in (_x splitString "_")) ) exitWith {
				_keep_fob = false; 
			};
		} foreach sectors_allSectors;
		if ( _keep_fob ) then { _correct_fobs pushbackUnique _next_fob; };
	} foreach GRLIB_all_fobs;
	GRLIB_all_fobs = _correct_fobs;

	stats_saves_loaded = stats_saves_loaded + 1;

	{
		_nextclass = _x select 0;

		if ( _nextclass in _classnames_to_save ) then {

			_nextpos = _x select 1;
			_nextdir = _x select 2;
			_hascrew = false;
			if ( count _x > 3 ) then {
				_hascrew = _x select 3;
			};
			_nextbuilding = _nextclass createVehicle _nextpos;
			_nextbuilding setVectorUp [0,0,1];
			_nextbuilding setPosATL _nextpos;
			_nextbuilding setdir _nextdir;
			_nextbuilding setdamage 0;

			clearWeaponCargoGlobal _nextbuilding;
			clearMagazineCargoGlobal _nextbuilding;
			clearItemCargoGlobal _nextbuilding;
			clearBackpackCargoGlobal _nextbuilding;
			
			if ( _nextclass in _building_classnames ) then {						
				_nextbuilding setVariable [ "GRLIB_saved_pos", _nextpos, false ];
			} else {
				if (_classname isKindOf "AIR") then {
					_EHkilledIdx2 = _nextbuilding addEventHandler ["Hit", {  (format ["[INFORMATION] Vehicle: %1 ( %2 )  was hit by %3 ( %4 ) . instigator = %5", (_this select 0), typeOf (_this select 0), (_this select 1),typeOf (_this select 1),  (_this select 3), typeOf (vehicle (_this select 3)) ]) remoteExec ["diag_log", 2, false]; }]; 
				};
				_EHkilledIdx1 = _nextbuilding addEventHandler ["killed", { (format ["[INFORMATION] Vehicle: %1 ( %2 ) was killed by %3 ( %4 ) . instigator = %5 ( %6 ) ", (_this select 0), (getText (configfile >> "CfgVehicles" >> typeOf (_this select 0) >> "displayName")) , (_this select 1), (getText (configfile >> "CfgVehicles" >> typeOf typeOf (_this select 1) >> "displayName")), (_this select 2), (getText (configfile >> "CfgVehicles" >> typeOf typeOf (_this select 2) >> "displayName"))]) remoteExec ["diag_log", 2, false]; }];
			};
			
			if (_classname == "TargetBootcampHuman_F") then {
				_vehicle setVariable ["rscattributetargetpopupdelay", 10, true];
				_vehicle setvariable ["rscattributetargettexture_textureindex", 2];
			};

			if (_nextclass == "TargetBootcampHuman_F") then {
				_nextbuilding setVariable ["rscattributetargetpopupdelay", 10, true];
				_nextbuilding setvariable  ["rscattributetargettexture_textureindex", 2];
			};
			
			if ( _hascrew ) then {
				[ _nextbuilding ] call F_forceBluforCrew;
			};

			if ( _nextclass in all_hostile_classnames ) then {
				_nextbuilding setVariable [ "GRLIB_captured", 1, true ];
			};

			// Assign all MedicVehicles and Faacilitys the ACE Attribute's
			if (_classname in ["rhsusf_m113d_usarmy_medical","RHS_UH60M_MEV2_d","RHS_UH60M_MEV_d","rhsusf_m113_usarmy_medical","RHS_UH60M_MEV2","RHS_UH60M_MEV","Land_Medevac_HQ_V1_F","Land_Medevac_house_V1_F","B_Truck_01_medical_F","B_T_Truck_01_medical_F"]) then {
				if (_classname in ["Land_Medevac_HQ_V1_F","Land_Medevac_house_V1_F"]) then {
					_nextbuilding setVariable ["ace_medical_ismedicalfacility", true, true];
				};
				if (_classname in ["rhsusf_m113d_usarmy_medical","RHS_UH60M_MEV2_d","RHS_UH60M_MEV_d","rhsusf_m113_usarmy_medical","RHS_UH60M_MEV2","RHS_UH60M_MEV","B_Truck_01_medical_F","B_T_Truck_01_medical_F"]) then {
					_nextbuilding setVariable ["Ace_medical_medicClass", 1, true];
				};
			};

			if ( _nextclass == FOB_typename ) then {
				_nextbuilding addEventHandler ["HandleDamage", { 0 }];
				_respawnid = [ TF47_helper_playerFaction, getPos _nextbuilding, (format ["FOB %1", ([ getPos _nextbuilding ] call F_getFobName)])] call BIS_fnc_addRespawnPosition;
				_nextbuilding setVariable ["TF47_FOBArray", _respawnid, true];
			};
		};

	} foreach buildings_to_save;

	{
		private [ "_nextgroup", "_grp" ];
		_nextgroup = _x;
		_grp = createGroup TF47_helper_playerFaction;

		{
			private [ "_nextunit", "_nextpos", "_nextdir", "_nextobj"];
			_nextunit = _x;
			_nextpos = [(_nextunit select 1) select 0, (_nextunit select 1) select 1, ((_nextunit select 1) select 2) + 0.2];
			_nextdir = _nextunit select 2;
			(_nextunit select 0) createUnit [ _nextpos, _grp, ' '];
			_nextobj = ((units _grp) select ((count (units _grp)) - 1));
			_nextobj setPosATL _nextpos;
			_nextobj setDir _nextdir;
		} foreach _nextgroup;
	} foreach ai_groups;
};

TF47_respawnTickets = [ TF47_helper_playerFaction , TF47_respawnTickets] call BIS_fnc_respawnTickets;
publicVariable "blufor_sectors";
publicVariable "GRLIB_all_fobs";

if ( count GRLIB_vehicle_to_military_base_links == 0 ) then {
	private [ "_assigned_bases", "_assigned_vehicles", "_nextbase", "_nextvehicle" ];
	_assigned_bases = [];
	_assigned_vehicles = [];

	while { count _assigned_bases < count sectors_military && count _assigned_vehicles < count elite_vehicles } do {
		_nextbase =  selectRandom ( [ sectors_military, { !(_x in _assigned_bases) } ] call BIS_fnc_conditionalSelect );
		_nextvehicle =  selectRandom ( [ elite_vehicles, { !(_x in _assigned_vehicles) } ] call BIS_fnc_conditionalSelect );
		_assigned_bases pushback _nextbase;
		_assigned_vehicles pushback _nextvehicle;
		GRLIB_vehicle_to_military_base_links pushback [_nextvehicle, _nextbase];
	};
} else {
	_classnames_to_check = GRLIB_vehicle_to_military_base_links;
	{
		if ( ! ( [ _x select 0 ] call F_checkClass ) ) then {
			GRLIB_vehicle_to_military_base_links = GRLIB_vehicle_to_military_base_links - [_x];
		};
	} foreach _classnames_to_check;
};
publicVariable "GRLIB_vehicle_to_military_base_links";
publicVariable "GRLIB_permissions";
save_is_loaded = true; publicVariable "save_is_loaded";

while { true } do {
	waitUntil {
		sleep 0.3;
		trigger_server_save || GRLIB_endgame == 1;
	};

	if ( GRLIB_endgame == 1 ) then {
		profileNamespace setVariable [ GRLIB_save_key, nil ];
		saveProfileNamespace;
		while { true } do { sleep 300; };
	} else {

		trigger_server_save = false;
		buildings_to_save = [];
		ai_groups = [];

		_all_buildings = [];
		{
			_fobpos = _x;
			_nextbuildings = [ _fobpos nearobjects (GRLIB_fob_range * 2), {
				((typeof _x) in _classnames_to_save ) &&
				( alive _x) &&
				( speed _x < 5 ) &&
				( isNull  attachedTo _x ) &&
				(((getpos _x) select 2) < 10 ) &&
				( getObjectType _x >= 8 )
 				} ] call BIS_fnc_conditionalSelect;

			_all_buildings = _all_buildings + _nextbuildings;

			{
				_nextgroup = _x;
				if (  side _nextgroup == TF47_helper_playerFaction ) then {
					if ( { isPlayer _x } count ( units _nextgroup ) == 0 ) then {
						if ( { alive _x } count ( units _nextgroup ) > 0  ) then {
							if ( _fobpos distance (leader _nextgroup) < GRLIB_fob_range * 2 ) then {
								private [ "_grouparray" ];
								_grouparray = [];
								{
									if ( alive _x && (vehicle _x == _x ) ) then {
										_grouparray pushback [ typeof _x, getPosATL _x, getDir _x ];
									};
								} foreach (units _nextgroup);

								ai_groups pushback _grouparray;
							};
						};
					};
				};
			} foreach allGroups;
		} foreach GRLIB_all_fobs;

		{
			private _savedpos = [];

			if ( (typeof _x) in _building_classnames ) then {
				_savedpos = _x getVariable [ "GRLIB_saved_pos", [] ];
				if ( count _savedpos == 0 ) then {
					_x setVariable [ "GRLIB_saved_pos", getposATL _x, false ];
					_savedpos = getposATL _x;
				};
			} else {
				_savedpos = getposATL _x;
			};

			private _nextclass = typeof _x;
			private _nextdir = getdir _x;
			private _hascrew = false;
			if ( _nextclass in _classnames_to_save_blu ) then {
				if ( ( { !isPlayer _x } count (crew _x) ) > 0 ) then {
					_hascrew = true;
				};
			};
			buildings_to_save pushback [ _nextclass,_savedpos,_nextdir,_hascrew ];
		} foreach _all_buildings;

		time_of_day = date select 3;

		

		private [ "_newscores", "_knownplayers", "_playerindex", "_nextplayer" ];
		_knownplayers = [];
		_newscores = [] + GRLIB_player_scores;
		{ _knownplayers pushback (_x select 0) } foreach GRLIB_player_scores;

		{
			_nextplayer = _x;

			if ( score _nextplayer >= 20 ) then {
				_playerindex = _knownplayers find (getPlayerUID _nextplayer);
				if ( _playerindex >= 0 ) then {
					_newscores set [ _playerindex, [ getPlayerUID _x, score _x] ];
				} else {
					_newscores pushback [ getPlayerUID _x, score _x ];
				};
			};
		} foreach allPlayers;
		GRLIB_player_scores = _newscores;
		TF47_respawnTickets = [ TF47_helper_playerFaction] call BIS_fnc_respawnTickets;
		_stats = [];
		_stats pushback stats_opfor_soldiers_killed;
		_stats pushback stats_opfor_killed_by_players;
		_stats pushback stats_blufor_soldiers_killed;
		_stats pushback stats_player_deaths;
		_stats pushback stats_opfor_vehicles_killed;
		_stats pushback stats_opfor_vehicles_killed_by_players;
		_stats pushback stats_blufor_vehicles_killed;
		_stats pushback stats_blufor_soldiers_recruited;
		_stats pushback stats_blufor_vehicles_built;
		_stats pushback stats_civilians_killed;
		_stats pushback stats_civilians_killed_by_players;
		_stats pushback stats_sectors_liberated;
		_stats pushback stats_playtime;
		_stats pushback stats_spartan_respawns;
		_stats pushback stats_secondary_objectives;
		_stats pushback stats_hostile_battlegroups;
		_stats pushback stats_ieds_detonated;
		_stats pushback stats_saves_performed;
		_stats pushback stats_saves_loaded;
		_stats pushback stats_reinforcements_called;
		_stats pushback stats_prisonners_captured;
		_stats pushback stats_blufor_teamkills;
		_stats pushback stats_vehicles_recycled;
		_stats pushback stats_ammo_spent;
		_stats pushback stats_sectors_lost;
		_stats pushback stats_fobs_built;
		_stats pushback stats_fobs_lost;
		_stats pushback stats_readiness_earned;

		greuh_liberation_savegame = [
			blufor_sectors, 
			GRLIB_all_fobs, 
			buildings_to_save, 
			time_of_day, 
			round combat_readiness,
			0,
			0,
			0, 
			round resources_ammo, 
			_stats,
			[ round infantry_weight, round armor_weight, round air_weight ], 
			GRLIB_vehicle_to_military_base_links, 
			GRLIB_permissions, 
			ai_groups, 
			resources_intel, 
			GRLIB_player_scores, 
			TF47_respawnTickets 
		];
		profileNamespace setVariable ["TF47_FixedWingBlacklist", TF47_FixedWingBlacklist];
		profileNamespace setVariable ["TF47_ArmoredBlacklist", TF47_ArmoredBlacklist];
		profileNamespace setVariable ["TF47_HeliBlacklist", TF47_HeliBlacklist];
		profileNamespace setVariable ["TF47_BuildBlacklist", TF47_BuildBlacklist];
		profileNamespace setVariable ["TF47_TLWhitelist",TF47_TL_Whitlelist];
		profileNamespace setVariable ["TF47_Missionarray_lastgame", TF47_Missionarray];
		profileNamespace setVariable [ GRLIB_save_key, greuh_liberation_savegame ];
		saveProfileNamespace;
	};
};