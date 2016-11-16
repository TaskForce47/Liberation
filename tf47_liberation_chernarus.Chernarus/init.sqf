/*
	init.sqf
	in mp environment it will be executed AFTER initserver.sqf and AFTER initPlayerLocal.sqf
	in sp environment it will be executed BEFOR (thanks for that ...)
*/
enableSaving [ false, false ];
[] call compileFinal preprocessFileLineNUmbers "scripts\shared\config.sqf";	// all missionparameters

// make blacklistmarker invisible
{	_x setMarkerAlpha 0;	} foreach ["noBattlegroup1", "noBattlegroup2", "noBattlegroup3", "noBattlegroup4" ];

TF47_setPermission = compileFinal preprocessfilelinenumbers "scripts\client\commander\TF47_setPermission.sqf";
//TF47_fnc_WakeUp = compileFinal preprocessfilelinenumbers "scripts\shared\functions\TF47_fnc_WakeUp.sqf";
//TF47_fnc_CPR = compileFinal preprocessfilelinenumbers "scripts\shared\functions\TF47_fnc_CPR.sqf";
TF47_GetPlayer = compileFinal preprocessfilelinenumbers "Scripts\client\misc\getPlayer.sqf";
TF47_fnc_sendGroundsupport = compileFinal preprocessFileLineNUmbers "scripts\server\patrols\send_groundsupport.sqf";
TF47_helper_swapSide =	{
	params ["_side",["_grp",nil]];
	private _grpNew	= createGroup _side;
	if(!isNil "_grp")then{
		(units _grp) joinSilent	_grpNew;
	};
	deleteGroup _grp;
	_grpNew;
};

{_x remoteExec ["deleteGroup", groupOwner _x]; } foreach (allGroups select {count units _x  == 0 });

[]execVM "scripts\server\VCOMAI\init.sqf";	
[] call compileFinal preprocessFileLineNumbers "scripts\shared\atlas_manager.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\shared\liberation_functions.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\shared\init_sectors.sqf";

[] call compileFinal preprocessFileLineNUmbers "classnames_extension.sqf";
[] call compileFinal preprocessFileLineNumbers "arsenal.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\loadouts\tf47_arsenal_3cb_baf.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\loadouts\tf47_arsenal_bwa3.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\loadouts\tf47_arsenal_hlc.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\loadouts\tf47_arsenal_radiomod.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\shared\classnames.sqf";

[] execVM "GREUH\scripts\GREUH_activate.sqf";

[] call compileFinal preprocessfilelinenumbers "scripts\shared\init_shared.sqf";

if(isNil "TF47_PERMISSION_INIT")then{ TF47_PERMISSION_INIT = false; };
if(isNil "TF47_PERMISSION_BUILDER")then{ TF47_PERMISSION_BUILDER = false; };
if(isNil "TF47_PERMISSION_ARMOUR")then{ TF47_PERMISSION_ARMOUR = false; };
if(isNil "TF47_PERMISSION_PLANE")then{ TF47_PERMISSION_PLANE = false; };
if(isNil "TF47_PERMISSION_HELO")then{ TF47_PERMISSION_HELO = false; };
if(isNil "TF47_PERMISSION_JTFC")then{ TF47_PERMISSION_JTFC = false; };

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
	[] call compileFinal preprocessFileLineNumbers "scripts\client\init_client.sqf";
	_action = ["CTIPUSH", "Push", "", {_target setPos (_target getPos [0.5,  _player getDir _target]);}, {true}] call ace_interact_menu_fnc_createAction;
	{[_x, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToClass;} foreach ["B_Boat_Armed_01_minigun_F","B_T_Boat_Armed_01_minigun_F","O_T_Boat_Armed_01_hmg_F","O_Boat_Armed_01_hmg_F","I_Boat_Armed_01_minigun_F"];
} else {
	setViewDistance 1600;
};