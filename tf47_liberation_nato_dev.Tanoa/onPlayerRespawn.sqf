switch (typeOf player) do {
	case("B_Helipilot_F"):{
		[getPlayerUID player,  [true, false, TF47_PERMISSION_HELO, false, true, true, false]]call TF47_setPermission;
	};
	case("B_Pilot_F"):{
		[getPlayerUID player,  [true, false, false, false, true, true, TF47_PERMISSION_PLANE]]call TF47_setPermission;
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
		[getPlayerUID player,  [true, TF47_PERMISSION_ARMOUR, false, false, true, true,  false]]call TF47_setPermission;
	};
	case("B_Soldier_SL_F"):{
		if ( TF47_PERMISSION_BUILDER	) then {
			[getPlayerUID player,  [true, false, false, true, true, true, false]]call TF47_setPermission;
		} else {
			if (!isServer) then { endmission "notAuthorized";  };
		};
	};

	case("B_Officer_F"):{
		if ( TF47_PERMISSION_BUILDER	&&	TF47_PERMISSION_JTFC) then {
			[getPlayerUID player,  [true, false, false, true, true, true, false]]call TF47_setPermission;
		} else {
			if (!isServer) then { endmission "notAuthorized";  };
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