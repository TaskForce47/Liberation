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
#include "..\tf47_macros.hpp"
if !isServer exitWith { /* client does not need to track vehicles */ };
params [
  ["_builder", objNull, ["",objnull] ],
  ["_objectToWatch", objNull]
];

if !( _objectToWatch isEqualType objNull )exitWith{
  DTRACE_2("[ ERROR ] > 'VehicleTracking' > Given object is not type object ",_objectToWatch);
};
if ( _objectToWatch isEqualTo objNull )exitWith{
  DTRACE_2("[ ERROR ] > 'VehicleTracking' > Given object is no object ",_objectToWatch);
};
if ( (typeOf _objectToWatch) isKindOf ["CAManBase", (configFile >> "cfgvehicles")] )exitWith{
  DTRACE_2("[ ERROR ] > 'VehicleTracking' > Given object is kind of man ",_objectToWatch);
};
private _displayname = getText (configfile >> "cfgVehicles" >> (typeOf _objectToWatch) >> "displayname");
DTRACE_2("[ OK ] > 'VehicleTracking' > Starting to trace interactions with object: ",_objectToWatch);

if (_builder isEqualTo objNull)then{
   _builder = if(isPlayer _builder)then{ name _builder }else{ "" };
};
if !(_builder isEqualTo "") then{
  [95,_displayname,_builder] call tf47_whitelist_fnc_reportToDatabase;
};

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
    private _displayname = getText (configfile >> "cfgVehicles" >> (typeOf _vehicle) >> "displayname");
    private _comment = format ["%1 wurde zerstoert", _displayname];
    [4, _comment, _uid] call tf47_whitelist_fnc_reportToDatabase;
}];

true
