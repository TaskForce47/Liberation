if(isNil "TF47_HeliBlacklist")then{TF47_HeliBlacklist = []};
if(isNil "TF47_FixedWingBlacklist")then{TF47_FixedWingBlacklist = []};
if(isNil "TF47_ArmoredBlacklist")then{TF47_ArmoredBlacklist = []};
if(isNil "TF47_BuildBlacklist")then{TF47_BuildBlacklist = []};
"TF47_TL_Whitlelist" remoteExec ["publicVariable", 2];
"TF47_HeliBlacklist" remoteExec ["publicVariable", 2];
"TF47_FixedWingBlacklist" remoteExec ["publicVariable", 2];
"TF47_ArmoredBlacklist" remoteExec ["publicVariable", 2];
"TF47_BuildBlacklist" remoteExec ["publicVariable", 2];
switch(typeOf player)do{
	default{
		[player, "riflemanUSMC"]call BIS_fnc_addRespawnInventory;
	};
};
	