if (VCOM_MineLayChance < (random 135)) exitWith {};


_Unit = _this select 0;
_MineType = _this select 1;
_MagazineName = _this select 2;
if ( _Unit getVariable ["ace_isunconscious", false] )exitWith{};
if ( captive _Unit ) exitWith {};
_Unit removeMagazine _MagazineName;

if (_MineType isEqualTo []) exitWith {};


//systemchat format ["I %1",_Unit];
_NearestEnemy = _Unit call VCOMAI_ClosestEnemy;
if (_NearestEnemy isEqualTo [] || {isNil "_NearestEnemy"}) exitWith {};

_mine = [];

if (_NearestEnemy distance _Unit < 200) then {
	_Unit playAction "PutDown";
	_mine = createMine [_MineType,getposATL _Unit, [], 0];
} else {
	_NearRoads = _Unit nearRoads 50;
	if (count _NearRoads > 0) then  {
		_ClosestRoad = [_NearRoads,_Unit] call VCOMAI_ClosestObject;
		_Unit doMove (getpos _ClosestRoad);
		waitUntil {!(alive _Unit) || _Unit distance _ClosestRoad < 6};
		_Unit playAction "PutDown";
		_mine = createMine [_MineType, getposATL _ClosestRoad, [], 0];
	} else {
		_Unit playAction "PutDown";
		_mine = createMine [_MineType, getposATL _Unit, [], 0];

	};
};

_UnitSide = (side _Unit);


if (_mine isEqualTo []) exitWith {};

if ((typeOf _mine) in ["IEDLandSmall_F", "IEDUrbanSmall_F", "SatchelCharge_F", "DemoCharge_F"]) then {
	[
		{
			(!mineActive (_this select 0)) || 
			( ((getPos (_this select 0)) nearEntities [["Man", "LandVehicles"], 4]) select { (stance _x != "PRONE") && ((_this select 1) getFriend (side _x) < 0.6) })
		}, 
		
		{
			if (mineActive (_this select 0) && (alive (_this select 2)) && (!(_this select 2) getVariable ["ace_isunconscious", false])) then { (_this select 0) setdamage 1; };
		}, 
		[_mine, _UnitSide, _Unit]
	] call CBA_fnc_waitUntilAndExecute;
};

if ((typeOf _mine) in ["Claymore_F"]) then {
	[
		{
			(!mineActive (_this select 0)) || 
			( ((getPos (_this select 0)) nearEntities [["Man", "LandVehicles"], 5]) select { (stance _x != "PRONE") && ((_this select 1) getFriend (side _x) < 0.6)})
		}, 
		
		{
			if (mineActive (_this select 0) && (alive (_this select 2)) && (!(_this select 2) getVariable ["ace_isunconscious", false])) then { (_this select 0) setdamage 1; };
		}, 
		[_mine, _UnitSide, _Unit]
	] call CBA_fnc_waitUntilAndExecute;
};

if ((typeOf _mine) in ["IEDUrbanBig_F", "IEDUrbanSmall_F"]) then {
	[
		{
			(!mineActive (_this select 0)) || 
			(((getPos (_this select 0)) nearEntities [["LandVehicles", "Man"], 5]) select { (stance _x != "PRONE") && ((_this select 1) getFriend (side _x) < 0.6) })
		}, 
		
		{
			if (mineActive (_this select 0)) then { (_this select 0) setdamage 1; };
		}, 
		[_mine, _UnitSide, _Unit]
	] call CBA_fnc_waitUntilAndExecute;
};

if ((typeOf _mine) in ["ATMine"]) then {
	[
		{
			(!mineActive (_this select 0)) || 
			( ((getPos (_this select 0)) nearEntities [["LandVehicles"], 1]) select {((_this select 1) getFriend (side _x) < 0.6) })
		}, 
		
		{
			if (mineActive (_this select 0) && (alive (_this select 2))) then { (_this select 0) setdamage 1; };
		}, 
		[_mine, _UnitSide, _Unit]
	] call CBA_fnc_waitUntilAndExecute;
};

if ((typeOf _mine) in ["APERSBoundingMine", "APERSMine", "SLAMDirectionalMine"] ) then {
	[
		{
			(!mineActive (_this select 0)) || 
			(((getPos (_this select 0)) nearEntities [["Man", "LandVehicles"], 2]) select { (stance _x != "PRONE") && ((_this select 1) getFriend (side _x) < 0.6) })
		}, 
		
		{
			if (mineActive (_this select 0)) then {(_this select 0) setdamage 1;};
		}, 
		[_mine, _UnitSide, _Unit]
	] call CBA_fnc_waitUntilAndExecute;
};