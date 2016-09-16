MyPlacesAA = selectBestPlaces [[9981.85,9991.62,0], 10000, "((2 + 2* meadow) - (1 * forest - 0 * hills ))", 250, 30];  

TF47_Missionarray = [];
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

addMissionEventHandler ["Ended",{    if(    [EAST,0] call BIS_fnc_respawnTickets == 0)then{    profileNamespace    setVariable ["GREUH_LIBERATION_SAVEGAME_TANOA_RHS_Russia_v1",nil]};}];
addMissionEventHandler ["HandleDisconnect",{     if ( (_this select 0) getVariable ["ace_isunconscious", false] )then{[EAST,-1] call BIS_fnc_respawnTickets};    }];