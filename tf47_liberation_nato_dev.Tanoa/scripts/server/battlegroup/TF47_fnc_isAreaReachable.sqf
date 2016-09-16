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

params [
	["_startingLocation",[]]
];

IF(count _startingLocation == 0)EXITWITH{};

PRIVATE _id			=	-1;
PRIVATE _ISLANDS	= 	["noBattlegroup1","noBattlegroup2","noBattlegroup3","noBattlegroup4"];

{
	IF(_startingLocation	inArea	_x	)THEN{	_id	=	_forEachIndex};
}FOREACH _ISLANDS;

PRIVATE _possibleAOs	=	[];
PRIVATE _allAOs			=	+GRLIB_all_fobs;
{	_allAOs pushBack (getmarkerpos _x)	}foreach blufor_sectors;
PRIVATE _allAOsN		=	(count _allAOs)-1;
PRIVATE _allAOSnew		=	+_allAOs;

IF(_id	==	-1)THEN{

	//big island
	for "_i" from 0 to _allAOsN do{
	
		PRIVATE	_pos 	=	_allAOs select _i;
		{
			IF(	(_pos	inArea	_x	)	)THEN{	_allAOsNew deleteAt (_allAOSnew find _pos);	};
		}FOREACH _ISLANDS;
	
	};
	
	_possibleAOs	=	+_allAOSnew;
	
}ELSE{

	PRIVATE 	_area	=	_ISLANDS	select	_id;
	
	for "_i" from 0 to _allAOsN do{
	
		PRIVATE	_pos 	=	_allAOs select _i;

		IF(	_pos	inArea	_area	)THEN{	_possibleAOs	pushBack	_pos;};
	
	};

};

/*
	priorize fobs
*/

{

	if(_x in _possibleAOs)then{
	
		_possibleAOs	=	[_x] append (_possibleAOs deleteAt (_possibleAOs	find _x ));

	};

}forEach GRLIB_all_fobs;

_possibleAOs;
