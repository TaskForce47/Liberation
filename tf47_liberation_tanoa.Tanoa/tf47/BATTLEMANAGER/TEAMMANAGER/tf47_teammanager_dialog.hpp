#define tf47_teamManager_distance_temp1 (TF47_MAINFRAME_INNER_ANCHOR_Y + 2*TF47_MAINFRAME_INNER_BOARDER +  8*TF47_MAINFRAME_APP_HEADER_HEIGTH)
#define tf47_teamManager_distance_line1 (TF47_MAINFRAME_APP_HEADER_HEIGTH + TF47_MAINFRAME_INNER_BOARDER)

class tf47_TeamManager_mainTeamManager: tf47_TeamManager_BackGround
{
	idd = 304031;
	controls[] =
	{
		tf47_teamManager_Group_Control,
		tf47_teamManager_Member_Control,
		tf47_teamManager_header,
		tf47_teamManager_Group_name,	//304037
		tf47_teamManager_Group_name_set, //304051
		tf47_teamManager_Group_new_group,
		tf47_teamManager_Group_join_group,
		tf47_teamManager_Group_back,
		tf47_teamManager_showBox_Insignia, //304049
		//tf47_teamManager_teamInfo_listTypes, //304039
		tf47_teamManager_showbox_teamInfo, //304041
		tf47_teamManager_header_callsign,
		tf47_teamManager_header_groupType,
		tf47_teamManager_Group_types, //304043
		tf47_teamManager_Group_type_set, //304053
		tf47_teamManager_header_groupRadio,
		tf47_teamManager_Group_radioFrequ, //304045
		tf47_teamManager_Group_radio_set, //304055
		tf47_teamManager_header_groupInsignia,
		tf47_teamManager_Group_Insignia,
		tf47_teamManager_Group_Insignia_set //304057
		//tf47_teamManager_header_groupSim,
		//tf47_teamManager_Group_Level, //304059
		//tf47_teamManager_Group_level_set //304061
	};

	///////////////////////////////////////////////////////////////
	// team Header
	///////////////////////////////////////////////////////////////
	class tf47_teamManager_header: tf47_RscText
	{
		idc = -1;
		style = 2;
		text = "Squadmanager";
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
	class tf47_teamManager_Group_Control : tf47_CT_XLISTBOX
	{
		idc = 304033;
		x = TF47_MAINFRAME_INNER_ANCHOR_X;
		y = TF47_MAINFRAME_INNER_ANCHOR_Y +TF47_MAINFRAME_APP_HEADER_HEIGTH + TF47_MAINFRAME_INNER_BOARDER;
		w = (TF47_MAINFRAME_INNER_WIDTH)*1/3;
		h = TF47_LINEHEIGTH;
		tooltip = "";
		onLBSelChanged = "[] call tf47_TeamManager_fnc_updateUnitsBox;";
	};
	class tf47_teamManager_Member_Control : tf47_CT_LISTBOX
	{
		idc = 304035;
		x = TF47_MAINFRAME_INNER_ANCHOR_X;
		y = TF47_MAINFRAME_INNER_ANCHOR_Y+TF47_MAINFRAME_APP_HEADER_HEIGTH + 2*TF47_MAINFRAME_INNER_BOARDER + TF47_LINEHEIGTH;
		w = (TF47_MAINFRAME_INNER_WIDTH)*1/3;
		h = TF47_MAINFRAME_INNER_HEIGTH - (TF47_MAINFRAME_APP_HEADER_HEIGTH + 2*TF47_MAINFRAME_INNER_BOARDER + TF47_LINEHEIGTH);
		tooltip = "";
		colorBackground[] = {0,0,0,.8}; // Fill color
		colorSelectBackground[] = {1,0.5,0,1}; // Selected item fill color
		colorSelectBackground2[] = {1,0.5,0,1}; // Selected item fill color (oscillates between this and colorSelectBackground)
	};
	///////////////////////////////////////////////////////////////
	// group Info
	///////////////////////////////////////////////////////////////
	class tf47_teamManager_showBox_Insignia : tf47_RscPicture
	{
		idc = 304049;
		text = "";
		colorBackground[] = {0,0,0,0.8};
		x = TF47_MAINFRAME_INNER_ANCHOR_X +(TF47_MAINFRAME_INNER_WIDTH - TF47_MAINFRAME_INNER_BOARDER)*1/3 + 2*TF47_MAINFRAME_INNER_BOARDER + (2/3*TF47_MAINFRAME_INNER_WIDTH - TF47_MAINFRAME_INNER_BOARDER)*2/3;
		y = TF47_MAINFRAME_INNER_ANCHOR_Y + TF47_MAINFRAME_APP_HEADER_HEIGTH + TF47_MAINFRAME_INNER_BOARDER;
		w = (2/3*TF47_MAINFRAME_INNER_WIDTH - TF47_MAINFRAME_INNER_BOARDER)*1/3 -2*TF47_MAINFRAME_INNER_BOARDER;
		h = ( (2/3*TF47_MAINFRAME_INNER_WIDTH - TF47_MAINFRAME_INNER_BOARDER)*1/3 -2*TF47_MAINFRAME_INNER_BOARDER)*4/3;
	};

	class tf47_teamManager_showbox_teamInfo: tf47_CT_LISTBOX
	{
		idc = 304041;
		style = ST_LEFT + LB_TEXTURES; // Style
		x = TF47_MAINFRAME_INNER_ANCHOR_X +(TF47_MAINFRAME_INNER_WIDTH - TF47_MAINFRAME_INNER_BOARDER)*1/3 + 3*TF47_MAINFRAME_INNER_BOARDER;
		y = TF47_MAINFRAME_INNER_ANCHOR_Y + TF47_MAINFRAME_APP_HEADER_HEIGTH + 1*TF47_MAINFRAME_INNER_BOARDER;
		w = (2/3*TF47_MAINFRAME_INNER_WIDTH - TF47_MAINFRAME_INNER_BOARDER)*2/3 - 2*TF47_MAINFRAME_INNER_BOARDER;
		h = 7*TF47_MAINFRAME_APP_HEADER_HEIGTH;
		colorBackground[] = {0,0,0,.8};
		colorSelectBackground[] = {0,0,0,0};
		colorSelectBackground2[] = {0,0,0,0};
	};
	///////////////////////////////////////////////////////////////
	// set callsign
	///////////////////////////////////////////////////////////////
	class tf47_teamManager_header_callsign: tf47_RscText
	{
		idc = -1;
		style = 0;
		text = "Set Group Callsign:";
		x = TF47_MAINFRAME_INNER_ANCHOR_X +(TF47_MAINFRAME_INNER_WIDTH)*1/3 + 1*TF47_MAINFRAME_INNER_BOARDER;
		y = tf47_teamManager_distance_temp1;
		w = ( 2/3*TF47_MAINFRAME_INNER_WIDTH - 2*TF47_MAINFRAME_INNER_BOARDER);
		h = TF47_LINEHEIGTH;
		colorText[] = {1,1,1,1};
		colorBackground[] = {1,0.5,0,0.9};
		SizeEx	=	(0.022	* safezoneH);
	};
	class tf47_teamManager_Group_name : tf47_RscEdit
	{
		idc = 304037;
		x = TF47_MAINFRAME_INNER_ANCHOR_X +(TF47_MAINFRAME_INNER_WIDTH - TF47_MAINFRAME_INNER_BOARDER)*1/3 + 3*TF47_MAINFRAME_INNER_BOARDER;
		y = tf47_teamManager_distance_temp1 + 1*tf47_teamManager_distance_line1;
		w = ((2/3*TF47_MAINFRAME_INNER_WIDTH - 3*TF47_MAINFRAME_INNER_BOARDER)*2/3) - TF47_MAINFRAME_INNER_BOARDER;
		h = TF47_LINEHEIGTH;
		tooltip = "";
	};
	class tf47_teamManager_Group_name_set : tf47_RscButton
	{
		idc = 304051;
		x = TF47_MAINFRAME_INNER_ANCHOR_X +(TF47_MAINFRAME_INNER_WIDTH - TF47_MAINFRAME_INNER_BOARDER)*1/3 + 3*TF47_MAINFRAME_INNER_BOARDER + ((2/3*TF47_MAINFRAME_INNER_WIDTH - 3*TF47_MAINFRAME_INNER_BOARDER)*2/3);
		y = tf47_teamManager_distance_temp1 + 1*tf47_teamManager_distance_line1;
		w = ((2/3*TF47_MAINFRAME_INNER_WIDTH - 3*TF47_MAINFRAME_INNER_BOARDER)*1/3) - TF47_MAINFRAME_INNER_BOARDER;
		h = TF47_LINEHEIGTH;
		tooltip = "";
		text = "Set";
		action = "[] spawn tf47_TeamManager_fnc_setTeamName;";
	};
	///////////////////////////////////////////////////////////////
	// set type
	///////////////////////////////////////////////////////////////
	class tf47_teamManager_header_groupType: tf47_teamManager_header_callsign
	{
		text = "Set Group Type:";
		y = tf47_teamManager_distance_temp1 + 2*tf47_teamManager_distance_line1;
	};
	class tf47_teamManager_Group_types : tf47_teamManager_Group_Control //xlistbox
	{
		idc = 304043;
		x = TF47_MAINFRAME_INNER_ANCHOR_X +(TF47_MAINFRAME_INNER_WIDTH - TF47_MAINFRAME_INNER_BOARDER)*1/3 + 3*TF47_MAINFRAME_INNER_BOARDER;
		y = tf47_teamManager_distance_temp1 + 3*tf47_teamManager_distance_line1;
		w = ((2/3*TF47_MAINFRAME_INNER_WIDTH - 3*TF47_MAINFRAME_INNER_BOARDER)*2/3) - TF47_MAINFRAME_INNER_BOARDER;
		h = TF47_LINEHEIGTH;
	};
	class tf47_teamManager_Group_type_set : tf47_teamManager_Group_name_set
	{
		idc = 304053;
		y = tf47_teamManager_distance_temp1 + 3*tf47_teamManager_distance_line1;
		text = "Set";
		action = "[] call tf47_TeamManager_fnc_updateGroupType;";
	};
	///////////////////////////////////////////////////////////////
	// set radiofrequncy
	///////////////////////////////////////////////////////////////
	class tf47_teamManager_header_groupRadio: tf47_teamManager_header_callsign
	{
		text = "Set Group Radiochannel:";
		y = tf47_teamManager_distance_temp1 + 4*tf47_teamManager_distance_line1;
	};
	class tf47_teamManager_Group_radioFrequ : tf47_teamManager_Group_name
	{
		idc = 304045;
		y = tf47_teamManager_distance_temp1 + 5*tf47_teamManager_distance_line1;
	};
	class tf47_teamManager_Group_radio_set : tf47_teamManager_Group_name_set
	{
		idc = 304055;
		y = tf47_teamManager_distance_temp1 + 5*tf47_teamManager_distance_line1;
		text = "Set";
		action = "[] call tf47_TeamManager_fnc_updateRadio;";
	};
	///////////////////////////////////////////////////////////////
	// set insignia
	///////////////////////////////////////////////////////////////
	class tf47_teamManager_header_groupInsignia: tf47_teamManager_header_callsign
	{
		text = "Set Group Insignia:";
		y = tf47_teamManager_distance_temp1 + 6*tf47_teamManager_distance_line1;
	};
	class tf47_teamManager_Group_Insignia : tf47_teamManager_Group_types
	{
		idc = 304047;
		y = tf47_teamManager_distance_temp1 + 7*tf47_teamManager_distance_line1;
		onLBSelChanged = "[] call tf47_TeamManager_fnc_updateInsignia;";
	};
	class tf47_teamManager_Group_Insignia_set : tf47_teamManager_Group_name_set
	{
		idc = 304057;
		y = tf47_teamManager_distance_temp1 + 7*tf47_teamManager_distance_line1;
		text = "Set";
		action = "[] call tf47_TeamManager_fnc_setInsignia;";
	};
	///////////////////////////////////////////////////////////////
	// set simulation lvl
	///////////////////////////////////////////////////////////////
	/*
	class tf47_teamManager_header_groupSim: tf47_teamManager_header_callsign
	{
		text = "Set Group Simulation Level:";
		y = TF47_MAINFRAME_INNER_ANCHOR_Y + TF47_MAINFRAME_APP_HEADER_HEIGTH + TF47_MAINFRAME_INNER_BOARDER + 5*TF47_MAINFRAME_APP_HEADER_HEIGTH + (9*TF47_MAINFRAME_INNER_BOARDER + 8*TF47_LINEHEIGTH);
	};
	class tf47_teamManager_Group_Level : tf47_teamManager_Group_types
	{
		idc = 304059;
		y = TF47_MAINFRAME_INNER_ANCHOR_Y + TF47_MAINFRAME_APP_HEADER_HEIGTH + TF47_MAINFRAME_INNER_BOARDER + 5*TF47_MAINFRAME_APP_HEADER_HEIGTH + (10*TF47_MAINFRAME_INNER_BOARDER + 9*TF47_LINEHEIGTH);
		onLBSelChanged = "";
	};
	class tf47_teamManager_Group_level_set : tf47_teamManager_Group_name_set
	{
		idc = 304061;
		y = TF47_MAINFRAME_INNER_ANCHOR_Y + TF47_MAINFRAME_APP_HEADER_HEIGTH + TF47_MAINFRAME_INNER_BOARDER + 5*TF47_MAINFRAME_APP_HEADER_HEIGTH + (10*TF47_MAINFRAME_INNER_BOARDER + 9*TF47_LINEHEIGTH);
		text = "Set";
		action = "[] call tf47_TeamManager_fnc_updateGroupSimulation;";
	};
*/
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
