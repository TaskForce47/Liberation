params ["_fobposdestroy"];

classnames_to_destroy = [FOB_typename];
{
	classnames_to_destroy = classnames_to_destroy + [(_x select 0)];
}foreach buildings;

_nextbuildingsdestroy = [ (_fobposdestroy nearobjects 200) , { getObjectType _x >= 8 } ] call BIS_fnc_conditionalSelect;
_all_buildings_to_destroy = [];
{
	if ( (typeof _x) in classnames_to_destroy ) then {
		_all_buildings_to_destroy = _all_buildings_to_destroy + [_x];
	};
	
}foreach _nextbuildingsdestroy;


//_fob = [_fobposdestroy] call F_getNearestFob;
_fob_building =  ( _fobposdestroy nearestObject FOB_typename ) getVariable "TF47_FOBArray";
if (!(isNil "_fob_building")) then {
	_fob_building call BIS_fnc_removeRespawnPosition;
};

{
	_x setdamage 1;
	sleep (random 3);
	
}foreach _all_buildings_to_destroy;

GRLIB_all_fobs deleteat (GRLIB_all_fobs find _fobposdestroy);
publicVariable "GRLIB_all_fobs";