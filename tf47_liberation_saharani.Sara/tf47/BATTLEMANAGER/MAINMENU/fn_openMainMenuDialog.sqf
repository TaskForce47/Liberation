// note: dialogs can not be combined in an overlay fashion
/*
private _handle = ppEffectCreate ["DynamicBlur", 401];
_handle ppEffectEnable true;
_handle ppEffectAdjust [10];
_handle ppEffectCommit 0;
uinamespace setVariable ["tf47_battlemanager_ppEffects",_handle];
*/
#define CTRL_SQUAD (	(findDisplay 303031) displayCtrl 303035	)
#define CTRL_TRACKER (	(findDisplay 303031) displayCtrl 303037	)
#define CTRL_ARSENAL (	(findDisplay 303031) displayCtrl 303039	)

player enableSimulationGlobal false;
private _diagHandle	=	createDialog "tf47_TeamManager_mainMenu";

CTRL_SQUAD ctrlEnable false; //squadmanager
//(	(findDisplay 303031) displayCtrl 303037	) ctrlEnable false; //unittracker
CTRL_ARSENAL ctrlEnable false; //roleselection



//check which option is available
private _fobs = +GRLIB_all_fobs;
_fobs pushBack (getMarkerPos "respawn_west");
_fobs = _fobs apply { _x distance2D player };
_fobs sort true; //asscending
_fobs = _fobs select 0;

private _baseCondition	=	if (markerType "respawn_west" isEqualTo "")then{
	alive player
}else{
	alive player && (_fobs < TF47_BATTLEMANAGER_SAFEDISTANCE);
};

if (_baseCondition)then{
	CTRL_SQUAD ctrlEnable true; //squadmanager
	//CTRL_TRACKER ctrlEnable true; //tracker
	CTRL_ARSENAL ctrlEnable true; //arsenal
};
