params [ 
		"_mindist", 
		"_maxdist"
	];

private [ "_increment", "_opfor_spawn_point", "_all_possible_sectors", "_filtered_possible_sectors", "_current_sector", "_accept_current_sector", "_current_sector_distance2D", "_nearest_possible_sectors" ];

_increment = 500;
_opfor_spawn_point = '';
_all_possible_sectors = sectors_opfor;
_filtered_possible_sectors = [];

{
	_current_sector = _x;
	_accept_current_sector = true;
	_current_sector_distance2D = 99999;
	
	// kick if near sidemission
	if ( !isNil 'secondary_objective_position' ) then {
		if ( count secondary_objective_position != 0 ) then {
			if ( (( markerpos _current_sector ) distance2D secondary_objective_position) < 500 ) then {
				_accept_current_sector = false;
			};
		};
	};

	if ( !isNil 'used_positions' ) then {
		if ( _current_sector in used_positions ) then {
			_accept_current_sector = false;
		};
	};

	// near fobs
	{
		if ( (( markerpos _current_sector ) distance2D _x) < _mindist ) then {
			_accept_current_sector = false;
		} else {
			if ( (( markerpos _current_sector ) distance2D (_x)) < _current_sector_distance2D ) then {
				_current_sector_distance2D = (( markerpos _current_sector ) distance2D (_x));
			};
		};
	} foreach GRLIB_all_fobs;

	// near blufor sectors
	if ( _accept_current_sector ) then {
		{
			if ( (( markerpos _current_sector ) distance2D (markerpos _x)) < _mindist ) then {
				_accept_current_sector = false;
			} else {
				if ( (( markerpos _current_sector ) distance2D (markerpos _x)) < _current_sector_distance2D ) then {
					_current_sector_distance2D = (( markerpos _current_sector ) distance2D (markerpos _x));
				};
			};
		} foreach blufor_sectors;
	};

	if ( _accept_current_sector ) then {
		_one_opfor_sector_in_range = false;
		{
			if ( (( markerpos _current_sector ) distance2D (markerpos _x)) < 2000 ) then {
				_one_opfor_sector_in_range = true;
			}
		} foreach (sectors_allSectors - blufor_sectors);
		_accept_current_sector = _one_opfor_sector_in_range;
	};
	// some bluforbitches around
	if ( _accept_current_sector ) then {
		if ( ( [markerpos _current_sector, _mindist, TF47_helper_playerFaction ] call F_getUnitsCount ) != 0 ) then {
			_accept_current_sector = false;
		};
	};

	if (_accept_current_sector) then {
		_filtered_possible_sectors pushback [_current_sector,_current_sector_distance2D];
	};
} foreach _all_possible_sectors;

//tanoa specific filtering because reasons
private _temp	=	[];

{
	private _pos	=	getmarkerpos (_x select 0);
	private _aos	=	[_pos] call TF47_helper_isAreaReachable;
	if(count _aos != 0)then{
	
		_temp	pushBack _x;
	
	};

}forEach _filtered_possible_sectors;

_filtered_possible_sectors	=	+_temp;


if ( count _filtered_possible_sectors != 0 ) then {

	_nearest_possible_sectors = [];

	{
		_nextsector = _x select 0;
		_nextdistance2D = _x select 1;
		if ( _nextdistance2D < _maxdist ) then {
			_nearest_possible_sectors pushback _nextsector;
		};
	} foreach _filtered_possible_sectors;


	if ( count _nearest_possible_sectors != 0 ) then {
		
		while{_opfor_spawn_point	==	''}do{
		
			private _sector		=	(selectRandom _nearest_possible_sectors);
			private _sectorC	=	getMarkerPos _sector;
			private _pSec		=	[_sectorC] call TF47_helper_isAreaReachable;
			if(	(count _pSec)	>0)then{_opfor_spawn_point	=	_sector};
		
		};
		
	};
};

_opfor_spawn_point
