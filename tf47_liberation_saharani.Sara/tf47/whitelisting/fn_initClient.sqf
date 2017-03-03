/*

	author: TF47  mindbl4ster

	description:
		set tools for enforcing whitelist information and advanced tracking of interaction between client and vehicle

	parameter:
    nothing

	return
		bool - successflag

	example
		[] call tf47_whitelist_fnc_initClient;

*/

// init permissions - default nothing allowed
if(isNil "TF47_PERMISSION_BUILDER")then{ TF47_PERMISSION_BUILDER = false; };
if(isNil "TF47_PERMISSION_ARMOUR")then{ TF47_PERMISSION_ARMOUR = false; };
if(isNil "TF47_PERMISSION_PLANE")then{ TF47_PERMISSION_PLANE = false; };
if(isNil "TF47_PERMISSION_HELO")then{ TF47_PERMISSION_HELO = false; };
if(isNil "TF47_PERMISSION_JTFC")then{ TF47_PERMISSION_JTFC = false; };
if(isNil "tf47_whitelist_clientToServerPermissionRequest")then{tf47_whitelist_clientToServerPermissionRequest = [player, 0]; };

/*
  see if player is anything special and needs permission for playing that specialcharacter
  nothing 0
  helo 1
  jet 2
  tank 3
  builder 4
  jtfc 5
*/
private _specialState = player getVariable ["tf47_whitelist_specialCharacter",0];

/*
	translate specialstate to sql database listID
*/
tf47_whitelist_clientToServerPermissionRequest = switch (	_specialState )do {
	case(1):{ [player, 1] };
  case(2):{ [player, 1] };
  case(3):{ [player, 2] };
	default{ [player, 0] };
};
publicVariableServer "tf47_whitelist_clientToServerPermissionRequest";

"tf47_whitelist_serverToClientPermissionFeedback" addPublicVariableEventHandler {
  params ["","_vars"];
  _vars params [
		["_permission", false, [false] ]
	];
  private _specialState = player getVariable ["tf47_whitelist_specialCharacter",0];
	//set default values
	TF47_PERMISSION_BUILDER = false;
	TF47_PERMISSION_ARMOUR = false;
	TF47_PERMISSION_PLANE = false;
	TF47_PERMISSION_HELO = false;
	TF47_PERMISSION_JTFC = false;
	//apply DB entry
  switch (	_specialState )do {
  	case(1):{ TF47_PERMISSION_HELO = _permission; };
    case(2):{ TF47_PERMISSION_PLANE = _permission; };
    case(3):{ TF47_PERMISSION_ARMOUR = _permission; };
  	default{};
  };
	if (_specialState > 0 && !_permission)then{
		// player is not whitelisted for the use of this slot so end mission for him
		endmission "notAuthorized";
	};
};

player addEventHandler ["GetInMan",{
	params ["_unit","_pos","_veh","_turrent"];

	if(	( _veh getCargoIndex player ) < 0  &&
		isTouchingGround _veh &&
		!(_veh isKindOf "ParachuteBase")
	)then{
		private _doeject = false;
		switch (true) do {
			case( _veh  isKindOf "Tank"):{
				if ( ! TF47_PERMISSION_ARMOUR ) then {
					_doeject = true;
					hint localize "STR_PERMISSION_NO_ARMOR";
				};
			};
			case( _veh  isKindOf "Helicopter"):{
				if ( ! TF47_PERMISSION_HELO) then {
					_doeject = true;
					hint localize "STR_PERMISSION_NO_AIR";
				};
			};
			case( _veh  isKindOf "Plane"):{
				if ( ! TF47_PERMISSION_PLANE ) then {
					_doeject = true;
					hint localize "STR_PERMISSION_NO_AIR";
				};
			};
		};

		if ( _doeject ) then {
			moveOut player;
			_doeject = false;
		};

	};
}];
player addEventHandler ["SeatSwitchedMan",{
	params ["_unit","","_veh"];

	if(	( _veh getCargoIndex player ) < 0  &&
		isTouchingGround _veh &&
		!(_veh isKindOf "ParachuteBase")
	)then{
		private _doeject = false;
		switch (true) do {
			case( _veh  isKindOf "Tank"):{
				if ( ! TF47_PERMISSION_ARMOUR ) then {
					_doeject = true;
					hint localize "STR_PERMISSION_NO_ARMOR";
				};
			};
			case( _veh  isKindOf "Helicopter"):{
				if ( ! TF47_PERMISSION_HELO) then {
					_doeject = true;
					hint localize "STR_PERMISSION_NO_AIR";
				};
			};
			case( _veh  isKindOf "Plane"):{
				if ( ! TF47_PERMISSION_PLANE ) then {
					_doeject = true;
					hint localize "STR_PERMISSION_NO_AIR";
				};
			};
		};

		if ( _doeject ) then {
			moveOut player;
			_doeject = false;
		};

	};
}];
