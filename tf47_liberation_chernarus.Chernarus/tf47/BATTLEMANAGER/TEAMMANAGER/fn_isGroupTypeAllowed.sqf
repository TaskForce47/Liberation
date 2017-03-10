params ["_config"];

private _tags		=	getArray (_config >> "tags");
private _permission	=	getText (_config >> "permission");
private _mods		=	getArray (_config >> "requiredAddons");

private _state  = true;

//first step needs to be the mod check
{
	if ( !(isClass (configFile >> "cfgpatches" >> _x	) ) )exitWith{_state = false};
}forEach _mods;

if (_state) then{
	{
		if !(_x in _tags)exitWith{_state = false};
	}forEach TF47_BATTLEMANAGER_FILTERTAGS;
};

if( _state )then{
	if(isClass (missionConfigFile >> "cfgFunctions" >> "TF47_CORE" >> "whitelisting")	)then{
		if !(_permission isEqualTo "NONE")then{
			_state = switch(_permission)do{
				case("AIR"):{	if(isnil "TF47_WHITELIST_AIR")then{true}else{TF47_PERMISSION_AIR} };
				case("ARMOR"):{ if(isnil "TF47_WHITELIST_ARMOR")then{true}else{TF47_PERMISSION_ARMOR} };
				case("JTFC"):{if(isnil "TF47_WHITELIST_JTFC")then{true}else{TF47_PERMISSION_JTFC} };
				default{false};
			};		
		};
	};
};
_state;