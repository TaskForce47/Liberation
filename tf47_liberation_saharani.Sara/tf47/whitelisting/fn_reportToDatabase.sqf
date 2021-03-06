/*

	author: TF47  mindbl4ster

	description:
    send information of ingame state changes to database

	parameter:
    nothing

	return
		bool - successflag

	example
		[97,"lost mk18 found",""] call tf47_whitelist_fnc_reportToDatabase;

  comment:
  _action: action
    1: init,
    2: added,
    3: used,
    4: vehlost,
    5: inflost,
    6: civilost,
    7: desertion,
    8: adminadd,
    9: adminsub,
    10: adminreset,
    95: vehspawn,
    96: vehrespawn,
    97: logging,
    98: mission lost,
    99: mission success

*/
#include "..\tf47_macros.hpp"
if !isServer exitWith { /* client does not need to do that */ };

params [
  ["_action",0,[0,""]], //string
  ["_comment",""],
  ["_playerID","",[objNull,""]]
];

// CAUTION: datatype change from optional input to needed input!
if(_action isEqualType "")then{
  _action = switch (tolower _action) do {
    case("init"):{1};
    case("add"):{2};
    case("used"):{3};
    case("vehiclelost"):{4};
    case("inflost"):{5};
    case("civlost"):{6};
    case("desertion"):{7};
    case("adminadd"):{8};
    case("adminsub"):{9};
    case("adminreset"):{10};
    case("vehspawn"):{95};
    case("vehrespawn"):{96};
    case("logging"):{97};
    case("missionlost"):{98};
    case("missionwon"):{99};
    default{0};
  };
};

if(_action == 0)exitWith{
  DTRACE_1("[ ERROR ] > 'Database' > Invalid database action requested!");
};

if(_playerid isEqualType ObjNull)then{
    _playerid = getPlayerUID _playerid;
};
if(_playerid isEqualTo "")then{
  DTRACE_1("[ INFO ] > 'Database' > No player information passed");
};

// set some deprecated vars for compability reasons
private _tickets = [TF47_helper_playerFaction,0] call BIS_fnc_respawnTickets; // any changes should happen befor calling this function
if (_tickets < 0)then{_tickets = 0}; // in case respawntickets are not used
private _dbChange = 0;
private _missionID = 1; // use something else

private _query = format [
  "INSERT INTO gadget_ticketlog (`missionid`, `timestamp`, `action`, `change`, `count`, `arma2uid`, `comment`) VALUES ( '%1', UNIX_TIMESTAMP(), '%2', '%3', '%4', '%5', '%6')",
  _missionID,
  _action,
  _dbchange,
  _tickets,
  _playerid,
  _comment
];

//DTRACE_2("[ INFO ] > 'Database' > Query: ",_query);
"extDB3" callExtension format ["1:SQL:%1", _query];

true
