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
private _return = false;
private _error = false;

private _uid = "";
if (_obj isEqualType objNull) then{
  if (isPlayer _obj) then{
    _uid = getPlayerUID _obj;
  }else{
    _error  = true;
    diag_log format ["%1 %2","[ ERROR ] > 'Whitelist' > Invalid permission datatype for object ",_obj];
  };
};
if (_obj isEqualType "")then{
  private _uids = allPlayers apply {getPlayerUID _x};
  private _ind = _obj find _uids;
  if(_ind >= 0)then{
    _uid = _obj;
    _obj = allplayers select _ind;
  }else{
    _error = true;
    diag_log format ["%1 %2","[ ERROR ] > 'Whitelist' > Invalid permission datatype for UID ",_obj];
  };
};

if  ( _listID <= 0 || _listID > 2 )then{
  _error = true;
  diag_log format ["%1 %2","[ ERROR ] > 'Whitelist' > Invalid permissionID for ",_obj];
};

if (!_error) then{
  private _dt = diag_tickTime;
  private _val = "extDB3" callExtension format ["0:SQL:SELECT `playerid` FROM gadget_playerlist WHERE `listid` = '%1' AND playerid = '%2'", _listID, _uid];

  //needed with sync db call ?!
  waitUntil {!isNil "_val" || (diag_tickTime - _dt) > 5 };

  _return = if( isNil "_val" )then{
    if( (diag_tickTime - _dt) > 5 )then{
      /* timedelay to high, perhaps no connection to db */
      diag_log format["%1 %2 %3","[ ERROR ] > 'Whitelist' > DB TIMEOUT FOR: ",_obj,_uid];
      true
    };
  }else{
    if ( ( (call compile _val) select 1  select 0  select 0) isEqualTo _uid)then{
      true
    }else{
      false
    };
  };

};

private _stack = [_obj, _listID, _return];
diag_log format["%1 %2","[ INFO ] > 'Whitelist' > Pushback stack to process: ",_stack];
TF47_PERMISSION_SERVER_STACK pushback _stack;

[] spawn tf47_whitelist_fnc_processStack;

_return
