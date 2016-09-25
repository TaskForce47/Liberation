enableSaving [ false, false ];
if(!isclass (configfile >> "CfgPatches" >> "rhsusf_main"))then{"modsNOTactivated" call BIS_fnc_endMission;};
[] call compileFinal preprocessFileLineNUmbers "scripts\shared\config.sqf";

// make blacklistmarker invisible
{	_x setMarkerAlpha 0;	} foreach ["noBattlegroup1", "noBattlegroup2", "noBattlegroup3", "noBattlegroup4" ];

TF47_setPermission = compileFinal preprocessfilelinenumbers "scripts\client\commander\TF47_setPermission.sqf";
TF47_fnc_WakeUp = compileFinal preprocessfilelinenumbers "scripts\shared\functions\TF47_fnc_WakeUp.sqf";
TF47_fnc_CPR = compileFinal preprocessfilelinenumbers "scripts\shared\functions\TF47_fnc_CPR.sqf";

{_x remoteExec ["deleteGroup", groupOwner _x]; } foreach (allGroups select {count units _x  == 0 });
[]execVM "scripts\server\VCOMAI\init.sqf";	
[] call compileFinal preprocessFileLineNumbers "scripts\shared\atlas_manager.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\shared\liberation_functions.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\shared\init_sectors.sqf";

TF47_fnc_sendGroundsupport = compileFinal preprocessFileLineNUmbers "scripts\server\patrols\send_groundsupport.sqf";

[] call compileFinal preprocessFileLineNUmbers "classnames_extension.sqf";
[] call compileFinal preprocessFileLineNumbers "arsenal.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\loadouts\tf47_arsenal_3cb_baf.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\loadouts\tf47_arsenal_bwa3.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\loadouts\tf47_arsenal_hlc.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\loadouts\tf47_arsenal_radiomod.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\shared\classnames.sqf";
TF47_GetPlayer = compileFinal preprocessfilelinenumbers "Scripts\client\misc\getPlayer.sqf";

if (isNil "TF_ArsenalArray") then { TF_ArsenalArray = []; };
if (isNil "TF47_Missionarray") then { TF47_Missionarray = []; };
if (isNil "TF47_Missionarray") then {
	TF47_TL_Whitlelist = [
		"76561198083598937",	//selvo
		"76561198093331206",	//sir.mono
		"76561198057152487",	//pixxel
		"76561197992256569",	//fred
	    "76561197991090099",    //jenkins
		"76561198017253407",	//carmine
		"76561198060354231",
		"76561197997340019",
		"76561197997804176",
		"76561198107147607",
		"76561198075771437",
		"76561198010638416",
		"76561198026525307",
		"76561198071872589",
		"76561198043320125",
		"76561198088566694",
		"76561198070395053",
		"76561197990703314",
		"76561198122032581",
		"76561198005476324",
		"76561197996296785",
		"76561197981809309",
		"76561198023782694",
		"76561198022749433"
	];
};
[] execVM "GREUH\scripts\GREUH_activate.sqf";

[] call compileFinal preprocessfilelinenumbers "scripts\shared\init_shared.sqf";

if (isServer) then {
	[] call compileFinal preprocessFileLineNumbers "scripts\server\init_server.sqf";
};

if (!isDedicated && !hasInterface && isMultiplayer) then {
	[] spawn compileFinal preprocessFileLineNumbers "scripts\server\offloading\hc_manager.sqf";
};

if (!isDedicated && hasInterface) then {
	waitUntil { alive player };
	[] call compileFinal preprocessFileLineNumbers "scripts\client\init_client.sqf";
} else {
	setViewDistance 1600;
};


TF47_helper_swapSide =	{
	params ["_side",["_grp",nil]];

	private _grpNew	= createGroup _side;

	if(!isNil "_grp")then{

		(units _grp) joinSilent	_grpNew;

	};
	deleteGroup _grp;
	_grpNew;
};


[
	30*60,							// seconds to delete dead Bodies 					(0 means dont delete) 
	30*60,							// seconds to delete dead Vehicles 					(0 means dont delete)
	30*60,							// seconds to delete immobile Vehicles 				(0 means dont delete)
	20*60,							// seconds to delete dropped Weapons 				(0 means dont delete)
	0,								// seconds to delete planted Explosives 			(0 means dont delete)
	5*60							// seconds to delete dropped Smokes/chemlights 		(0 means dont delete)
] spawn compile preprocessFileLineNumbers "scripts\server\repetitive_cleanup.sqf";