if ( !isServer ) exitWith {};

params [ "_intel_object" ];

if ( isNull _intel_object ) exitWith {};

_intel_yield = 5;
deleteVehicle _intel_object;
resources_intel = resources_intel + (round (random _intel_yield));

[ [ 1 ] , "remote_call_intel" ] call BIS_fnc_MP;