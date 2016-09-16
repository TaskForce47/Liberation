_target = [_this select 0] call TF47_GetPlayer;
if (isNull _target)exitWith{};
{
	_reviveStartTime = player getVariable ["ace_medical_revivestarttime",0];
	player setVariable ["ace_medical_incardiacarrest", nil,true];
	player setVariable ["ace_medical_heartrate", 40];
	player setVariable ["ace_medical_bloodpressure", [50,70]];
	player setVariable ["ace_medical_revivestarttime", (_reviveStartTime + random(20)) min (CBA_missionTime + 1)];
} remoteExec ["bis_fnc_call", _target]; 
