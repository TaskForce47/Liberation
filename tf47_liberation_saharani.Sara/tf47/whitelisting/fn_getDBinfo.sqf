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
		["1234567",0] call tf47_whitelist_fnc_getDBinfo;

*/
params[
  ["_obj",objNull],
  ["_listID",0]
];

if( _obj isEqualTo objNull )exitWith{ false };
if( _listID isEqualTo 0 )exitWith{ true };

private _dt = diag_tickTime;
private _val = "extDB3" callExtension format ["0:SQL:SELECT `playerid` FROM gadget_playerlist WHERE `listid` = '%1' AND playerid = '%2'", _listID, _uid];
waitUntil {!isNil "_val" || (diag_tickTime - _dt) > 5 };
if(isNil "_val")exitWith { false };

_val
