/*
_textsafe = format [ ((format ["TF47_Inventory_Liberation_on_%1",  worldName])),  0];
if ((typeName (profileNamespace getVariable [_textsafe,  0]) == "Array") && ((count(profileNamespace getVariable [_textsafe,  []]) > 0))) then {
	[player]call tf47_shared_loadLoadout;
};
*/

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
/*
_target = getPlayerUID player;
private _condition_wakeup = { ( ([(_this select 0)]call ACE_medical_fnc_isInStableCondition) && (((_this select 0) getVariable ["ace_medical_bloodvolume", 100]) > 60) && (((_this select 0) getVariable ["ace_medical_heartrate", 75]) > 20) && ((_this select 0) getVariable ["ace_isunconscious", false])) };
private _statement_wakeup = { [getPlayerUID (_this select 0)]call TF47_fnc_WakeUp; };
_action_TF47_wakeup = ["TF47_medical_wakeup", "Wake Up", "", _statement_wakeup, _condition_wakeup, {}, [], _target, 2] call ace_interact_menu_fnc_createAction;


private _condition_CPR = { (([(_this select 0)]call ACE_medical_fnc_isInStableCondition) && (((_this select 0) getVariable ["ace_medical_bloodvolume", 100]) > 55) && ((_this select 0) getVariable ["ace_isunconscious", false]) && ((_this select 0) getVariable ["ace_medical_inCardiacArrest", false]))  };
private _statement_CPR = { [getPlayerUID (_this select 0)]call TF47_fnc_CPR; };
_action_TF47_CPR = ["TF47_medical_own_CPR", "TF47 CPR", "", _statement_CPR, _condition_CPR, {}, [], _target, 2] call ace_interact_menu_fnc_createAction;

{
	[ _x, 0, [ "ACE_MainActions" ], _action_TF47_wakeup ]call ace_interact_menu_fnc_addActionToClass;
	[ _x, 0, [ "ACE_MainActions" ], _action_TF47_CPR ]call ace_interact_menu_fnc_addActionToClass;
} foreach [ "rhs_pilot_combat_heli", "rhs_pilot_transport_heli", "rhs_pilot", "rhs_vdv_engineer", "rhs_vdv_medic", "rhs_vdv_arifleman", "rhs_vdv_marksman", "rhs_vdv_rifleman", "rhs_vdv_at", "rhs_vdv_armoredcrew", "rhs_vdv_sergeant", "rhs_vdv_rifleman_lite", "rhs_vdv_officer", "rhs_vdv_rifleman_asval"];





/* ACE MEDICAL SHIT */


_oldunit = _this select 1;
if (!isNil "_oldunit") then {
	if (!isNull _oldunit && (str ([(getPos _oldunit)] call F_getNearestFob)) != str []) then {
		if ( (_oldunit distance2D ([(getPos _oldunit)] call F_getNearestFob) ) < 200 ) then {
			deleteVehicle _oldunit;	
		};
	};
};