class tf47_TeamManager_BackGround
{
	idd = -1;
	movingenable = 0;

	controlsBackground[] = { tf47_background_header,tf47_background_large,tf47_button_close};

	class tf47_background_header: tf47_RscText
	{
		idc = -1;
		text = "Task Force 47 Mission Manager";
		x = 0.300989* safezoneW + safezoneX;
		y = 0.236 	* safezoneH + safezoneY;
		w = 0.402187* safezoneW;
		h = 0.022	* safezoneH;
		colorText[] = {1,1,1,1};
		colorBackground[] = {0,0,0,.8};
		SizeEx	=	(0.022	* safezoneH);
	};
	class tf47_background_large: tf47_RscText
	{
		idc = -1;
		x = 0.300989 * safezoneW + safezoneX;
		y = 0.261704 * safezoneH + safezoneY;
		w = 0.402187 * safezoneW;
		h = 0.495 * safezoneH;
		colorBackground[] = {0,0,0,0.5};
	};
	class tf47_button_close: tf47_RscButton
	{
		idc = -1;
		text = "Close";
		x = 0.587656 * safezoneW + safezoneX;
		y = 0.764 * safezoneH + safezoneY;
		w = 0.108281 * safezoneW;
		h = 0.033 * safezoneH;
		action = "[] call tf47_battlemanager_fnc_destroyMenu;closeDialog 0;";
	};
}
#include "MAINMENU\tf47_mainmenu_dialog.hpp"
#include "TEAMMANAGER\tf47_teammanager_dialog.hpp"
#include "UNITTRACKER\tf47_unitTracker_dialog.hpp"
