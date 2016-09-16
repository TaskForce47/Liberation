
if(isNil "TF47_HeliBlacklist")then{TF47_HeliBlacklist = []};
if(isNil "TF47_FixedWingBlacklist")then{TF47_FixedWingBlacklist = []};
if(isNil "TF47_ArmoredBlacklist")then{TF47_ArmoredBlacklist = []};
if(isNil "TF47_BuildBlacklist")then{TF47_BuildBlacklist = []};
"TF47_TL_Whitlelist" remoteExec ["publicVariable", 2];
"TF47_HeliBlacklist" remoteExec ["publicVariable", 2];
"TF47_FixedWingBlacklist" remoteExec ["publicVariable", 2];
"TF47_ArmoredBlacklist" remoteExec ["publicVariable", 2];
"TF47_BuildBlacklist" remoteExec ["publicVariable", 2];
/*
switch (typeOf player) do {
	case("rhs_pilot_combat_heli"):{
		if (((getPlayerUID player) in TF47_HeliBlacklist)) then {
			if (!isServer) then { endmission "LOSER";  };
		} else {
			[player, "eastpilotheli"]call BIS_fnc_addRespawnInventory;
		};
	};
	case("rhs_pilot_transport_heli"):{
		if (((getPlayerUID player) in TF47_HeliBlacklist)) then {
			if (!isServer) then { endmission "LOSER";  };
		} else {
			[player, "eastpilotcrew"]call BIS_fnc_addRespawnInventory;
		};
	};	
	case("rhs_pilot"):{
		if (((getPlayerUID player) in TF47_FixedWingBlacklist)) then {
			if (!isServer) then { endmission "LOSER";  };
		} else {
			[player, "eastpilotfixedwing"]call BIS_fnc_addRespawnInventory;
		};
	};
	case("rhs_vdv_engineer"):{
		[player, "westSpezilist"]call BIS_fnc_addRespawnInventory;
	};	
	case("rhs_vdv_medic"):{
		[player, "eastMedic"]call BIS_fnc_addRespawnInventory;
		player setUnitTrait ["Medic", true];
		player setVariable ["Ace_medical_medicClass",  2];
	};
	case("rhs_vdv_arifleman"):{
		[player, "eastsoldierMG"]call BIS_fnc_addRespawnInventory; 
	};
	case("rhs_vdv_marksman"):{
		[player, "eastdesignated"]call BIS_fnc_addRespawnInventory;
	};
	case("rhs_vdv_rifleman"):{
		[player, "eastsoldier"]call BIS_fnc_addRespawnInventory;
		[player, "eastSchuetzeGL"]call BIS_fnc_addRespawnInventory;
		[player, "eastSchuetzeAA"]call BIS_fnc_addRespawnInventory;
		[player, "eastSchuetzeAT"]call BIS_fnc_addRespawnInventory;
		[player, "eastSchuetzeATTitan"]call BIS_fnc_addRespawnInventory;
	};
	case("rhs_vdv_at"):{
		[player, "eastsoldier"]call BIS_fnc_addRespawnInventory;
		[player, "eastSchuetzeGL"]call BIS_fnc_addRespawnInventory;
		[player, "eastSchuetzeAA"]call BIS_fnc_addRespawnInventory;
		[player, "eastSchuetzeAT"]call BIS_fnc_addRespawnInventory;
		[player, "eastSchuetzeATTitan"]call BIS_fnc_addRespawnInventory;
	};
	case("rhs_vdv_armoredcrew"):{
		if (((getPlayerUID player) in TF47_ArmoredBlacklist)) then {
			if (!isServer) then { endmission "LOSER";  };
		} else {
			[player, "eastcrew"]call BIS_fnc_addRespawnInventory;
		};
	};
	case("rhs_vdv_sergeant"):{
		if (((getPlayerUID player) in TF47_TL_Whitlelist)) then {
			[player, "eastTeamlead"]call BIS_fnc_addRespawnInventory;
		} else {
			if (!isServer) then { endmission "LOSER";  };
		};
	};
	case("rhs_vdv_rifleman_lite"):{
			[player, "eastTeamlead"]call BIS_fnc_addRespawnInventory;
		};
	case("rhs_vdv_officer"):{
		if ( (getPlayerUID player) in TF47_TL_Whitlelist) then {
			[player, "eastTeamlead"]call BIS_fnc_addRespawnInventory;
		} else {
			if (!isServer) then { endmission "LOSER"; };
		};
	};
	case("rhs_vdv_rifleman_asval"):{
		[player, "eastSpotter"]call BIS_fnc_addRespawnInventory;
		[player, "eastSniper"]call BIS_fnc_addRespawnInventory;
	};
	default{
		[player, "westDiver"]call BIS_fnc_addRespawnInventory;
		[player, "eastsoldier"]call BIS_fnc_addRespawnInventory;
	};
};
[player, "eastsoldier"]call BIS_fnc_addRespawnInventory;
[player, "veryEmpty"]call BIS_fnc_addRespawnInventory;
[player, "westDiver"]call BIS_fnc_addRespawnInventory;

player addEventHandler ["Killed", {[_this select 0]call tf47_shared_saveLoadout;}];
player addEventHandler ["InventoryClosed", {[_this select 0]call tf47_shared_saveLoadout;}];
*/	