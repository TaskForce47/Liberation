private _UID = _this select 0;
private _rights = param [1, [true,false,false,false,true,true,false]];
if (isNil "_UID")exitWith{};
if (isNil "_rights") then {_rights = [true,false,false,false,true,true,false]; };


// Check rights
if (_UID in TF47_ArmoredBlacklist) then { _rights set [1, false]; };
if (_UID in TF47_HeliBlacklist) then { _rights set [2, false]; };
if (_UID in TF47_BuildBlacklist) then { _rights set [3, false]; };
if (_UID in TF47_FixedWingBlacklist) then { _rights set [6, false]; };

([getPlayerUID player]call TF47_GetPlayer) setVariable ["TF47_Permissions", _rights, true];

true
    