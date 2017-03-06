/*
	init.sqf
	in mp environment it will be executed AFTER initserver.sqf and AFTER initPlayerLocal.sqf
	in sp environment it will be executed BEFOR (thanks for that ...)
*/

enableSaving [ false, false ];
[] call tf47_misc_fnc_initModConfigs;
[] call compileFinal preprocessFileLineNUmbers "scripts\shared\config.sqf";	// all missionparameters

// make blacklistmarker invisible
{	_x setMarkerAlpha 0;	} foreach ["noBattlegroup1", "noBattlegroup2", "noBattlegroup3", "noBattlegroup4" ];

TF47_fnc_sendGroundsupport = compileFinal preprocessFileLineNUmbers "scripts\server\patrols\send_groundsupport.sqf";

[] execVM "scripts\server\VCOMAI\init.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\shared\liberation_functions.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\shared\init_sectors.sqf";

[] call tf47_arsenal_fnc_preInitArsenal; //<- compiling additional modconfigs
[] call tf47_battlemanager_fnc_initBattleManager;
[] call compileFinal preprocessFileLineNUmbers "classnames_extension.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\shared\classnames.sqf";

[] execVM "GREUH\scripts\GREUH_activate.sqf";

[] call compileFinal preprocessfilelinenumbers "scripts\shared\init_shared.sqf";


if (isServer) then {

	[] call compileFinal preprocessFileLineNumbers "scripts\server\init_server.sqf";
	[
	30*60,							// seconds to delete dead Bodies 					(0 means dont delete)
	30*60,							// seconds to delete dead Vehicles 					(0 means dont delete)
	30*60,							// seconds to delete immobile Vehicles 				(0 means dont delete)
	20*60,							// seconds to delete dropped Weapons 				(0 means dont delete)
	0,								// seconds to delete planted Explosives 			(0 means dont delete)
	5*60							// seconds to delete dropped Smokes/chemlights 		(0 means dont delete)
	] spawn compile preprocessFileLineNumbers "scripts\server\repetitive_cleanup.sqf";

};

if (!isDedicated && !hasInterface && isMultiplayer) then {
	[] spawn compileFinal preprocessFileLineNumbers "scripts\server\offloading\hc_manager.sqf";
};

if (!isDedicated && hasInterface) then {
	waitUntil { alive player };
	[] call tf47_whitelist_fnc_initClient;
	[] call compileFinal preprocessFileLineNumbers "scripts\client\init_client.sqf";
	_action = ["CTIPUSH", "Push", "", {_target setPos (_target getPos [0.5,  _player getDir _target]);}, {true}] call ace_interact_menu_fnc_createAction;
	{[_x, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToClass;} foreach ["B_Boat_Armed_01_minigun_F","B_T_Boat_Armed_01_minigun_F","O_T_Boat_Armed_01_hmg_F","O_Boat_Armed_01_hmg_F","I_Boat_Armed_01_minigun_F"];
} else {
	setViewDistance 1600;
};
