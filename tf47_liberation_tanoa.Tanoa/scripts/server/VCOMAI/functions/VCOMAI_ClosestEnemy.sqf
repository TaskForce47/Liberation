private ["_Unit", "_UnitSide", "_Array1", "_ReturnedEnemy"];
//Created on ???
// Modified on : 8/19/14 - 8/3/15

_Unit = _this;
_UnitSide = (side _Unit);
_Array1 = [];
_Array1 = allUnits select {([_UnitSide, side _x] call BIS_fnc_sideIsEnemy) && {(!(captive _x)) && (side _x != civilian) &&  (!(_x getVariable ["ace_isunconscious", false]))}};

_ReturnedEnemy = [_Array1,_Unit] call VCOMAI_ClosestObject;
if (isNil "_ReturnedEnemy") then {_ReturnedEnemy = [0,0,0]};

//_Unit setVariable ["VCOM_CLOSESTENEMY",_ReturnedEnemy,false];
_ReturnedEnemy