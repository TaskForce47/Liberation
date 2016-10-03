private [ "_bluforcount, _ratio" ];

_ratio = 1.0;

if ( GRLIB_adaptive_opfor ) then {

	_bluforcount = (count allPlayers);

	_ratio = 1/(1+ exp(0.3*(5-_bluforcount)));

};

_ratio