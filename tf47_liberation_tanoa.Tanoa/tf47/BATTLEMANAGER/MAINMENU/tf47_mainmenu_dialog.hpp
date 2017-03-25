class tf47_TeamManager_mainMenu: tf47_TeamManager_BackGround
{
	idd = 303031;	//from here i will start counting +2 upwards for subClasses and +1000 for new dialogs
	controls[] = {
		tf47_mainMenu_header_inf,
		tf47_mainmenu_app_teammanager,
		tf47_mainmenu_app_unitTracker,
		tf47_mainmenu_app_arsenal
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
		text = "Squad Manager";
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
		text = "Unit Tracker";
		x = TF47_MAINFRAME_INNER_ANCHOR_X;
		y = TF47_MAINFRAME_INNER_ANCHOR_Y + TF47_MAINFRAME_APP_HEADER_HEIGTH + 2*TF47_MAINFRAME_INNER_BOARDER + TF47_MAINMENU_APP_SIZE_Y;
		w = TF47_MAINFRAME_INNER_WIDTH;
		h = TF47_MAINMENU_APP_SIZE_Y;
		action = "[] spawn tf47_unitTracker_fnc_openUnitTracker;";
		tooltip = "Track all active units in the field";
	};
	class tf47_mainmenu_app_arsenal: tf47_RscButton
	{
		idc = 303039;
		text = "Gear Manager";
		x = TF47_MAINFRAME_INNER_ANCHOR_X;
		y = TF47_MAINFRAME_INNER_ANCHOR_Y + TF47_MAINFRAME_APP_HEADER_HEIGTH + 3*TF47_MAINFRAME_INNER_BOARDER + 2*TF47_MAINMENU_APP_SIZE_Y;
		w = TF47_MAINFRAME_INNER_WIDTH;
		h = TF47_MAINMENU_APP_SIZE_Y;
		action = "closeDialog 0; [] spawn tf47_arsenal_fnc_openArsenal; true";
		tooltip = "Customize your loadout";
	};

};
