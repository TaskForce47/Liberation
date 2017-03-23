
_target = [_this select 0] call TF47_GetPlayer;
if (isNull _target)exitWith{};
{
	_reviveStartTime = player getVariable ["ace_medical_revivestarttime",0];
	player setVariable ["ace_isunconscious",false, true];
	player setVariable ["ace_medical_revivestarttime", (_reviveStartTime + random(20)) min CBA_missionTime];
} remoteExec ["bis_fnc_call", _target]; 
