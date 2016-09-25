if (isNil "TF47_Missionarray") then { TF47_Missionarray = []; };
if (isNil "TF47_Missionarray") then {
	TF47_TL_Whitlelist = [
	    "76561197991090099",
		"76561198017253407",
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




build_remote_call 			= compileFinal preprocessFileLineNumbers "scripts\server\remotecall\build_remote_call.sqf";
build_fob_remote_call 		= compileFinal preprocessFileLineNumbers "scripts\server\remotecall\build_fob_remote_call.sqf";
cancel_build_remote_call 	= compileFinal preprocessFileLineNumbers "scripts\server\remotecall\cancel_build_remote_call.sqf";
prisonner_remote_call 		= compileFinal preprocessFileLineNumbers "scripts\server\remotecall\prisonner_remote_call.sqf";
recycle_remote_call 		= compileFinal preprocessFileLineNumbers "scripts\server\remotecall\recycle_remote_call.sqf";
reinforcements_remote_call 	= compileFinal preprocessFileLineNumbers "scripts\server\remotecall\reinforcements_remote_call.sqf";
sector_liberated_remote_call = compileFinal preprocessFileLineNumbers "scripts\server\remotecall\sector_liberated_remote_call.sqf";
intel_remote_call 			= compileFinal preprocessFileLineNumbers "scripts\server\remotecall\intel_remote_call.sqf";
start_secondary_remote_call = compileFinal preprocessFileLineNumbers "scripts\server\remotecall\start_secondary_remote_call.sqf";

remote_call_sector 			= compileFinal preprocessFileLineNumbers "scripts\client\remotecall\remote_call_sector.sqf";
remote_call_fob 			= compileFinal preprocessFileLineNumbers "scripts\client\remotecall\remote_call_fob.sqf";
remote_call_battlegroup 	= compileFinal preprocessFileLineNumbers "scripts\client\remotecall\remote_call_battlegroup.sqf";
remote_call_switchmove 		= compileFinal preprocessFileLineNumbers "scripts\client\remotecall\remote_call_switchmove.sqf";
remote_call_ammo_bounty 	= compileFinal preprocessFileLineNumbers "scripts\client\remotecall\remote_call_ammo_bounty.sqf";
remote_call_intel 			= compileFinal preprocessFileLineNumbers "scripts\client\remotecall\remote_call_intel.sqf";
remote_call_incoming 		= compileFinal preprocessFileLineNumbers "scripts\client\remotecall\remote_call_incoming.sqf";

build_remote_call 			= compileFinal preprocessFileLineNumbers "scripts\server\remotecall\build_remote_call.sqf";
build_fob_remote_call 		= compileFinal preprocessFileLineNumbers "scripts\server\remotecall\build_fob_remote_call.sqf";
cancel_build_remote_call 	= compileFinal preprocessFileLineNumbers "scripts\server\remotecall\cancel_build_remote_call.sqf";
prisonner_remote_call 		= compileFinal preprocessFileLineNumbers "scripts\server\remotecall\prisonner_remote_call.sqf";
recycle_remote_call 		= compileFinal preprocessFileLineNumbers "scripts\server\remotecall\recycle_remote_call.sqf";
reinforcements_remote_call 	= compileFinal preprocessFileLineNumbers "scripts\server\remotecall\reinforcements_remote_call.sqf";
sector_liberated_remote_call = compileFinal preprocessFileLineNumbers "scripts\server\remotecall\sector_liberated_remote_call.sqf";
intel_remote_call 			= compileFinal preprocessFileLineNumbers "scripts\server\remotecall\intel_remote_call.sqf";
start_secondary_remote_call = compileFinal preprocessFileLineNumbers "scripts\server\remotecall\start_secondary_remote_call.sqf";

remote_call_sector 			= compileFinal preprocessFileLineNumbers "scripts\client\remotecall\remote_call_sector.sqf";
remote_call_fob 			= compileFinal preprocessFileLineNumbers "scripts\client\remotecall\remote_call_fob.sqf";
remote_call_battlegroup 	= compileFinal preprocessFileLineNumbers "scripts\client\remotecall\remote_call_battlegroup.sqf";
remote_call_switchmove 		= compileFinal preprocessFileLineNumbers "scripts\client\remotecall\remote_call_switchmove.sqf";
remote_call_ammo_bounty 	= compileFinal preprocessFileLineNumbers "scripts\client\remotecall\remote_call_ammo_bounty.sqf";
remote_call_intel 			= compileFinal preprocessFileLineNumbers "scripts\client\remotecall\remote_call_intel.sqf";
remote_call_incoming 		= compileFinal preprocessFileLineNumbers "scripts\client\remotecall\remote_call_incoming.sqf";

tf47_shared_loadLoadout	    = compileFinal preprocessFileLineNumbers "scripts\loadouts\loadLoadout.sqf";	
tf47_shared_saveLoadout	    = compileFinal preprocessFileLineNumbers "scripts\loadouts\saveplayerLoadoutToServer.sqf";


fob_hunting                 = compileFinal preprocessFileLineNumbers "scripts\server\secondary\fob_hunting.sqf";
convoy_hijack               = compileFinal preprocessFileLineNumbers "scripts\server\secondary\convoy_hijack.sqf";
search_and_rescue           = compileFinal preprocessFileLineNumbers "scripts\server\secondary\search_and_rescue.sqf";
TF47_SeaMines               = compileFinal preprocessFileLineNumbers "scripts\server\secondary\TF47_SeaMines.sqf";

