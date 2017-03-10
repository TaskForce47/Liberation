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
if(isNil "TF47_BUILDER_WHITELIST")then{TF47_BUILDER_WHITELIST=[]};
if(isNil "TF47_JTFC_WHITELIST")then{TF47_JTFC_WHITELIST=[]};
TF47_BUILDER_WHITELIST = profileNamespace getVariable ["TF47_BUILDER_WHITELIST",TF47_BUILDER_WHITELIST];
TF47_JTFC_WHITELIST = profileNamespace getVariable ["TF47_JTFC_WHITELIST",TF47_JTFC_WHITELIST];


date_year = date select 0;
date_month = date select 1;
date_day = date select 2;
blufor_sectors = [];
GRLIB_all_fobs = [];
private _buildings_to_save= [];
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
classnames_to_save = [FOB_typename, huron_typename];
classnames_to_save_blu = [];
building_classnames = [FOB_typename];
{
	no_kill_handler_classnames pushback (_x select 0);
	classnames_to_save pushback (_x select 0);
	building_classnames pushback (_x select 0);
} foreach buildings;

{
	classnames_to_save_blu pushback (_x select 0);
} foreach (static_vehicles + air_vehicles + heavy_vehicles + light_vehicles + support_vehicles);

classnames_to_save = classnames_to_save + classnames_to_save_blu + all_hostile_classnames;


private _liberation_savegame = profileNamespace getVariable [GRLIB_save_key,[]];

if !( _liberation_savegame isEqualTo [] ) then {

	blufor_sectors 								= _liberation_savegame select 0;
	GRLIB_all_fobs 								= _liberation_savegame select 1;
	_buildings_to_save 							= _liberation_savegame select 2;
	time_of_day 								= _liberation_savegame select 3;
	combat_readiness 							= _liberation_savegame select 4;
	saved_ammo_res 								= _liberation_savegame select 8;

	if ( count _liberation_savegame > 10 ) then {
		_weights = _liberation_savegame select 10;
		infantry_weight = _weights select 0;
		armor_weight = _weights select 1;
		air_weight = _weights select 2;
	};

	if ( count _liberation_savegame > 11 ) then {
		GRLIB_vehicle_to_military_base_links = _liberation_savegame select 11;
	};

	if ( count _liberation_savegame > 12 ) then {
		GRLIB_permissions = _liberation_savegame select 12;
	};

	if ( count _liberation_savegame > 13 ) then {
		ai_groups = _liberation_savegame select 13;
	};

	if ( count _liberation_savegame > 14 ) then {
		saved_intel_res = _liberation_savegame select 14;
	};

	if (count TF47_Missionarray > 0 ) then {
		{
			if (  !((_x select 2) == "Destroy AAA Side") && !((_x select 2) == "Destroy Artillery Side") ) then {
				saved_intel_res = saved_intel_res + 10;
			};
		} foreach TF47_Missionarray;
	};

	TF47_Missionarray = [];

	if ( count _liberation_savegame > 15 ) then {
		GRLIB_player_scores = _liberation_savegame select 15;
	};

    if ( count _liberation_savegame >= 16 ) then {
		TF47_respawnTickets = _liberation_savegame select 16;
	};
	setDate [ date_year, date_month, date_day, time_of_day, 0];

	private _correct_fobs = [];
	{
		private _next_fob = _x;
		private _keep_fob = true;
		{
			if ( _next_fob distance (markerpos _x) < 200 && !("military" in (_x splitString "_")) ) exitWith {
				_keep_fob = false;
			};
		} foreach sectors_allSectors;
		if ( _keep_fob ) then { _correct_fobs pushbackUnique _next_fob; };
	} foreach GRLIB_all_fobs;
	GRLIB_all_fobs = _correct_fobs;

	stats_saves_loaded = stats_saves_loaded + 1;

	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// create buildings from savegame
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	{
		_x params ["_nextclass","_nextpos","_nextDir","_hascrew"];

		if ( _nextclass in classnames_to_save ) then {

			//_nextbuilding = _nextclass createVehicle _nextpos;
			private _nextbuilding = createVehicle [_nextclass, _nextpos, [], 0, "NONE"];
			_nextbuilding setVectorUp [0,0,1];
			_nextbuilding setPosATL _nextpos;
			_nextbuilding setdir _nextdir;
			_nextbuilding setdamage 0;

			clearWeaponCargoGlobal _nextbuilding;
			clearMagazineCargoGlobal _nextbuilding;
			clearItemCargoGlobal _nextbuilding;
			clearBackpackCargoGlobal _nextbuilding;

			if ( _nextclass in building_classnames ) then {
				_nextbuilding setVariable [ "GRLIB_saved_pos", _nextpos, false ];
			} else {
					["",_nextbuilding] call tf47_whitelist_fnc_initVehicleTracking;
			};

			if (_nextclass == "TargetBootcampHuman_F") then {
				_nextbuilding setVariable ["rscattributetargetpopupdelay", 10, true];
				_nextbuilding setvariable ["rscattributetargettexture_textureindex", 2];
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
			if (_nextclass in ["rhsusf_m113d_usarmy_medical","RHS_UH60M_MEV2_d","RHS_UH60M_MEV_d","rhsusf_m113_usarmy_medical","RHS_UH60M_MEV2","RHS_UH60M_MEV","Land_Medevac_HQ_V1_F","Land_Medevac_house_V1_F","B_Truck_01_medical_F","B_T_Truck_01_medical_F"]) then {
				if (_nextclass in ["Land_Medevac_HQ_V1_F","Land_Medevac_house_V1_F"]) then {
					_nextbuilding setVariable ["ace_medical_ismedicalfacility", true, true];
				};
				if (_nextclass in ["rhsusf_m113d_usarmy_medical","RHS_UH60M_MEV2_d","RHS_UH60M_MEV_d","rhsusf_m113_usarmy_medical","RHS_UH60M_MEV2","RHS_UH60M_MEV","B_Truck_01_medical_F","B_T_Truck_01_medical_F"]) then {
					_nextbuilding setVariable ["Ace_medical_medicClass", 1, true];
				};
			};

			if ( _nextclass == FOB_typename ) then {
				_nextbuilding addEventHandler ["HandleDamage", { 0 }];
				private _respawnid = [ TF47_helper_playerFaction, getPos _nextbuilding, (format ["FOB %1", ([ getPos _nextbuilding ] call F_getFobName)])] call BIS_fnc_addRespawnPosition;
				_nextbuilding setVariable ["TF47_FOBArray", _respawnid, true];
			};
		};

	} foreach _buildings_to_save;

}else{
	private _dataToSave = [
		blufor_sectors,
		GRLIB_all_fobs,
		[],
		(date select 3),
		0,
		0,
		0,
		0,
		0,
		[],
		[ 33, 33, 33],
		GRLIB_vehicle_to_military_base_links,
		[],
		[],
		0,
		[],
		[ TF47_helper_playerFaction] call BIS_fnc_respawnTickets
	];
	profileNamespace setVariable [ GRLIB_save_key, _dataToSave ];
	saveProfileNamespace;
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
trigger_server_save = false;
server_save_inProgress = false;

[
{
	if ( GRLIB_endgame == 1 ) exitWith {
		[_this select 1] call CBA_fnc_removePerFrameHandler;
		profileNamespace setVariable [ GRLIB_save_key, nil ];
		saveProfileNamespace;
		"missionWON" call BIS_fnc_endMissionServer;
		[99,"Mission: Task Force 47 Liberation",""] call tf47_whitelist_fnc_reportToDatabase;

	};
	if( [TF47_helper_playerFaction,0] call BIS_fnc_respawnTickets == 0)exitWith{
		[_this select 1] call CBA_fnc_removePerFrameHandler;
		profileNamespace    setVariable [ GRLIB_save_key ,nil];
		saveProfileNamespace;
		"missionFailed" call bis_fnc_endmissionServer;
		[98,"Mission: Task Force 47 Liberation",""] call tf47_whitelist_fnc_reportToDatabase;
	};
	if( time > (4*60*60) )then{
		if(count (allPlayers - entities "headlessclients_f") == 0 )then{
			if !( (profileNamespace getVariable ["tf47_battlemanager_requestActionPassword",""]) isEqualTo "") then{
				(profileNamespace getVariable ["tf47_battlemanager_requestActionPassword",""]) serverCommand "#restart";
			};
		};
	};
	if( trigger_server_save && !server_save_inProgress)then{
		server_save_inProgress = true;
		private _buildings_to_save = [];
		{
			private _pos = _x;
			{
				_buildings_to_save pushback [ (typeof _x), (getposATL _x), (getdir _x), false ];
			} foreach ( [
				_pos nearobjects (GRLIB_fob_range * 2),
				{
					((typeof _x) in classnames_to_save ) &&
					( alive _x) &&
					( speed _x < 5 ) &&
					( isNull  attachedTo _x ) &&
					(((getpos _x) select 2) < 10 ) &&
					( getObjectType _x >= 8 )
				}
			] call BIS_fnc_conditionalSelect);
		} foreach GRLIB_all_fobs;

		private _oldBuildingsData = (profileNamespace getVariable [GRLIB_save_key, [] ]) select 2;
		if(count _buildings_to_save == 0)then{_buildings_to_save = _oldBuildingsData};

		time_of_day = date select 3;

		private _dataToSave = [
			blufor_sectors,
			GRLIB_all_fobs,
			_buildings_to_save,
			time_of_day,
			round combat_readiness,
			0,
			0,
			0,
			round resources_ammo,
			[],
			[ 33, 33, 33],
			GRLIB_vehicle_to_military_base_links,
			[],
			[],
			resources_intel,
			[],
			[ TF47_helper_playerFaction] call BIS_fnc_respawnTickets
		];
		profileNamespace setVariable ["TF47_FixedWingBlacklist", TF47_FixedWingBlacklist];
		profileNamespace setVariable ["TF47_ArmoredBlacklist", TF47_ArmoredBlacklist];
		profileNamespace setVariable ["TF47_HeliBlacklist", TF47_HeliBlacklist];
		profileNamespace setVariable ["TF47_BuildBlacklist", TF47_BuildBlacklist];
		profileNamespace setVariable ["TF47_BUILDER_WHITELIST",TF47_BUILDER_WHITELIST];
		profileNamespace setVariable ["TF47_JTFC_WHITELIST",TF47_JTFC_WHITELIST];
		profileNamespace setVariable ["TF47_Missionarray_lastgame", TF47_Missionarray];
		profileNamespace setVariable [ GRLIB_save_key, _dataToSave ];
		saveProfileNamespace;
		server_save_inProgress = false;
		trigger_server_save = false;
	};
},
0.3,
[]
] call CBA_fnc_addPerFrameHandler;

[
	{trigger_server_save = true},
	20,
	[]
] call CBA_fnc_addPerFrameHandler;
