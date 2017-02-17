if(	!(isclass (configfile >> "CfgPatches" >> "cba_main")	)	)exitWith{};

{	light_vehicles_extension pushBack _x	}forEach [];

{heavy_vehicles_extension	pushBack _x}forEach [];

{air_vehicles_extension pushBack _x}forEach [];

if(isDedicated)exitWith{};

{GRLIB_arsenal_weapons pushBack _x}forEach [];

{GRLIB_arsenal_magazines pushBack _x}forEach [];

{GRLIB_arsenal_items pushBack _x}forEach [];

{GRLIB_arsenal_backpacks pushBack _x}forEach [];

//[player, "riflemanRM"]call BIS_fnc_addRespawnInventory;
