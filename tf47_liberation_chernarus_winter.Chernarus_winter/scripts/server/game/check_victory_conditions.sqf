sleep 5;

_blufor_bigtowns = blufor_sectors select { _x in sectors_bigtown };

if ( count _blufor_bigtowns == count sectors_bigtown ) then {
	GRLIB_endgame = 1;
	publicVariable "GRLIB_endgame";
	{ _x allowDamage false; (vehicle _x) allowDamage false; } foreach allPlayers;
	sleep 20;

	{ if ( !(isPlayer _x)) then { deleteVehicle _x } } foreach allUnits;

};