private [ "_commanderobj" ];

_commanderobj = objNull;

{ if ( (typeOf _x == commander_classname) && ((getPlayerUID _x) in TF47_BUILDER_WHITELIST) ) exitWith { _commanderobj = _x }; } foreach allPlayers;

_commanderobj