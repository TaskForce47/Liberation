params [ "_source", "_permission" ];
private [ "_uidvar", "_ret" ];
_ret = false;

if (isNil "_source")exitWith{false};
if (isNil "_permission")exitWith{false};
_ret = ( _source getVariable ["TF47_Permissions", [true, false, false, false, true, true, false]] ) select _permission;

if ((typeName _ret) != "BOOL") then {_ret = [true, false, false, false, true, true, false] select _permission; }; 
_ret