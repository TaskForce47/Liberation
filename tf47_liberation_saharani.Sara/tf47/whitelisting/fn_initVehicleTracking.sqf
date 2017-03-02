/*

	author: TF47  mindbl4ster

	description:
    init eventhandler to watch interactions with that vehicle serverside

	parameter:
    nothing

	return
		bool - successflag

	example
		[player,_vehicle] call tf47_whitelist_fnc_initVehicleTracking;

*/
if !isServer exitWith { /* client does not need to track vehicles */ };
params [
  ["_builder", objNull, ["",objnull] ],
  ["_objectToWatch", objNull]
];
if (_builder isEqualTo objNull)then{
   _builder = if(isPlayer _builder)then{ getPlayerUID _builder }else{ "" };
};
if !( _objectToWatch isEqualType objNull )exitWith{ /* debugging stuff here */ };
if !( _objectToWatch isEqualTo objNull )exitWith{ /* debugging stuff here */ };
if ( (typeOf _objectToWatch) isKindOf ["CAManBase", (configFile >> "cfgvehicles")] )exitWith{ /* getin EH on MEN ?! nooooope */ };

_objectToWatch setVariable ["TF47_WHITELIST_LASTDRIVER", ["",""] ];// should uid be posted public? any privacy or safty issues?

_objectToWatch addEventHandler ["GetIn",{
    params ["_vehicle","_position","_unit","_turrent"];
    if (isPlayer _unit) then {
      if (_position isEqualTo "Driver")then{
        _vehicle setVariable ["TF47_WHITELIST_LASTDRIVER", [getPlayerUID _unit, name _unit] ];
      };
    };
}];
_objectToWatch addEventHandler ["SeatSwitched",{
    params ["_vehicle","_seatOne","_seatTwo"];

    private _unit = if (_seatOne isEqualTo objNull) then { _seatTwo }else{ _seatOne };

    if (isPlayer _unit) then {
      (assignedVehicleRole _unit) params ["_newSeat",""];
      if ( _newSeat isEqualTo "Driver")then{
        _vehicle setVariable ["TF47_WHITELIST_LASTDRIVER", [getPlayerUID _unit, name _unit] ];
      };
    };
  }];
_objectToWatch addEventHandler ["killed",{
    params ["_vehicle","_killer","_instigator"];

    ( _vehicle getVariable ["TF47_WHITELIST_LASTDRIVER", ["",""] ] ) params ["_uid","_name"];
    //private _player = format ["%1 (%2)", _name, _uid];
    private _comment = format ["%1 wurde zerstoert", typeof _vehicle];
    [4, _comment, _name] call tf47_whitelist_fnc_reportToDatabase;
}];
/*
 still stuff missing?
*/
