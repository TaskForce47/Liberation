/*
_textsafe = format [ ((format ["TF47_Inventory_Liberation_on_%1",  worldName])),  0];
if ((typeName (profileNamespace getVariable [_textsafe,  0]) == "Array") && ((count(profileNamespace getVariable [_textsafe,  []]) > 0))) then {
	[player]call tf47_shared_loadLoadout;
};
*/
if(isNil "TF47_HeliBlacklist")then{
	TF47_HeliBlacklist = [];
	"TF47_HeliBlacklist" remoteExec ["publicVariable", 2];
};
if(isNil "TF47_FixedWingBlacklist")then{
	TF47_FixedWingBlacklist = [];
	"TF47_FixedWingBlacklist" remoteExec ["publicVariable", 2];
};
if(isNil "TF47_ArmoredBlacklist")then{
	TF47_ArmoredBlacklist = [];
	"TF47_ArmoredBlacklist" remoteExec ["publicVariable", 2];
};
if(isNil "TF47_BuildBlacklist")then{
	TF47_BuildBlacklist = [];
	"TF47_BuildBlacklist" remoteExec ["publicVariable", 2];
};
"TF47_TL_Whitlelist" remoteExec ["publicVariable", 2];

switch (typeOf player) do {
	case("B_Helipilot_F"):{
		[getPlayerUID player,  [true, false, true, false, true, true, false]]call TF47_setPermission;
	};
	case("B_Pilot_F"):{
		[getPlayerUID player,  [true, false, false, false, true, true, true]]call TF47_setPermission;
	};
	
	case("B_Engineer_F"):{
		[getPlayerUID player,  [true, false, false, false, true, true, false]]call TF47_setPermission;
		player setVariable ["ace_isengineer", 2, true];
	};
	
	case("B_Medic_F"):{
		[getPlayerUID player,  [true, false, false, false, true, true, false]]call TF47_setPermission;
		player setUnitTrait ["Medic", true];
		player setVariable ["Ace_medical_medicClass",  2, true];
	};
	case("B_Soldier_F"):{
		[getPlayerUID player,  [true, false, false, false, true, true, false]]call TF47_setPermission;
	};
	case("B_crew_F"):{
		[getPlayerUID player,  [true, true, false, false, true, true,  false]]call TF47_setPermission;
	};
	case("B_Soldier_SL_F"):{
		if ( (getPlayerUID player) in TF47_TL_Whitlelist ) then {
			[getPlayerUID player,  [true, false, false, true, true, true, false]]call TF47_setPermission;
		} else {
			if (!isServer) then { endmission "LOSER";  };
		};
	};

	case("B_Officer_F"):{
		if ( (getPlayerUID player) in TF47_TL_Whitlelist ) then {
			[getPlayerUID player,  [true, false, false, true, true, true, false]]call TF47_setPermission;
		} else {
			if (!isServer) then { endmission "LOSER";  };
		};
	};

	default{
		[getPlayerUID player,  [true, false, false, false, true, true, false]]call TF47_setPermission;
	};
};

/* ACE MEDICAL SHIT */


_oldunit = _this select 1;
if (!isNil "_oldunit") then {
	if (!isNull _oldunit && (str ([(getPos _oldunit)] call F_getNearestFob)) != str []) then {
		if ( (_oldunit distance2D ([(getPos _oldunit)] call F_getNearestFob) ) < 200 ) then {
			deleteVehicle _oldunit;	
		};
	};
};