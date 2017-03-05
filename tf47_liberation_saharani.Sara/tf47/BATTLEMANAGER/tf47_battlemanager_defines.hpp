// Control types
#define CT_STATIC           0
#define CT_BUTTON           1
#define CT_EDIT             2
#define CT_SLIDER           3
#define CT_COMBO            4
#define CT_LISTBOX          5
#define CT_TOOLBOX          6
#define CT_CHECKBOXES       7
#define CT_PROGRESS         8
#define CT_HTML             9
#define CT_STATIC_SKEW      10
#define CT_ACTIVETEXT       11
#define CT_TREE             12
#define CT_STRUCTURED_TEXT  13
#define CT_CONTEXT_MENU     14
#define CT_CONTROLS_GROUP   15
#define CT_SHORTCUTBUTTON   16
#define CT_XKEYDESC         40
#define CT_XBUTTON          41
#define CT_XLISTBOX         42
#define CT_XSLIDER          43
#define CT_XCOMBO           44
#define CT_ANIMATED_TEXTURE 45
#define CT_OBJECT           80
#define CT_OBJECT_ZOOM      81
#define CT_OBJECT_CONTAINER 82
#define CT_OBJECT_CONT_ANIM 83
#define CT_LINEBREAK        98
#define CT_USER             99
#define CT_MAP              100
#define CT_MAP_MAIN         101
#define CT_LISTNBOX         102

// Static styles
#define ST_POS            0x0F
#define ST_HPOS           0x03
#define ST_VPOS           0x0C
#define ST_LEFT           0x00
#define ST_RIGHT          0x01
#define ST_CENTER         0x02
#define ST_DOWN           0x04
#define ST_UP             0x08
#define ST_VCENTER        0x0C
#define ST_GROUP_BOX       96
#define ST_GROUP_BOX2      112
#define ST_ROUNDED_CORNER  ST_GROUP_BOX + ST_CENTER
#define ST_ROUNDED_CORNER2 ST_GROUP_BOX2 + ST_CENTER

#define ST_TYPE           0xF0
#define ST_SINGLE         0x00
#define ST_MULTI          0x10
#define ST_TITLE_BAR      0x20
#define ST_PICTURE        0x30
#define ST_FRAME          0x40
#define ST_BACKGROUND     0x50
#define ST_GROUP_BOX      0x60
#define ST_GROUP_BOX2     0x70
#define ST_HUD_BACKGROUND 0x80
#define ST_TILE_PICTURE   0x90
#define ST_WITH_RECT      0xA0
#define ST_LINE           0xB0

#define ST_SHADOW         0x100
#define ST_NO_RECT        0x200
#define ST_KEEP_ASPECT_RATIO  0x800

#define ST_TITLE          ST_TITLE_BAR + ST_CENTER

// Slider styles
#define SL_DIR            0x400
#define SL_VERT           0
#define SL_HORZ           0x400

#define SL_TEXTURES       0x10

// progress bar
#define ST_VERTICAL       0x01
#define ST_HORIZONTAL     0

// Listbox styles
#define LB_TEXTURES       0x10
#define LB_MULTI          0x20

// Tree styles
#define TR_SHOWROOT       1
#define TR_AUTOCOLLAPSE   2

// MessageBox styles
#define MB_BUTTON_OK      1
#define MB_BUTTON_CANCEL  2
#define MB_BUTTON_USER    4



//////////////////
//CUSTOM DEFINES//
//////////////////

// symmetry var
#define TF47_EQUAL_DIST	4/3
#define TF47_BORDER_MAIN_FRAME_RELATIVE	1.3
#define TF47_APPSIZE_RELATIVE 0.2
#define TF47_LINEHEIGTH (0.022	* safezoneH)
//mainframe constants
#define TF47_MAINFRAME_WIDTH (0.402187*safezoneW)
#define TF47_MAINFRAME_HEIGTH (0.495*safezoneH)
#define TF47_MAINFRAME_OUTER_ANCHOR_X (0.300989 * safezoneW + safezoneX)
#define TF47_MAINFRAME_OUTER_ANCHOR_Y (0.261704 * safezoneH + safezoneY)
//#define TF47_MAINFRAME_APP_HEADER_HEIGTH (1.5 * 0.03921)
#define TF47_MAINFRAME_APP_HEADER_HEIGTH TF47_LINEHEIGTH
//relative positions
//#define TF47_MAINFRAME_INNER_BOARDER (TF47_MAINFRAME_OUTER_ANCHOR_X*TF47_BORDER_MAIN_FRAME_RELATIVE - TF47_MAINFRAME_OUTER_ANCHOR_X)
#define TF47_MAINFRAME_INNER_BOARDER TF47_MAINFRAME_WIDTH*0.01
#define TF47_MAINFRAME_INNER_ANCHOR_X (TF47_MAINFRAME_OUTER_ANCHOR_X + TF47_MAINFRAME_INNER_BOARDER)
#define TF47_MAINFRAME_INNER_ANCHOR_Y (TF47_MAINFRAME_OUTER_ANCHOR_Y + TF47_MAINFRAME_INNER_BOARDER)
#define TF47_MAINFRAME_INNER_WIDTH (TF47_MAINFRAME_WIDTH - 2*TF47_MAINFRAME_INNER_BOARDER)
#define TF47_MAINFRAME_INNER_HEIGTH (TF47_MAINFRAME_HEIGTH - 2*TF47_MAINFRAME_INNER_BOARDER)
//relative sizes for buttons
#define TF47_MAINMENU_APP_SIZE_X (TF47_MAINFRAME_INNER_WIDTH	-	5*TF47_MAINFRAME_INNER_BOARDER)*1/6
#define TF47_MAINMENU_APP_SIZE_Y (TF47_MAINMENU_APP_SIZE_X	*	TF47_EQUAL_DIST)
#define TF47_MAINMENU_APP_DIST_X TF47_MAINMENU_APP_SIZE_X + TF47_MAINFRAME_INNER_BOARDER
#define TF47_MAINMENU_APP_DIST_Y TF47_MAINMENU_APP_SIZE_Y + TF47_MAINFRAME_INNER_BOARDER



////////////////
//Base Classes//
////////////////

class tf47_IGUIBack
{
	type = 0;
	idc = 124;
	style = 128;
	text = "";
	colorText[] =
	{
		0,
		0,
		0,
		0
	};
	font = "RobotoCondensed";
	sizeEx = 0;
	shadow = 0;
	x = 0.1;
	y = 0.1;
	w = 0.1;
	h = 0.1;
	colorbackground[] =
	{
		"(profilenamespace getvariable ['IGUI_BCG_RGB_R',0])",
		"(profilenamespace getvariable ['IGUI_BCG_RGB_G',1])",
		"(profilenamespace getvariable ['IGUI_BCG_RGB_B',1])",
		"(profilenamespace getvariable ['IGUI_BCG_RGB_A',0.8])"
	};
};

class tf47_RscStructuredText {
  idc = -1;
  type = CT_STRUCTURED_TEXT;  // defined constant
  style = ST_LEFT;            // defined constant
  colorBackground[] = { 0,0,0,0 };
  colorText[] = {1,1,1,1};
  x = 0.1;
  y = 0.1;
  w = 0.3;
  h = 0.1;
  size = 0.03921;
  text = "";
};

class tf47_RscText
{
    access = 0;
    idc = -1;
    type = 0;
    style = 0;
    linespacing = 1;
    colorBackground[] = {0,0,0,0};
    colorText[] = {1,1,1,.5};
    text = "";
    shadow = 0;
    font = "puristaMedium";
    SizeEx = (0.022	* safezoneH);
    fixedWidth = 0;
    x = 0;
    y = 0;
    h = 0;
    w = 0;

};

class tf47_RscPicture
{
    access = 0;
    idc = -1;
    type = CT_STATIC;
    style = ST_PICTURE;
    colorBackground[] = {0,0,0,0};
    colorText[] = {1,1,1,1};
    font = "puristaMedium";
    sizeEx = 0;
    lineSpacing = 0;
    text = "";
    fixedWidth = 0;
    shadow = 0;
    x = 0;
    y = 0;
    w = 0.2;
    h = 0.15;
};

class tf47_RscButton
{

   access = 0;
    type = CT_BUTTON;
    text = "";
    colorText[] = {1,1,1,1};
    colorDisabled[] = {1,1,1,0.5};
	colorBackgroundDisabled[] = {0,0,0,0.8};
   	//colorFocused[] = {0,0,0,0};
	colorBackground[] = {0,0,0,.5};
	colorFocused[] = {0,0,0,.5};
	colorBackgroundActive[] = {0.75,0.75,0.75,.5};
	colorShadow[] = {0.023529,0,0.0313725,0};
	colorBorder[] = {0.023529,0,0.0313725,0};

    soundEnter[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1};
    soundPush[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0,0};
    soundClick[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.07,1};
    soundEscape[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1};

    style = 2;
    x = 0;
    y = 0;
    w = 0.055589;
    h = 0.039216;
    shadow = 2;
    font = "puristaMedium";
    sizeEx = (0.022	* safezoneH);
    offsetX = 0.003;
    offsetY = 0.003;
    offsetPressedX = 0.002;
    offsetPressedY = 0.002;
    borderSize = 0;
};

class tf47_RscFrame
{
    type = CT_STATIC;
    idc = -1;
    style = ST_FRAME;
    shadow = 2;
    colorBackground[] = {0,0,0,1};
    colorText[] = {0,0,0,1};
    font = "puristaMedium";
    sizeEx = (0.022	* safezoneH);
    text = "";
};

class tf47_CT_XLISTBOX
{
	access = 0; // Control access (0 - ReadAndWrite, 1 - ReadAndCreate, 2 - ReadOnly, 3 - ReadOnlyVerified)
	idc = -1; // Control identification (without it, the control won't be displayed)
	type = CT_XLISTBOX; // Type is 42
	style = SL_HORZ + ST_CENTER + LB_TEXTURES; // Style
	default = 0; // Control selected by default (only one within a display can be used)
	blinkingPeriod = 0; // Time in which control will fade out and back in. Use 0 to disable the effect.

	x = 0;
	y = 0;
	w = 0;
	h = 0;

	color[] = {1,1,1,1}; // Arrow color
	colorActive[] = {1,1,1,1}; // Selected arrow color

	sizeEx = (0.022	* safezoneH); // Text size
	font = "puristaMedium"; // Font from CfgFontFamilies
	shadow = 0; // Shadow (0 - none, 1 - N/A, 2 - black outline)
	colorText[] = {1,1,1,1}; // Text color
	colorSelect[] = {1,1,1,1}; // Selected text color
	colorDisabled[] = {1,1,1,0.5}; // Disabled text color

	tooltip = "tf47_CT_XLISTBOX"; // Tooltip text
	tooltipColorShade[] = {0,0,0,1}; // Tooltip background color
	tooltipColorText[] = {1,1,1,1}; // Tooltip text color
	tooltipColorBox[] = {1,1,1,1}; // Tooltip frame color

	arrowEmpty = "\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa"; // Arrow
	arrowFull = "\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa"; // Arrow when clicked on
	border = "\A3\ui_f\data\gui\cfg\slider\border_ca.paa"; // Fill texture

	soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1}; // Sound played when an item is selected

	onCanDestroy = "";
	onDestroy = "";
	onSetFocus = "";
	onKillFocus = "";
	onKeyDown = "";
	onKeyUp = "";
	onMouseButtonDown = "";
	onMouseButtonUp = "";
	onMouseButtonClick = "";
	onMouseButtonDblClick = "";
	onMouseZChanged = "";
	onMouseMoving = "";
	onMouseHolding = "";

	onLBSelChanged = "";
	onLBDblClick = "";
};

class tf47_CT_LISTBOX
{
	access = 0; // Control access (0 - ReadAndWrite, 1 - ReadAndCreate, 2 - ReadOnly, 3 - ReadOnlyVerified)
	idc = CT_LISTBOX; // Control identification (without it, the control won't be displayed)
	type = CT_LISTBOX; // Type is 5
	style = ST_LEFT + LB_TEXTURES; // Style
	default = 0; // Control selected by default (only one within a display can be used)
	blinkingPeriod = 0; // Time in which control will fade out and back in. Use 0 to disable the effect.

	x = 0;
	y = 0;
	w = 0;
	h = 0;

	colorBackground[] = {0.2,0.2,0.2,1}; // Fill color
	colorSelectBackground[] = {1,0.5,0,1}; // Selected item fill color
	colorSelectBackground2[] = {0,0,0,1}; // Selected item fill color (oscillates between this and colorSelectBackground)

	sizeEx = (0.022	* safezoneH);// Text size
	font = "puristaMedium"; // Font from CfgFontFamilies
	shadow = 0; // Shadow (0 - none, 1 - directional, color affected by colorShadow, 2 - black outline)
	colorText[] = {1,1,1,1}; // Text and frame color
	colorDisabled[] = {1,1,1,0.5}; // Disabled text color
	colorSelect[] = {1,1,1,1}; // Text selection color
	colorSelect2[] = {1,1,1,1}; // Text selection color (oscillates between this and colorSelect)
	colorShadow[] = {0,0,0,0.5}; // Text shadow color (used only when shadow is 1)

	pictureColor[] = {1,0.5,0,1}; // Picture color
	pictureColorSelect[] = {1,1,1,1}; // Selected picture color
	pictureColorDisabled[] = {1,1,1,0.5}; // Disabled picture color

	tooltip = "tf47_CT_LISTBOX"; // Tooltip text
	tooltipColorShade[] = {0,0,0,1}; // Tooltip background color
	tooltipColorText[] = {1,1,1,1}; // Tooltip text color
	tooltipColorBox[] = {1,1,1,1}; // Tooltip frame color

	period = 1; // Oscillation time between colorSelect/colorSelectBackground2 and colorSelect2/colorSelectBackground when selected

	rowHeight = 1.25 * (0.022	* safezoneH); // Row height
	itemSpacing = 0; // Height of empty space between items
	maxHistoryDelay = 1; // Time since last keyboard type search to reset it
	canDrag = 1; // 1 (true) to allow item dragging

	soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1}; // Sound played when an item is selected

	// Scrollbar configuration (applied only when LB_TEXTURES style is used)
	class ListScrollBar //In older games this class is "ScrollBar"
	{
		width = 0; // width of ListScrollBar
		height = 0; // height of ListScrollBar
		scrollSpeed = 0.01; // scroll speed of ListScrollBar

		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa"; // Arrow
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa"; // Arrow when clicked on
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa"; // Slider background (stretched vertically)
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa"; // Dragging element (stretched vertically)

		color[] = {1,1,1,1}; // Scrollbar color
	};

	onCanDestroy = "";
	onDestroy = "";
	onSetFocus = "";
	onKillFocus = "";
	onKeyDown = "";
	onKeyUp = "";
	onMouseButtonDown = "";
	onMouseButtonUp = "";
	onMouseButtonClick = "";
	onMouseButtonDblClick = "";
	onMouseZChanged = "";
	onMouseMoving = "";
	onMouseHolding = "";

	onLBSelChanged = "";
	onLBDblClick = "";
	onLBDrag = "";
	onLBDragging = "";
	onLBDrop = "";
};

class tf47_RscEdit
{
	access = 0;
	type = CT_EDIT;
	style = ST_LEFT+ST_FRAME;
	x = 0;
	y = 0;
	h = 0.04;
	w = 0.2;
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	colorSelection[] = {1,1,1,0.25};
	colorDisabled[] = {1,1,1,0.5}; // Disabled text color
	font = "puristaMedium";
	sizeEx = (0.022	* safezoneH);
	autocomplete = "";
	text = "";
	size = 0.2;
	shadow = 0;
};

class tf47_RscShortcutButton
{
	type = 16;

	class HitZone
	{
		left = 0.0;
		top = 0.0;
		right = 1.0;
		bottom = 1.0;
	};
	class ShortcutPos
	{
		left = 0.005;
		top = 0.005;
		w = 0.0225;
		h = 0.03;
	};
	class TextPos
	{
		left = 0.02;
		top = 0.005;
		right = 0.005;
		bottom = 0.005;
	};
	animTextureNormal = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureDisabled = "#(argb,8,8,3)color(0.3,0.3,0.3,1)";
	animTextureOver = "#(argb,8,8,3)color(0.8,0.3,0,1)";
	animTextureFocused = "#(argb,8,8,3)color(1,0.5,0,1)";
	animTexturePressed = "#(argb,8,8,3)color(1,0,0,1)";
	animTextureDefault = "#(argb,8,8,3)color(0,1,0,1)";
	period = 0.1;
	periodFocus = 0.4;
	periodOver = 0.4;
	shortcuts[] = {};
	textureNoShortcut = "#(argb,8,8,3)color(0,0,0,0)";
	color[] = {0,0,0,0.6};
	color2[] = {0,0,0,1};
	colorDisabled[] = {0,0,0,0.3};
	colorBackground[] = {1,1,1,1};
	colorBackground2[] = {1,1,1,0.5};
	text = "";
	size = 0.04;
	class Attributes
	{
		font = "TahomaB";
		color = "#000000";
		align = "left";
		shadow = 0;
	};
};
class TF47_CT_TREE
{
	access = 0; // Control access (0 - ReadAndWrite, 1 - ReadAndCreate, 2 - ReadOnly, 3 - ReadOnlyVerified)
	idc = CT_TREE; // Control identification (without it, the control won't be displayed)
	type = CT_TREE; // Type is 12
	style = ST_LEFT; // Style
	default = 0; // Control selected by default (only one within a display can be used)
	blinkingPeriod = 0; // Time in which control will fade out and back in. Use 0 to disable the effect.

	x = 0; // Horizontal coordinates
	y = 0; // Vertical coordinates
	w = 0; // Width
	h = 0; // Height

	colorBorder[] = {0,0,0,1}; // Frame color

	colorBackground[] = {0.2,0.2,0.2,1}; // Fill color
	colorSelect[] = {1,0.5,0,1}; // Selected item fill color (when multiselectEnabled is 0)
	colorMarked[] = {1,0.5,0,0.5}; // Marked item fill color (when multiselectEnabled is 1)
	colorMarkedSelected[] = {1,0.5,0,1}; // Selected item fill color (when multiselectEnabled is 1)

	sizeEx = TF47_LINEHEIGTH; // Text size
	font = "puristaMedium"; // Font from CfgFontFamilies
	shadow = 0; // Shadow (0 - none, 1 - N/A, 2 - black outline)
	colorText[] = {1,1,1,1}; // Text color
	colorSelectText[] = {1,1,1,1}; // Selected text color (when multiselectEnabled is 0)
	colorMarkedText[] = {1,1,1,1}; // Selected text color (when multiselectEnabled is 1)

	tooltip = ""; // Tooltip text
	tooltipColorShade[] = {0,0,0,1}; // Tooltip background color
	tooltipColorText[] = {1,1,1,1}; // Tooltip text color
	tooltipColorBox[] = {1,1,1,1}; // Tooltip frame color

	multiselectEnabled = 1; // Allow selecting multiple items while holding Ctrl or Shift
	expandOnDoubleclick = 1; // Expand/collapse item upon double-click
	hiddenTexture = "A3\ui_f\data\gui\rsccommon\rsctree\hiddenTexture_ca.paa"; // Expand icon
	expandedTexture = "A3\ui_f\data\gui\rsccommon\rsctree\expandedTexture_ca.paa"; // Collapse icon
	maxHistoryDelay = 1; // Time since last keyboard type search to reset it

	// Scrollbar configuration
	class ScrollBar
	{
		width = 0; // width of ScrollBar
		height = 0; // height of ScrollBar
		scrollSpeed = 0.01; // scroll speed of ScrollBar

		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa"; // Arrow
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa"; // Arrow when clicked on
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa"; // Slider background (stretched vertically)
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa"; // Dragging element (stretched vertically)

		color[] = {1,1,1,1}; // Scrollbar color
	};

	colorPicture[] = {0,0,0,0};
	colorPictureSelected[] = {0,0,0,0};
	colorPictureDisabled[] = {0,0,0,0};
	colorPictureRight[] = {0,0,0,0};
	colorPictureRightSelected[] = {0,0,0,0};
	colorPictureRightDisabled[] = {0,0,0,0};

	colorDisabled[] = {0,0,0,0}; // Does nothing, but must be present, otherwise an error is shown
	colorArrow[] = {0,0,0,0}; // Does nothing, but must be present, otherwise an error is shown
	/*
	onCanDestroy = "systemChat str ['onCanDestroy',_this]; true";
	onDestroy = "systemChat str ['onDestroy',_this]; false";
	onMouseEnter = "systemChat str ['onMouseEnter',_this]; false";
	onMouseExit = "systemChat str ['onMouseExit',_this]; false";
	onSetFocus = "systemChat str ['onSetFocus',_this]; false";
	onKillFocus = "systemChat str ['onKillFocus',_this]; false";
	onKeyDown = "systemChat str ['onKeyDown',_this]; false";
	onKeyUp = "systemChat str ['onKeyUp',_this]; false";
	onMouseButtonDown = "systemChat str ['onMouseButtonDown',_this]; false";
	onMouseButtonUp = "systemChat str ['onMouseButtonUp',_this]; false";
	onMouseButtonClick = "systemChat str ['onMouseButtonClick',_this]; false";
	onMouseButtonDblClick = "systemChat str ['onMouseButtonDblClick',_this]; false";
	onMouseZChanged = "systemChat str ['onMouseZChanged',_this]; false";
	onMouseMoving = "";
	onMouseHolding = "";

	onTreeSelChanged = "systemChat str ['onTreeSelChanged',_this]; false";
	onTreeLButtonDown = "systemChat str ['onTreeLButtonDown',_this]; false";
	onTreeDblClick = "systemChat str ['onTreeDblClick',_this]; false";
	onTreeExpanded = "systemChat str ['onTreeExpanded',_this]; false";
	onTreeCollapsed = "systemChat str ['onTreeCollapsed',_this]; false";
	//onTreeMouseMove = "systemChat str ['onTreeMouseMove',_this]; false"; // Causing CTD
	//onTreeMouseHold = "systemChat str ['onTreeMouseHold',_this]; false"; // Causing CTD
	onTreeMouseExit = "systemChat str ['onTreeMouseExit',_this]; false";
	*/
};
#include "tf47_battlemanager_dialogs.hpp"
