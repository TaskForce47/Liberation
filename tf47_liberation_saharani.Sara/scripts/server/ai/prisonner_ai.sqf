params [ "_unit" ];
if ( _unit getVariable ["ace_isunconscious", false] ) exitWith {
	if (ceil random 5 == 5) then {
		if (isServer) then {
			_intelobject = (selectRandom [GRLIB_intel_laptop, GRLIB_intel_file]) createVehicle (getPos _unit);
			_intelobject setPosATL [(getPos _unit) select 0, (getPos _unit) select 1, ((getPos _unit) select 2) + 0.25];

		};
	};
	_unit setDamage 1;
};
if (GRLIB_surrender_chance < 20) then { GRLIB_surrender_chance = 50; };
if ( ( random 100 ) > GRLIB_surrender_chance ) exitWith {};
if ( (_unit isKindOf "Man") && (side _unit != TF47_helper_playerFaction) && (side _unit != civilian)) then {
	if ( alive _unit ) then {
		_resultprimary = [_unit, primaryWeapon _unit]call CBA_fnc_dropWeapon;
		_resultsecond = [_unit,  secondaryWeapon _unit]call CBA_fnc_dropWeapon;
		_resulthandgun = [_unit, handgunWeapon _unit]call CBA_fnc_dropWeapon;
		[_unit, true] call ACE_captives_fnc_setSurrendered;
		_unit setCaptive true;
	};
};