if (!(hasInterface))exitWith{};

_debug = false;
_array = profilenamespace getVariable [ ((format ["TF47_Inventory_Liberation_on_%1", worldName])), 1];
if ((typeName _array) != "Array") exitWith {};


if (isMultiplayer) then {
	if ((getPlayerUID player) == _array select 0) then {
		//Set Pos and dir
		/*
		if (_debug) then {Systemchat "Set player to last position.";};
		
		if (str  [(((_array select 1) select 0) select 0), (((_array select 1) select 0) select 1), 0.1] == str [0,0,0.1]) then {

		} else {
			if ((((_array select 1) select 0) select 2) > 3) then {
				player setPos [(((_array select 1) select 0) select 0), (((_array select 1) select 0) select 1), 0.1];
			} else {
				player setPos (((_array select 1) select 0));
			};
		};
		
		player setDir ((_array select 1) select 1);
		*/
		//Dress and Arm 
		 
		//Add Uniform
		if (((_array select 2) select 0) != "") then { 
			player forceAddUniform ((_array select 2) select 0);
		};
		
		// Add Vest
		if (((_array select 2) select 1) != "") then { 
			player addVest ((_array select 2) select 1);
		};
		
		// Add Headgear
		if (((_array select 2) select 2) != "") then {
			player addHeadgear 	((_array select 2) select 2);
		};
		
		//Add Backpack
		if (((_array select 2) select 3) != "") then { 
			player addBackpack((_array select 2) select 3);
		};
		
		//Add Main Weapon magazin
		if ((typeName ((_array select 2) select 4)) == "ARRAY") then {
			player addItemToUniform (((_array select 2) select 4) select 0);
		};
			if ((typeName ((_array select 2) select 4)) == "String") then {
			player addItemToUniform ((_array select 2) select 4);
		};
		
		//Add main Weapon
		if (((_array select 2) select 7) != "") then { 
			player addWeapon ((_array select 2) select 7);
			removeAllPrimaryWeaponItems player;
		};
		
		//Add Secondary Weapon Magazin if ther is one
		if ((typeName ((_array select 2) select 5)) == "ARRAY") then {
			(unitBackpack player) addmagazinecargo [(((_array select 2) select 5) select 0), 1];
		};
		if ((typeName ((_array select 2) select 5)) == "String") then {
			(unitBackpack player) addmagazinecargo [((_array select 2) select 5), 1];
		};
		
		//Add Secondary Weapon
		if (((_array select 2) select 8) != "") then { 
			player addWeapon ((_array select 2) select 8);
		};
		
		//Add Possible Magazin from Weapon
		if ((typeName ((_array select 2) select 6)) == "ARRAY") then {
			player addItemToUniform (((_array select 2) select 6) select 0);
		};
		if ((typeName ((_array select 2) select 6)) == "String") then {
			player addItemToUniform ((_array select 2) select 6);
		};
		
		//Add Handgun
		if (((_array select 2) select 9) != "") then { 
			player addWeapon ((_array select 2) select 9);
			removeAllHandgunItems player;
		};
		
		//Add Items to Backpack
		{
			player addItemToBackpack _x;	
		} foreach (_array select 3);
		
		// Add Items to Uniform
		{
			player addItemToUniform  _x;	
		} foreach (_array select 4);
		
		// Add Items to Vest
		{
			player addItemToVest  _x;
		} foreach (_array select 5);
		
		// Link Items
		{
			player linkItem  _x;
		} foreach (_array select 6);

		//Add MainGun Attachments
		{
			player addPrimaryWeaponItem _x;

		} foreach (_array select 7);
		
		//Add Secondary Attachments
		{
			player addSecondaryWeaponItem _x;
		} foreach (_array select 8);

		//Add  Attachments
		{
			player addHandgunItem  _x;
		} foreach (_array select 9);
	};
} else {
	player setPos [(((_array select 1) select 0) select 0), (((_array select 1) select 0) select 1), 0.1];
	player setDir ((_array select 1) select 1);
	//Dress and Arm 

	//Add Uniform
	if (((_array select 2) select 0) != "") then { 
		player forceAddUniform ((_array select 2) select 0);
	};
	
	// Add Vest
	if (((_array select 2) select 1) != "") then { 
		player addVest ((_array select 2) select 1);
	};
	
	// Add Headgear
	if (((_array select 2) select 2) != "") then {
		player addHeadgear 	((_array select 2) select 2);
	};
	
	//Add Backpack
	if (((_array select 2) select 3) != "") then { 
		player addBackpack((_array select 2) select 3);
	};
	
	//Add Main Weapon magazin
	if ((typeName ((_array select 2) select 4)) == "ARRAY") then {
		player addItem  (((_array select 2) select 4) select 0);
	};
		if ((typeName ((_array select 2) select 4)) == "String") then {
		player addItem  ((_array select 2) select 4);
	};

	//Add main Weapon
	if (((_array select 2) select 7) != "") then { 
		player addWeapon ((_array select 2) select 7);
	};
	
	//Add Secondary Weapon Magazin if there is one
	if ((typeName ((_array select 2) select 5)) == "ARRAY") then {
		(unitBackpack player) addmagazinecargo [(((_array select 2) select 5) select 0), 1];
	};
	if ((typeName ((_array select 2) select 5)) == "String") then {
		(unitBackpack player) addmagazinecargo [((_array select 2) select 5), 1];
	};
	
	//Add Secondary Weapon
	if (((_array select 2) select 8) != "") then { 
		player addWeapon ((_array select 2) select 8);
	};
	
	//Add Possible Magazin from Weapon
	if ((typeName ((_array select 2) select 6)) == "ARRAY") then {
		player addItemToUniform (((_array select 2) select 6) select 0);
	};
	if ((typeName ((_array select 2) select 6)) == "String") then {
		player addItemToUniform ((_array select 2) select 6);
	};
	
	//Add Handgun
	if (((_array select 2) select 9) != "") then { 
		player addWeapon ((_array select 2) select 9);
	};
	
	//Add Items to Backpack
	{
		player addItemToBackpack _x;	
	} foreach (_array select 3);
	
	// Add Items to Uniform
	{
		player addItemToUniform  _x;	
	} foreach (_array select 4);
	
	// Add Items to Vest
	{
		player addItemToVest  _x;
	} foreach (_array select 5);
	
	// Link Items
	{
		player linkItem  _x;
		if (_x == "Binocular") then {
			player addweapon "Binocular";
		};
	} foreach (_array select 6);
	
	//Add MainGun Attachments
	if ((typeName (_array select 7)) == "Array") then {
		{
			player addPrimaryWeaponItem _x;
		} foreach (_array select 7);
	};
	//Add Secondary Attachments
	if ((typeName (_array select 8)) == "Array") then {
		{
			player addSecondaryWeaponItem _x;
		} foreach (_array select 8);
	};
	//Add  Attachments
	if ((typeName (_array select 9)) == "Array") then {
		{
			player addHandgunItem  _x;
		} foreach (_array select 9);
	};
};
