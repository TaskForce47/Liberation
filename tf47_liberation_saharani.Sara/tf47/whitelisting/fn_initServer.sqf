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
  _vars params [ ["_obj",objNull], ["_permissionID",0] ];
  if !(isPlayer _obj) exitWith{};
  private _val = [_obj, _permissionID] call tf47_whitelist_fnc_getDBinfo;

  TF47_PERMISSION_SERVER_STACK pushback [_obj, _permissionID, _val];

  [] spawn tf47_whitelist_fnc_processStack;

};
[1,"[ INFO ] Mission: Task Force 47 Liberation",""] call tf47_whitelist_fnc_reportToDatabase;
