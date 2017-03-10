lbClear  (	(findDisplay 304031) displayCtrl 304041	);

private _idxG = lbCurSel ((findDisplay 304031) displayCtrl 304033); 

private _grp = (uiNamespace getVariable ["TF47_TEAMMANAGER_GROUPS",[]]) select _idxG;

(	(findDisplay 304031) displayCtrl 304041	) lbAdd format ["Callsign: %1", (groupID _grp)];
(	(findDisplay 304031) displayCtrl 304041	) lbAdd format ["Leader: %1", (name leader _grp)];
(	(findDisplay 304031) displayCtrl 304041	) lbAdd format ["Groupsize: %1", (str count units _grp)];
(	(findDisplay 304031) displayCtrl 304041	) lbAdd format ["Grouptype: %1", (	(leader _grp) getVariable ["TF47_TEAMMANAGER_GROUP_TYPE","Recruits"])];
//(	(findDisplay 304031) displayCtrl 304041	) lbAdd format ["Simulationlevel: %1", (	(leader _grp) getVariable ["TF47_TEAMMANAGER_GROUP_SIM","Casual"])];
(	(findDisplay 304031) displayCtrl 304041	) lbAdd format ["Radiofrequencies: %1",(	(leader _grp) getVariable ["TF47_TEAMMANAGER_GROUP_RadioChannel","not set"])];

private _class = (leader _grp) getVariable ["bis_fnc_setUnitInsignia_class",""];
if(_class isEqualTo	"")exitWith{(	(findDisplay 304031) displayCtrl 304049	) ctrlSettext "TF47\BATTLEMANAGER\TEAMMANAGER\empty.paa"; true;};
private _cfgs	=	("true" configClasses (missionConfigFile >> "CfgUnitInsignia")	) +  ("true" configClasses (configFile >> "CfgUnitInsignia")	);
{	
	if(	_class isEqualTo getText (_x >> "displayName") )exitWith{
		private _texture = gettext (_x >> "texture");
		(	(findDisplay 304031) displayCtrl 304049	) ctrlSettext _texture;
	};
}forEach _cfgs;
true;