private [ "_currentnearest", "_refdistance", "_tpositions"];
_startpos = _this select 0;
_Air = param [1, "AIR"];

_currentnearest = [];
_refdistance = 99999;
_tpositions = [];
if (_Air == "AIR") then {
	if ( count GRLIB_all_fobs != 0 || count blufor_sectors != 0 ) then {

		{ _tpositions pushback _x; } foreach GRLIB_all_fobs;

		{
			if ( (_startpos distance _x < _refdistance)) then {
				_refdistance = (_startpos distance _x);
				_currentnearest = [_x,_refdistance];
			};
		} foreach _tpositions;

		if ( _refdistance > 4000 ) then {
			{
				_tpositions pushback (markerpos _x);
			} foreach blufor_sectors;

			{
				if ( _startpos distance _x < _refdistance ) then {
					_refdistance = (_startpos distance _x);
					_currentnearest = [_x, _refdistance];
				};
			} foreach _tpositions;
		};
	} else {
		_currentnearest = _startpos;
	};
} else {
	switch(true) do {
		case( _startpos inArea "noBattlegroup1" ):{
			if ( count GRLIB_all_fobs != 0 || count blufor_sectors != 0 ) then {

				{ _tpositions pushback _x; } foreach GRLIB_all_fobs;

				{
					if ( (_startpos distance _x < _refdistance) && ( _startpos in "noBattlegroup1") ) then {
						_refdistance = (_startpos distance _x);
						_currentnearest = [_x,_refdistance];
					};
				} foreach _tpositions;

				if ( _refdistance > 4000 ) then {
					{
						_tpositions pushback (markerpos _x);
					} foreach blufor_sectors;

					{
						if ( (_startpos distance _x < _refdistance) && ( _startpos in "noBattlegroup1") ) then {
							_refdistance = (_startpos distance _x);
							_currentnearest = [_x, _refdistance];
						};
					} foreach _tpositions;
				};
			} else {
				_currentnearest = _startpos;
			};
		};
		case( _startpos inArea "noBattlegroup2" ):{
			if ( count GRLIB_all_fobs != 0 || count blufor_sectors != 0 ) then {

				{ _tpositions pushback _x; } foreach GRLIB_all_fobs;

				{
					if ( (_startpos distance _x < _refdistance) && ( _startpos in "noBattlegroup2") ) then {
						_refdistance = (_startpos distance _x);
						_currentnearest = [_x,_refdistance];
					};
				} foreach _tpositions;

				if ( _refdistance > 4000 ) then {
					{
						_tpositions pushback (markerpos _x);
					} foreach blufor_sectors;

					{
						if ( (_startpos distance _x < _refdistance) && ( _startpos in "noBattlegroup2") ) then {
							_refdistance = (_startpos distance _x);
							_currentnearest = [_x, _refdistance];
						};
					} foreach _tpositions;
				};
			} else {
				_currentnearest = _startpos;
			};
		};
		case( _startpos inArea "noBattlegroup3" ):{
			if ( count GRLIB_all_fobs != 0 || count blufor_sectors != 0 ) then {

				{ _tpositions pushback _x; } foreach GRLIB_all_fobs;

				{
					if ( (_startpos distance _x < _refdistance) && ( _startpos in "noBattlegroup3") ) then {
						_refdistance = (_startpos distance _x);
						_currentnearest = [_x,_refdistance];
					};
				} foreach _tpositions;

				if ( _refdistance > 4000 ) then {
					{
						_tpositions pushback (markerpos _x);
					} foreach blufor_sectors;

					{
						if ( (_startpos distance _x < _refdistance) && ( _startpos in "noBattlegroup3") ) then {
							_refdistance = (_startpos distance _x);
							_currentnearest = [_x, _refdistance];
						};
					} foreach _tpositions;
				};
			} else {
				_currentnearest = _startpos;
			};
		};
		case( _startpos inArea "noBattlegroup4" ):{
			if ( count GRLIB_all_fobs != 0 || count blufor_sectors != 0 ) then {

				{ _tpositions pushback _x; } foreach GRLIB_all_fobs;

				{
					if ( (_startpos distance _x < _refdistance) && ( _startpos in "noBattlegroup4") ) then {
						_refdistance = (_startpos distance _x);
						_currentnearest = [_x,_refdistance];
					};
				} foreach _tpositions;

				if ( _refdistance > 4000 ) then {
					{
						_tpositions pushback (markerpos _x);
					} foreach blufor_sectors;

					{
						if ( (_startpos distance _x < _refdistance) && ( _startpos in "noBattlegroup4") ) then {
							_refdistance = (_startpos distance _x);
							_currentnearest = [_x, _refdistance];
						};
					} foreach _tpositions;
				};
			} else {
				_currentnearest = _startpos;
			};
		};
		Default{
			if ( count GRLIB_all_fobs != 0 || count blufor_sectors != 0 ) then {

				{ _tpositions pushback _x; } foreach GRLIB_all_fobs;

				{
					if ( (_startpos distance _x < _refdistance)) then {
						_refdistance = (_startpos distance _x);
						_currentnearest = [_x,_refdistance];
					};
				} foreach _tpositions;

				if ( _refdistance > 4000 ) then {
					{
						_tpositions pushback (markerpos _x);
					} foreach blufor_sectors;

					{
						if ( _startpos distance _x < _refdistance ) then {
							_refdistance = (_startpos distance _x);
							_currentnearest = [_x, _refdistance];
						};
					} foreach _tpositions;
				};
			} else {
				_currentnearest = _startpos;
			};
		};
	};
};


_currentnearest