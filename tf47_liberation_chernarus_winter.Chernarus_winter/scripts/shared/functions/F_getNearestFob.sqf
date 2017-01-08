params [ [ "_source_position", (getpos player) ] ];
private [ "_retvalue" ];

_retvalue = [];
if ( count GRLIB_all_fobs > 0 ) then {
	_retvalue = ( [ GRLIB_all_fobs , [] , { _source_position distance _x } , 'ASCEND' ] call BIS_fnc_sortBy ) select 0;
};
if (isNil "_retvalue") then {_retvalue = []; };
if (typeName _retvalue != "ARRAY") then {_retvalue = []; };
_retvalue
