/*
TF47_PERMISSION_HELO
TF47_PERMISSION_PLANE
TF47_PERMISSION_ARMOUR
TF47_PERMISSION_BUILDER
TF47_PERMISSION_JTFC
*/
switch (typeOf player) do {
	case("B_Helipilot_F"):{
		if(!TF47_PERMISSION_HELO)then{endmission "notAuthorized"; };
		TF47_PERMISSION_PLANE	= false;
		TF47_PERMISSION_ARMOUR	= false;
		TF47_PERMISSION_BUILDER	= false;
		TF47_PERMISSION_JTFC	= false;
	};
	case("B_Pilot_F"):{
		if(!TF47_PERMISSION_PLANE)then{endmission "notAuthorized"; };
		TF47_PERMISSION_HELO	= false;
		TF47_PERMISSION_ARMOUR	= false;
		TF47_PERMISSION_BUILDER	= false;
		TF47_PERMISSION_JTFC	= false;
	};
	
	case("B_Engineer_F"):{
		TF47_PERMISSION_PLANE	= false;
		TF47_PERMISSION_HELO	= false;
		TF47_PERMISSION_ARMOUR	= false;
		TF47_PERMISSION_BUILDER	= false;
		TF47_PERMISSION_JTFC	= false;
		player setVariable ["ace_isengineer", 2, true];
	};
	
	case("B_Medic_F"):{
		TF47_PERMISSION_PLANE	= false;
		TF47_PERMISSION_HELO	= false;
		TF47_PERMISSION_ARMOUR	= false;
		TF47_PERMISSION_BUILDER	= false;
		TF47_PERMISSION_JTFC	= false;

		player setUnitTrait ["Medic", true];
		player setVariable ["Ace_medical_medicClass",  2, true];
	};
	case("B_Soldier_F"):{
		TF47_PERMISSION_PLANE	= false;
		TF47_PERMISSION_HELO	= false;
		TF47_PERMISSION_ARMOUR	= false;
		TF47_PERMISSION_BUILDER	= false;
		TF47_PERMISSION_JTFC	= false;
	};
	case("B_crew_F"):{
		if(!TF47_PERMISSION_ARMOUR)then{endmission "notAuthorized"; };
		TF47_PERMISSION_HELO	= false;
		TF47_PERMISSION_PLANE	= false;
		TF47_PERMISSION_BUILDER	= false;
		TF47_PERMISSION_JTFC	= false;
	};
	case("B_Soldier_SL_F"):{
		if(!TF47_PERMISSION_BUILDER)then{endmission "notAuthorized"; };
		TF47_PERMISSION_HELO	= false;
		TF47_PERMISSION_PLANE	= false;
		TF47_PERMISSION_ARMOUR	= false;
		TF47_PERMISSION_JTFC	= false;
	};
	case("B_Officer_F"):{
		if(!TF47_PERMISSION_JTFC)then{endmission "notAuthorized"; };
	};
	default{
		TF47_PERMISSION_PLANE	= false;
		TF47_PERMISSION_HELO	= false;
		TF47_PERMISSION_ARMOUR	= false;
		TF47_PERMISSION_BUILDER	= false;
		TF47_PERMISSION_JTFC	= false;
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