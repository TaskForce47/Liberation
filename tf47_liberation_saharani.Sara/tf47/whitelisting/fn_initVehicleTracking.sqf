/*

	author: TF47  mindbl4ster

	description:
    init eventhandler to watch interactions with that vehicle serverside

	parameter:
    nothing

	return
		bool - successflag

	example
		[97,"lost mk18 found",""] call tf47_whitelist_fnc_reportToDatabase;

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
if ( _objectToWatch isKindOf ["camanbase", (configFile >> "cfgvehicles")] )exitWith{ /* getin EH on MEN ?! nooooope */ };

_objectToWatch addEventHandler ["GetIn",{
    params ["_vehicle","_position","_unit","_turrent"];
}];
_objectToWatch addEventHandler ["SeatSwitched",{
    params ["_vehicle","_seatOne","_seatTwo"];
    //assignedVehicleRole unitName
}];
_objectToWatch addEventHandler ["killed",{
    params ["_vehicle","_killer","_instigator"];
    //assignedVehicleRole unitName
}];
/*
 still stuff missing
*/
