/*

	author: TF47  mindbl4ster

	description:
		set tools for enforcing whitelist information and advanced tracking of interaction between client and vehicle
    listid = 1 für air
    listid = 2 für tanks
    _query = format ["SELECT `playerid` FROM gadget_playerlist WHERE `listid` = '%1' AND playerid = '%2'", _listID, _playerId];
    _res = "extDB3" callExtension format ["0:SQL:%1", _query];
	parameter:
    nothing

	return
		bool - successflag

	example
		[] call tf47_whitelist_fnc_initServer;

*/
#include "..\tf47_macros.hpp"
if(isNil "TF47_PERMISSION_INIT")then{ TF47_PERMISSION_INIT = false; };
if(isNil "TF47_PERMISSION_BUILDER")then{ TF47_PERMISSION_BUILDER = false; };
if(isNil "TF47_PERMISSION_ARMOUR")then{ TF47_PERMISSION_ARMOUR = false; };
if(isNil "TF47_PERMISSION_PLANE")then{ TF47_PERMISSION_PLANE = false; };
if(isNil "TF47_PERMISSION_HELO")then{ TF47_PERMISSION_HELO = false; };
if(isNil "TF47_PERMISSION_JTFC")then{ TF47_PERMISSION_JTFC = false; };

TF47_PERMISSION_SERVER_STACK = [];

"extDB3" callExtension "9:ADD_DATABASE:Database";
"extDB3" callExtension "9:ADD_DATABASE_PROTOCOL:Database:SQL:SQL:TEXT-NULL";
"extDB3" callExtension "9:LOCK";

"tf47_whitelist_clientToServerPermissionRequest" addPublicVariableEventHandler {
  params ["","_vars"];
  _vars params [
    ["_obj", objNull, ["",objnull] ],
    ["_permissionID", 0, [0]]
  ];

  DTRACE_3("[ INFO ] > 'Whitelist' > Request information for: ",_obj,_permissionID);

  if(_obj isEqualType "")then{
    private _uid = allplayers apply {getPlayerUID _x};
    private _ind = _obj find _uid;
    if (_ind < 0)exitWith{
      DTRACE_2("[ ERROR ] > 'Whitelist' > Player UID expected! ",_obj);
    };
    _obj = allPlayers select _ind;
  };
  if !(isPlayer _obj) exitWith{
    DTRACE_2("[ ERROR ] > 'Whitelist' > Player Object expected! ",_obj);
  };

  [_obj, _permissionID] spawn tf47_whitelist_fnc_getDBinfo;
};

"tf47_whitelist_registerVehicle" addPublicVariableEventHandler {
  params ["","_vars"];
  _vars call tf47_whitelist_fnc_initVehicleTracking;
};

addMissionEventHandler ["HandleDisconnect",{
	params ["_unit","_id","_uid","_name"];
  if ( _unit getVariable ["ace_isunconscious", false] )then{
    [TF47_helper_playerFaction,-1] call BIS_fnc_respawnTickets;
    [5, "",_uid] call tf47_whitelist_fnc_reportToDatabase;
  };
}];

waitUntil {!isnil "save_is_loaded"};
[1,"[ INFO ] Mission: Task Force 47 Liberation",""] call tf47_whitelist_fnc_reportToDatabase;
