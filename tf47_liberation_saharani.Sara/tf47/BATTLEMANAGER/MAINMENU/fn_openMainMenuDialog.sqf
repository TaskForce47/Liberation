// note: dialogs can not be combined in an overlay fashion
/*
private _handle = ppEffectCreate ["DynamicBlur", 401];
_handle ppEffectEnable true;
_handle ppEffectAdjust [10];
_handle ppEffectCommit 0;
uinamespace setVariable ["tf47_battlemanager_ppEffects",_handle];
*/
player enableSimulationGlobal false;

private _diagHandle	=	createDialog "tf47_TeamManager_mainMenu";

(	(findDisplay 303031) displayCtrl 303035	) ctrlEnable false; //squadmanager
//(	(findDisplay 303031) displayCtrl 303037	) ctrlEnable false; //unittracker
(	(findDisplay 303031) displayCtrl 303039	) ctrlEnable false; //roleselection
(	(findDisplay 303031) displayCtrl 303041	) ctrlEnable false; //refill
(	(findDisplay 303031) displayCtrl 303043	) ctrlEnable false; //arsenal
(	(findDisplay 303031) displayCtrl 303047	) ctrlEnable false;	//veh spawner
//(	(findDisplay 303031) displayCtrl 303049	) ctrlEnable false;	//veh tracker
(	(findDisplay 303031) displayCtrl 303057	) ctrlEnable false;	//dev
(	(findDisplay 303031) displayCtrl 303055	) ctrlEnable false;	//admin


//check which option is available

private _baseCondition	=	if (markerType "respawn_west" isEqualTo "")then{ 
	alive player
}else{
	alive player && ((getMarkerPos "respawn_west" distance player) < TF47_BATTLEMANAGER_SAFEDISTANCE);
};

if (_baseCondition)then{
	(	(findDisplay 303031) displayCtrl 303035	) ctrlEnable true; //squadmanager
	(	(findDisplay 303031) displayCtrl 303039	) ctrlEnable true; //roleselection
	(	(findDisplay 303031) displayCtrl 303041	) ctrlEnable true; //refill
	(	(findDisplay 303031) displayCtrl 303043	) ctrlEnable true; //arsenal
	(	(findDisplay 303031) displayCtrl 303047	) ctrlEnable true;	//veh spawner
};

if(player getVariable ["TF47_BATTLEMANAGER_TEAMLEADER",false])then{
 (	(findDisplay 303031) displayCtrl 303055	) ctrlEnable true;	//admin
};
if(player getVariable ["TF47_BATTLEMANAGER_DEVELOPMER",false])then{
 (	(findDisplay 303031) displayCtrl 303057	) ctrlEnable true;	//admin
};