params [ "_sector", "_radius", "_number" ];
private [ "_activation_radius_infantry", "_activation_radius_vehicles", "_spread", "_infantry_trigger", "_ultra_strong", "_vehicle_trigger", "_ied_type", "_ied_obj", "_roadobj", "_goes_boom"];

if ( _number <= 0 ) exitWith {};
if (  combat_readiness < 45) exitWith {};
_number = round _number;

_activation_radius_infantry = 6.66;
_activation_radius_vehicles = 10;

_spread = 7;
_infantry_trigger = 2 + (floor (random 3));
_ultra_strong = false;
if ( random 100 < 12 ) then {
	_ultra_strong = true;
};
_vehicle_trigger = 1;
_ied_type = selectRandom ["IEDLandBig_F", "IEDUrbanBig_F",  "IEDLandSmall_F", "IEDUrbanSmall_F"];
_ied_obj = objNull;
_roadobj = [[ getmarkerpos (_sector), random(_radius), (random(360))  ] call BIS_fnc_relPos, _radius, [] ] call BIS_fnc_nearestRoad;
_goes_boom = false;

if ( !(isnull _roadobj) ) then {
	_roadpos = getpos _roadobj;
	_ied_obj = createMine [ _ied_type, [ _roadpos, _spread, random(360) ] call BIS_fnc_relPos, [], 0];
	_ied_obj setdir (random 360);
	if ((typeOf _mine) in ["IEDLandSmall_F", "IEDUrbanSmall_F", "SatchelCharge_F", "DemoCharge_F"]) then{
		[
			{
				(!mineActive (_this select 0)) || 
				( ((getPos (_this select 0)) nearEntities [["Man", "LandVehicles"], 4]) select { (stance _x != "PRONE") && ((_this select 1) getFriend (side _x) < 0.6) })
			}, 
			
			{
				if (mineActive (_this select 0)) then { (_this select 0) setdamage 1; };
			},
			[_mine,  TF47_helper_opposingFaction]
		] call CBA_fnc_waitUntilAndExecute;
	};
	if ((typeOf _mine) in ["Claymore_F"]) then{
		[
			{
				(!mineActive (_this select 0)) || 
				( ((getPos (_this select 0)) nearEntities [["Man", "LandVehicles"], 7]) select { (stance _x != "PRONE") && ((_this select 1) getFriend (side _x) < 0.6)})
			}, 
			
			{
				if (mineActive (_this select 0)) then { (_this select 0) setdamage 1; };
			}, 
			[_mine,  TF47_helper_opposingFaction]
		] call CBA_fnc_waitUntilAndExecute;
	};
	if ((typeOf _mine) in ["IEDUrbanBig_F", "IEDUrbanSmall_F"]) then{
		[
			{
				(!mineActive (_this select 0)) || 
				(((getPos (_this select 0)) nearEntities [["LandVehicles"], 7]) select { (stance _x != "PRONE") && ((_this select 1) getFriend (side _x) < 0.6) })
			}, 
			
			{
				if (mineActive (_this select 0)) then { (_this select 0) setdamage 1; };
			}, 
			[_mine,  TF47_helper_opposingFaction]
		] call CBA_fnc_waitUntilAndExecute;
	};
	if ((typeOf _mine) in ["ATMine"]) then{
		[
			{
				(!mineActive (_this select 0)) || 
				( ((getPos (_this select 0)) nearEntities [["LandVehicles"], 1]) select {((_this select 1) getFriend (side _x) < 0.6) })
			}, 
			
			{
				if (mineActive (_this select 0) && (alive (_this select 2))) then { (_this select 0) setdamage 1; };
			}, 
			[_mine,  TF47_helper_opposingFaction]
		] call CBA_fnc_waitUntilAndExecute;
	};
	if ((typeOf _mine) in ["APERSBoundingMine", "APERSMine", "SLAMDirectionalMine"] ) then {
		[
			{
				(!mineActive (_this select 0)) || 
				(((getPos (_this select 0)) nearEntities [["Man", "LandVehicles"], 2.5]) select { (stance _x != "PRONE") && ((_this select 1) getFriend (side _x) < 0.6) })
			}, 
			
			{
				if (mineActive (_this select 0)) then {(_this select 0) setdamage 1;};
			}, 
			[_mine,  TF47_helper_opposingFaction]
		] call CBA_fnc_waitUntilAndExecute;
	};
};

if (_number > 0) then {
	[ _sector, _radius, _number - 1 ] call ied_manager;
};