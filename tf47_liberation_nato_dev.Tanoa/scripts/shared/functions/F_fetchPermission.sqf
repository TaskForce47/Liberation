params [ "_source", "_permission" ];
private [ "_uidvar", "_ret" ];
_ret = false;

if (isNil "_source")exitWith{false};
if (isNil "_permission")exitWith{false};

private _rights = [
		true,	//light vehicles
		TF47_PERMISSION_ARMOUR,	// armored veh
		TF47_PERMISSION_HELO,	// helicopter
		TF47_PERMISSION_BUILDER,	// builder
		true,	// recycle
		true,	// Misc
		TF47_PERMISSION_PLANE	// jets
	]; 

_ret = _rights select _permission;

if ((typeName _ret) != "BOOL") then {_ret = [true, false, false, false, true, true, false] select _permission; }; 
_ret