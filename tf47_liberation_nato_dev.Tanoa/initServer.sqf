MyPlacesAA = selectBestPlaces [[9981.85,9991.62,0], 10000, "((2 + 2* meadow) - (1 * forest - 0 * hills ))", 250, 30];  

if(isNil "TF47_Missionarray")then{ TF47_Missionarray = []; };
if(isNil "TF47_HeliBlacklist")then{TF47_HeliBlacklist = []};
if(isNil "TF47_FixedWingBlacklist")then{TF47_FixedWingBlacklist = []};
if(isNil "TF47_ArmoredBlacklist")then{TF47_ArmoredBlacklist = []};
if(isNil "TF47_BuildBlacklist")then{TF47_BuildBlacklist = []};
if (isNil "TF47_BUILDER_WHITELIST")then{
	TF47_BUILDER_WHITELIST =["76561197992256569","76561198002813252","76561197960489271","76561197963794597","76561198057152487","76561198093331206","76561198083598937","76561198043617179","76561198057808323","76561197991090099","76561198017253407","76561198060354231","76561197997340019","76561197997804176","76561198107147607","76561198075771437","76561198010638416","76561198026525307","76561198071872589","76561198043320125","76561198088566694","76561198070395053","76561197990703314","76561198122032581","76561198005476324","76561197996296785","76561197981809309","76561198023782694","76561198022749433","76561198135942291","76561197986395577"];
};
if (isNil "TF47_JTFC_WHITELIST")then{
	TF47_JTFC_WHITELIST =["76561197992256569","76561198002813252","76561197960489271","76561197963794597","76561198057152487","76561198093331206","76561198083598937","76561198043617179","76561198057808323","76561197991090099","76561198017253407","76561198060354231","76561197997340019","76561197997804176","76561198107147607","76561198075771437","76561198010638416","76561198026525307","76561198071872589","76561198043320125","76561198088566694","76561198070395053","76561197990703314","76561198122032581","76561198005476324","76561197996296785","76561197981809309","76561198023782694","76561198022749433","76561198135942291","76561197986395577"];
};
	
addMissionEventHandler ["EntityRespawned",{
	params["_newEntity","_oldEntity"];
	
	private _OID	=	owner _newEntity;
	private _UID	=	getPlayerUID _newEntity;
	
	if(	!(_UID in TF47_HeliBlacklist)		)then{		TF47_PERMISSION_HELO = true; 	}else{	TF47_PERMISSION_HELO = false;		};	_OID publicVariableClient "TF47_PERMISSION_HELO";
	if(	!(_UID in TF47_FixedWingBlacklist)	)then{		TF47_PERMISSION_PLANE = true; 	}else{	TF47_PERMISSION_PLANE = false; 		};	_OID publicVariableClient "TF47_PERMISSION_PLANE";
	if(	!(_UID in TF47_ArmoredBlacklist)	)then{		TF47_PERMISSION_ARMOUR = true; 	}else{	TF47_PERMISSION_ARMOUR = false; 	};	_OID publicVariableClient "TF47_PERMISSION_ARMOUR";
	if(	(_UID in TF47_BUILDER_WHITELIST)	)then{		TF47_PERMISSION_BUILDER = true; }else{	TF47_PERMISSION_BUILDER = false; 	};	_OID publicVariableClient "TF47_PERMISSION_BUILDER";
	if(	(_UID in TF47_BUILDER_WHITELIST)	)then{		TF47_PERMISSION_JTFC = true; 	}else{	TF47_PERMISSION_JTFC = false; 		};	_OID publicVariableClient "TF47_PERMISSION_JTFC";
	
}];
addMissionEventHandler ["PlayerConnected",{
	params["","_UID","","","_OID"];
	
	if(	!(_UID in TF47_HeliBlacklist)		)then{		TF47_PERMISSION_HELO = true; 	}else{	TF47_PERMISSION_HELO = false;		};	_OID publicVariableClient "TF47_PERMISSION_HELO";
	if(	!(_UID in TF47_FixedWingBlacklist)	)then{		TF47_PERMISSION_PLANE = true; 	}else{	TF47_PERMISSION_PLANE = false; 		};	_OID publicVariableClient "TF47_PERMISSION_PLANE";
	if(	!(_UID in TF47_ArmoredBlacklist)	)then{		TF47_PERMISSION_ARMOUR = true; 	}else{	TF47_PERMISSION_ARMOUR = false; 	};	_OID publicVariableClient "TF47_PERMISSION_ARMOUR";
	if(	(_UID in TF47_BUILDER_WHITELIST)	)then{		TF47_PERMISSION_BUILDER = true; }else{	TF47_PERMISSION_BUILDER = false; 	};	_OID publicVariableClient "TF47_PERMISSION_BUILDER";
	if(	(_UID in TF47_BUILDER_WHITELIST)	)then{		TF47_PERMISSION_JTFC = true; 	}else{	TF47_PERMISSION_JTFC = false; 		};	_OID publicVariableClient "TF47_PERMISSION_JTFC";
	
}];

addMissionEventHandler ["EntityKilled",{    if(    [TF47_helper_playerFaction,0] call BIS_fnc_respawnTickets == 0)then{    profileNamespace    setVariable ["GRLIB_save_key",nil]; saveProfileNamespace;	"missionFailed" call bis_fnc_endmissionServer;};}];
addMissionEventHandler ["HandleDisconnect",{     if ( (_this select 0) getVariable ["ace_isunconscious", false] )then{[TF47_helper_playerFaction,-1] call BIS_fnc_respawnTickets};    }];