private _uid = _this select 0;
if (isNil "_uid")exitWith{};
private _ret = objNull;
{
	if (getPlayerUID _x == _uid) then {
		_ret = _x;
	};
} foreach allPlayers - entities "HeadlessClient_F";

_ret