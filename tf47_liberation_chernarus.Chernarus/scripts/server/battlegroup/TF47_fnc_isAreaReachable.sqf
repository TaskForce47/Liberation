/*
	
	author: mindbl4ster
	
	description:
		filter next possible objective for opfor lynching mobs... islands and shit ...
		
	parameter:
		0:	ARRAY	-	starting position for group
	
	return:
		0:	ARRAY	-	possible locations to attack on same island
		
	notes:
	
	example:

		
*/
params [["_startingLocation",[]]];
if(count _startingLocation == 0)exitWith{};
private _id	= -1;
private _ISLANDS = [];

{
	if(_startingLocation inArea	_x) then { _id = _forEachIndex; };
}foreach _ISLANDS;

private _possibleAOs = [];
private _allAOs	= +GRLIB_all_fobs;
{ _allAOs pushBack (getmarkerpos _x) }foreach blufor_sectors;
private _allAOsN = (count _allAOs)-1;
private _allAOSnew = +_allAOs;

if(_id == -1) then {
	//big island
	for "_i" from 0 to _allAOsN do {
		private	_pos =_allAOs select _i;
		{
			if((_pos inArea _x)) then { _allAOsNew deleteAt (_allAOSnew find _pos);	};
		}foreach _ISLANDS;
	};
	_possibleAOs = +_allAOSnew;
}else{
	private _area = _ISLANDS select	_id;
	for "_i" from 0 to _allAOsN do{
		private	_pos  =	_allAOs select _i;
		if(	_pos inArea	_area ) then { _possibleAOs	pushBack _pos;};
	};
};

{
	if(_x in _possibleAOs) then {
		([_x] append (_possibleAOs deleteAt (_possibleAOs find _x)));
	};
}foreach GRLIB_all_fobs;

_possibleAOs;