private [ "_bluforcount, _ratio" ];

_ratio = 1.0;

if ( GRLIB_adaptive_opfor ) then {

	_bluforcount = count (allPlayers - entities "headlessclient_f");

	_ratio = 1/(1+ exp(0.2*(10-_bluforcount)));

};

_ratio