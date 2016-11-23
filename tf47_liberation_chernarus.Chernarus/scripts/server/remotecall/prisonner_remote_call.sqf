params [ "_unit" ];
private [ "_yield"];

if ( isServer ) then {
	_yield = selectRandom [2,4,5,2,4,5,2,4,5,6,7,8,9,10];
	resources_intel = resources_intel + _yield;

	[[ 0 ] , "remote_call_intel" ] call BIS_fnc_MP;
};