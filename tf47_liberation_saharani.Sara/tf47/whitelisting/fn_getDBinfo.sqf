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
  ["_obj",objNull,[objNull,""]],
  ["_listID",0]
];

if( _obj isEqualTo objNull )exitWith{ false };

private _uid = if (_obj isEqualType objNull) then{
  if (isPlayer _obj) then{
    getPlayerUID _obj
  };
}else{
  if ( (_obj isEqualType "") && !(_obj isEqualTo "") ) then{
    if(_obj in ( allPlayers apply {getPlayerUID _x} ) )then{
      _obj
    }else{
      ""
    };
  }else{
    ""
  };
};
if (_uid isEqualTo "") exitWith { false };
if ( _listID <= 0 || _listID > 2 ) exitWith { true };

private _dt = diag_tickTime;
private _val = "extDB3" callExtension format ["0:SQL:SELECT `playerid` FROM gadget_playerlist WHERE `listid` = '%1' AND playerid = '%2'", _listID, _uid];
waitUntil {!isNil "_val" || (diag_tickTime - _dt) > 5 };

private _val = if( isNil "_val" )then{
  if( (diag_tickTime - _dt) > 5 )then{
    /* timedelay to high, perhaps no connection to db */
    true
  }else{
    false
  };
};
_val
