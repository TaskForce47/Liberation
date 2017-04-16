private [ "_bluforcount, _ratio" ];

_ratio = 1.0;

if ( GRLIB_adaptive_opfor ) then {

	_bluforcount = count (allPlayers - entities "headlessclient_f");

	_ratio = if(_bluforcount < 4)then{ 0.2 };
	_ratio = if(_bluforcount < 8)then{ 0.5 };
	_ratio = if(_bluforcount < 12)then{ 0.75 };

};

_ratio
