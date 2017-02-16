class tf47_TeamManager_mainMenu: tf47_TeamManager_BackGround
{
	idd = 303031;	//from here i will start counting +2 upwards for subClasses and +1000 for new dialogs
	controls[] = {
		tf47_mainMenu_header_inf,
		tf47_mainmenu_app_teammanager,
		tf47_mainmenu_app_unitTracker,
	};
	class tf47_mainMenu_header_inf: tf47_RscText
	{
		idc = 303033;
		style = 2;
		text = "Group Management";
		x = TF47_MAINFRAME_INNER_ANCHOR_X;
		y = TF47_MAINFRAME_INNER_ANCHOR_Y;
		w = TF47_MAINFRAME_INNER_WIDTH;
		h = TF47_MAINFRAME_APP_HEADER_HEIGTH;
		colorText[] = {1,1,1,1};
		colorBackground[] = {1,0.5,0,1};
		SizeEx	=	(0.022	* safezoneH);
	};
	class tf47_mainmenu_app_teammanager: tf47_RscButton
	{
		idc = 303035;
		text = "Squadmanager";
		x = TF47_MAINFRAME_INNER_ANCHOR_X;
		y = TF47_MAINFRAME_INNER_ANCHOR_Y + TF47_MAINFRAME_APP_HEADER_HEIGTH + TF47_MAINFRAME_INNER_BOARDER;
		w = TF47_MAINFRAME_INNER_WIDTH;
		h = TF47_MAINMENU_APP_SIZE_Y;
		action = "[] spawn tf47_TeamManager_fnc_openTeamManager;";
		tooltip = "Manage your squad";
	};
	class tf47_mainmenu_app_unitTracker: tf47_RscButton
	{
		idc = 303037;
		text = "UnitTracker";
		x = TF47_MAINFRAME_INNER_ANCHOR_X;
		y = TF47_MAINFRAME_INNER_ANCHOR_Y + TF47_MAINFRAME_APP_HEADER_HEIGTH + 2*TF47_MAINFRAME_INNER_BOARDER + TF47_MAINMENU_APP_SIZE_Y;
		w = TF47_MAINFRAME_INNER_WIDTH;
		h = TF47_MAINMENU_APP_SIZE_Y;
		action = "[] spawn tf47_unitTracker_fnc_openUnitTracker;";
		tooltip = "Track all active units in the field";
	};
	class tf47_mainmenu_app_roleSelection: tf47_RscButton
	{
		idc = 303039;
		text = "RoleSelection";
		x = TF47_MAINFRAME_INNER_ANCHOR_X + 2*(TF47_MAINMENU_APP_DIST_X);
		y = TF47_MAINFRAME_INNER_ANCHOR_Y + TF47_MAINFRAME_APP_HEADER_HEIGTH +TF47_MAINFRAME_INNER_BOARDER;
		w = TF47_MAINMENU_APP_SIZE_X;
		h = TF47_MAINMENU_APP_SIZE_Y;
		action = "[] spawn tf47_roleSelection_fnc_openRoleSelectionDialog;";
		tooltip = "Chose your active role on the battlefield";
	};
	class tf47_mainmenu_app_loadout : tf47_mainmenu_app_roleSelection
	{
		idc = 303041;
		text = "Refill";
		x = TF47_MAINFRAME_INNER_ANCHOR_X + 3*(TF47_MAINMENU_APP_DIST_X);
		action = "[] spawn tf47_roleSelection_fnc_setUnitGear; true";
		tooltip = "Refill your loadout";
	};
	class tf47_mainmenu_app_customisation : tf47_mainmenu_app_roleSelection
	{
		idc = 303043;
		text = "Arsenal";
		x = TF47_MAINFRAME_INNER_ANCHOR_X + 4*(TF47_MAINMENU_APP_DIST_X);
		action = "closeDialog 0; [] spawn tf47_battlemanager_fnc_openArsenal; [] call tf47_battlemanager_fnc_destroyMenu; true";
		tooltip = "Customize your loadout";
	};
	class tf47_mainMenu_header_veh: tf47_mainMenu_header_inf
	{
		idc = 303045;
		text = "Vehicle Management";
		y = TF47_MAINFRAME_INNER_ANCHOR_Y + TF47_MAINFRAME_APP_HEADER_HEIGTH + 2*TF47_MAINFRAME_INNER_BOARDER + TF47_MAINMENU_APP_SIZE_Y;
	};
	class tf47_mainmenu_app_vehicleSpaner: tf47_mainmenu_app_teammanager
	{
		idc = 303047;
		text = "VehicleSpawner";
		y = TF47_MAINFRAME_INNER_ANCHOR_Y + 2*TF47_MAINFRAME_APP_HEADER_HEIGTH + 3*TF47_MAINFRAME_INNER_BOARDER + TF47_MAINMENU_APP_SIZE_Y;
		action = "[] spawn tf47_vehicleSpawner_fnc_openVehicleSpawner;";
		tooltip = "Manage your vehicles";
	};
	class tf47_mainmenu_app_vehicletracker: tf47_mainmenu_app_vehicleSpaner
	{
		idc = 303049;
		text = "VehicleTracker";
		x = TF47_MAINFRAME_INNER_ANCHOR_X + 1*(TF47_MAINMENU_APP_DIST_X);
		action = "[] call tf47_vehicleTracker_fnc_openVehicleTracker";
		tooltip = "Track your vehicles";
	};
	class tf47_mainMenu_header_settings: tf47_mainMenu_header_inf
	{
		idc = 303051;
		text = "Settings & Administration";
		y = TF47_MAINFRAME_INNER_ANCHOR_Y + 2*TF47_MAINFRAME_APP_HEADER_HEIGTH + 4*TF47_MAINFRAME_INNER_BOARDER + 2*TF47_MAINMENU_APP_SIZE_Y;
	};
	class tf47_mainmenu_app_settings: tf47_mainmenu_app_teammanager
	{
		idc = 303053;
		text = "Settings";
		y = TF47_MAINFRAME_INNER_ANCHOR_Y + 3*TF47_MAINFRAME_APP_HEADER_HEIGTH + 5*TF47_MAINFRAME_INNER_BOARDER + 2*TF47_MAINMENU_APP_SIZE_Y;
		action = "";
		tooltip = "Manage some settings";
	};
	class tf47_mainmenu_app_administration: tf47_mainmenu_app_settings
	{
		idc = 303055;
		text = "Administration";
		x = TF47_MAINFRAME_INNER_ANCHOR_X + 1*(TF47_MAINMENU_APP_DIST_X);
		action = "[] spawn tf47_administration_fnc_openAdministrationDialog;";
		tooltip = "Administrate your server";
	};
	class tf47_mainmenu_app_development: tf47_mainmenu_app_settings
	{
		idc = 303057;
		text = "Development";
		x = TF47_MAINFRAME_INNER_ANCHOR_X + 2*(TF47_MAINMENU_APP_DIST_X);
		action = "closeDialog 0; createDialog 'tf47_battlemanager_debugConsole';"; //for debug test only, will be changed later!
		tooltip = "Debugging";
	};
};
