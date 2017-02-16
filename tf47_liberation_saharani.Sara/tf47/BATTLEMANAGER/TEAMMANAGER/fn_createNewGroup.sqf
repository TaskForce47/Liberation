private _grp = createGroup (side player);
[player]  joinSilent _grp;

(	(findDisplay 304031) displayCtrl 304051	) ctrlEnable true;
(	(findDisplay 304031) displayCtrl 304053	) ctrlEnable true;
(	(findDisplay 304031) displayCtrl 304055	) ctrlEnable true;
(	(findDisplay 304031) displayCtrl 304057	) ctrlEnable true;
(	(findDisplay 304031) displayCtrl 304061	) ctrlEnable true;

player setVariable ["TF47_ROLESELECTION_SEL_ROLE","",true];
player setVariable ["TF47_TEAMMANAGER_GROUP_TYPE","Recruits",true];

[] call tf47_TeamManager_fnc_setGroupBox;
[] call tf47_TeamManager_fnc_updateUnitsBox;
true;