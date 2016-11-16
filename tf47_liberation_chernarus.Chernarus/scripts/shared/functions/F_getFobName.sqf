params [ "_fob" ];
private [ "_fobindex", "_fobname" ];

_fobname = "";
_fobindex = -1;
{
	if ( _x distance _fob < 100 ) then {
		_fobindex = _forEachIndex;
	};
} foreach GRLIB_all_fobs;

_fobname = "";
if ( _fobindex != -1 ) then {
	_fobname = military_alphabet select _fobindex;
};

_fobname