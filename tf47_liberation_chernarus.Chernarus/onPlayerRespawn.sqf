// ... server is too slow so we need to wait for him
TF47_PERMISSION_INIT = false;
waitUntil{TF47_PERMISSION_INIT};
{ _x enableChannel [false,false]; } foreach [0,1,2,3];
switch (	toLower (typeOf player) )do {
	case("b_helipilot_f"):{
		if(!TF47_PERMISSION_HELO)then{endmission "notAuthorized"; };
		TF47_PERMISSION_PLANE	= false;
		TF47_PERMISSION_ARMOUR	= false;
		TF47_PERMISSION_BUILDER	= false;
		TF47_PERMISSION_JTFC	= false;
	};
	case("b_pilot_f"):{
		if(!TF47_PERMISSION_PLANE)then{endmission "notAuthorized"; };
		TF47_PERMISSION_HELO	= false;
		TF47_PERMISSION_ARMOUR	= false;
		TF47_PERMISSION_BUILDER	= false;
		TF47_PERMISSION_JTFC	= false;
	};	
	case("b_engineer_f"):{
		TF47_PERMISSION_PLANE	= false;
		TF47_PERMISSION_HELO	= false;
		TF47_PERMISSION_ARMOUR	= false;
		TF47_PERMISSION_BUILDER	= false;
		TF47_PERMISSION_JTFC	= false;
		player setVariable ["ace_isengineer", 2, true];
	};
	case("b_medic_f"):{
		TF47_PERMISSION_PLANE	= false;
		TF47_PERMISSION_HELO	= false;
		TF47_PERMISSION_ARMOUR	= false;
		TF47_PERMISSION_BUILDER	= false;
		TF47_PERMISSION_JTFC	= false;

		player setUnitTrait ["Medic", true];
		player setVariable ["Ace_medical_medicClass",  2, true];
	};
	case("b_soldier_f"):{
		TF47_PERMISSION_PLANE	= false;
		TF47_PERMISSION_HELO	= false;
		TF47_PERMISSION_ARMOUR	= false;
		TF47_PERMISSION_BUILDER	= false;
		TF47_PERMISSION_JTFC	= false;
	};
	case("b_crew_f"):{
		if(!TF47_PERMISSION_ARMOUR)then{endmission "notAuthorized"; };
		TF47_PERMISSION_HELO	= false;
		TF47_PERMISSION_PLANE	= false;
		TF47_PERMISSION_BUILDER	= false;
		TF47_PERMISSION_JTFC	= false;
	};
	case("b_soldier_sl_f"):{
		if(!TF47_PERMISSION_BUILDER)then{endmission "notAuthorized"; };
		TF47_PERMISSION_HELO	= false;
		TF47_PERMISSION_PLANE	= false;
		TF47_PERMISSION_ARMOUR	= false;
		TF47_PERMISSION_JTFC	= false;
		{ _x enableChannel [false,false]; } foreach [0,2,3];
	};
	case("b_officer_f"):{
		if(!TF47_PERMISSION_JTFC)then{endmission "notAuthorized"; };
		{ _x enableChannel [false,false]; } foreach [0,2,3];
	};
	default{
		TF47_PERMISSION_PLANE	= false;
		TF47_PERMISSION_HELO	= false;
		TF47_PERMISSION_ARMOUR	= false;
		TF47_PERMISSION_BUILDER	= false;
		TF47_PERMISSION_JTFC	= false;
		
	};
};

_oldunit = _this select 1;
if (!isNil "_oldunit") then {
	if (!isNull _oldunit && (str ([(getPos _oldunit)] call F_getNearestFob)) != str []) then {
		if ( (_oldunit distance2D ([(getPos _oldunit)] call F_getNearestFob) ) < 200 ) then {
			deleteVehicle _oldunit;	
		};
	};
};