class tf47_UnitTracker_mainMenu: tf47_TeamManager_BackGround
{
	idd = 305031;	//from here i will start counting +2 upwards for subClasses and +1000 for new dialogs
	controls[] = {
		tf47_unitTracker_header,
		tf47_unitTracker_showBox_groups, //305033
		tf47_unitTracker_backToMenu
		//tf47_unitTracker_update
	};
	class tf47_unitTracker_header: tf47_RscText
	{
		text = "Unit Tracker";
		idc = -1;
		style = 2;
		x = TF47_MAINFRAME_INNER_ANCHOR_X;
		y = TF47_MAINFRAME_INNER_ANCHOR_Y;
		w = TF47_MAINFRAME_INNER_WIDTH;
		h = TF47_MAINFRAME_APP_HEADER_HEIGTH;
		colorText[] = {1,1,1,1};
		colorBackground[] = {1,0.5,0,1};
		SizeEx	=	(0.022	* safezoneH);
	};
	class tf47_unitTracker_showBox_groups : tf47_CT_LISTBOX
	{
		idc = 305033;
		text = "col";
		colorBackground[] = {0,0,0,.8};
		colorSelectBackground[] = {0,0,0,0};
		colorSelectBackground2[] = {0,0,0,0};
		x = TF47_MAINFRAME_INNER_ANCHOR_X;
		y = TF47_MAINFRAME_INNER_ANCHOR_Y + TF47_MAINFRAME_APP_HEADER_HEIGTH + TF47_MAINFRAME_INNER_BOARDER;
		w = TF47_MAINFRAME_INNER_WIDTH;
		h = TF47_MAINFRAME_INNER_HEIGTH - TF47_MAINFRAME_APP_HEADER_HEIGTH - 4*TF47_MAINFRAME_INNER_BOARDER - TF47_MAINFRAME_APP_HEADER_HEIGTH;

	};
	class tf47_unitTracker_backToMenu : tf47_RscButton
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
	class tf47_unitTracker_update : tf47_unitTracker_backToMenu
	{
		idc = -1;
		x = TF47_MAINFRAME_INNER_ANCHOR_X +(TF47_MAINFRAME_INNER_WIDTH - TF47_MAINFRAME_INNER_BOARDER)*1/3 + 2*TF47_MAINFRAME_INNER_BOARDER + ((TF47_MAINFRAME_INNER_WIDTH - 2*TF47_MAINFRAME_INNER_BOARDER)*2/3 *1/3);
		text = "Update";
		action = "[] call tf47_unitTracker_fnc_openUnitTracker; true";
	};
};
