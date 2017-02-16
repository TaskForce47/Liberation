0 enableChannel [false, false];
1 enableChannel [false, false];
2 enableChannel [false, false];
3 enableChannel [false, false];

switch(typeOf player)do{
	default{
		[player, "riflemanUSMC"]call BIS_fnc_addRespawnInventory;
		//[player, "riflemanUSA"]call BIS_fnc_addRespawnInventory;
	};
};
