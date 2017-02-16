
class tf47_arsenal_mainMenu: tf47_TeamManager_BackGround
{
	idd = 306031;
	controls[] =
	{
		tf47_arsenal_header,
		tf47_arsenal_loadout_Control, //306031
		tf47_teamManager_Group_new_group,
		tf47_teamManager_Group_join_group,
		tf47_teamManager_Group_back,
	};

	///////////////////////////////////////////////////////////////
	// team Header
	///////////////////////////////////////////////////////////////
	class tf47_arsenal_header: tf47_RscText
	{
		idc = -1;
		style = 2;
		text = "Gear Management";
		x = TF47_MAINFRAME_INNER_ANCHOR_X;
		y = TF47_MAINFRAME_INNER_ANCHOR_Y;
		w = TF47_MAINFRAME_INNER_WIDTH;
		h = TF47_MAINFRAME_APP_HEADER_HEIGTH;
		colorText[] = {1,1,1,1};
		colorBackground[] = {1,0.5,0,1};
		SizeEx	=	(0.022	* safezoneH);
	};
	///////////////////////////////////////////////////////////////
	// list boxes for groups and teammates, left third of mainframe
	///////////////////////////////////////////////////////////////
	class tf47_arsenal_loadout_Control : TF47_CT_TREE
	{
		idc = 306031;
		x = TF47_MAINFRAME_INNER_ANCHOR_X;
		y = TF47_MAINFRAME_INNER_ANCHOR_Y + TF47_MAINFRAME_APP_HEADER_HEIGTH;
		w = (TF47_MAINFRAME_INNER_WIDTH)*2/3;
		h = TF47_MAINFRAME_INNER_HEIGTH - TF47_MAINFRAME_APP_HEADER_HEIGTH;
		tooltip = "";
		colorBackground[] = {0,0,0,.8}; // Fill color
		colorSelectBackground[] = {1,0.5,0,1}; // Selected item fill color
		colorSelectBackground2[] = {1,0.5,0,1}; // Selected item fill color (oscillates between this and colorSelectBackground)
	};
	///////////////////////////////////////////////////////////////
	// create new group
	///////////////////////////////////////////////////////////////
	class tf47_teamManager_Group_new_group : tf47_RscButton
	{
		idc = -1;
		x = TF47_MAINFRAME_INNER_ANCHOR_X +(TF47_MAINFRAME_INNER_WIDTH - TF47_MAINFRAME_INNER_BOARDER)*1/3 + TF47_MAINFRAME_INNER_BOARDER;
		y = TF47_MAINFRAME_INNER_ANCHOR_Y + TF47_MAINFRAME_INNER_HEIGTH -TF47_MAINFRAME_APP_HEADER_HEIGTH;
		w = (TF47_MAINFRAME_INNER_WIDTH - 2*TF47_MAINFRAME_INNER_BOARDER)*2/3 *1/3;
		h = TF47_MAINFRAME_APP_HEADER_HEIGTH;
		tooltip = "";
		text = "Create";
		action = "[] spawn tf47_TeamManager_fnc_createNewGroup;";
	};
	///////////////////////////////////////////////////////////////
	// join group
	///////////////////////////////////////////////////////////////
	class tf47_teamManager_Group_join_group : tf47_RscButton
	{
		idc = -1;
		x = TF47_MAINFRAME_INNER_ANCHOR_X +(TF47_MAINFRAME_INNER_WIDTH - TF47_MAINFRAME_INNER_BOARDER)*1/3 + 2*TF47_MAINFRAME_INNER_BOARDER + ((TF47_MAINFRAME_INNER_WIDTH - 2*TF47_MAINFRAME_INNER_BOARDER)*2/3 *1/3);
		y = TF47_MAINFRAME_INNER_ANCHOR_Y + TF47_MAINFRAME_INNER_HEIGTH -TF47_MAINFRAME_APP_HEADER_HEIGTH;
		w = (TF47_MAINFRAME_INNER_WIDTH - 2*TF47_MAINFRAME_INNER_BOARDER)*2/3 *1/3;
		h = TF47_MAINFRAME_APP_HEADER_HEIGTH;
		tooltip = "";
		text = "Join";
		action = "[] spawn tf47_TeamManager_fnc_joinGroup;";
	};
	///////////////////////////////////////////////////////////////
	// return to main menu
	///////////////////////////////////////////////////////////////
	class tf47_teamManager_Group_back : tf47_RscButton
	{
		idc = -1;
		x = TF47_MAINFRAME_INNER_ANCHOR_X +(TF47_MAINFRAME_INNER_WIDTH - TF47_MAINFRAME_INNER_BOARDER)*1/3 + 2*TF47_MAINFRAME_INNER_BOARDER + ((TF47_MAINFRAME_INNER_WIDTH - 2*TF47_MAINFRAME_INNER_BOARDER)*2/3 *1/3) + TF47_MAINFRAME_INNER_BOARDER + ((TF47_MAINFRAME_INNER_WIDTH - 2*TF47_MAINFRAME_INNER_BOARDER)*2/3 *1/3);
		y = TF47_MAINFRAME_INNER_ANCHOR_Y + TF47_MAINFRAME_INNER_HEIGTH -TF47_MAINFRAME_APP_HEADER_HEIGTH;
		w = (TF47_MAINFRAME_INNER_WIDTH - 6*TF47_MAINFRAME_INNER_BOARDER)*2/3 *1/3;
		h = TF47_MAINFRAME_APP_HEADER_HEIGTH;
		tooltip = "";
		text = "Back";
		action = "closeDialog 0; [] spawn TF47_BATTLEMANAGER_fnc_openMainMenuDialog; true";
	};
};
#undef tf47_teamManager_distance_temp1
#undef tf47_teamManager_distance_line1
