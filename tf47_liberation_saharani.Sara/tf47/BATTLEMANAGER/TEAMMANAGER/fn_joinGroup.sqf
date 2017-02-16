private _idxG = lbCurSel (	(findDisplay 304031) displayCtrl 304033	); 

private _idxGrpCtrl = uiNamespace getVariable ["TF47_TEAMMANAGER_GROUPS",[]];

private _grp = (_idxGrpCtrl select _idxG);
private _maxCount = 100;
private _grpType = (leader _grp) getVariable ["TF47_TEAMMANAGER_GROUP_TYPE","Recruits"];
{
	if( getText (_x >> "displayName") isEqualTo _grpType)exitWith{
	
		_maxCount = getNumber (_x >> "groupSize");
	
	};

}forEach ("true" configClasses (missionConfigFile >> "tf47_battlemanager_squadComposition")	);

if(count units _grp >=	_maxCount)exitWith{systemChat "Group has reached maximum capacitiy already!"};

[player]  joinSilent _grp;

// copy properties of new group
private _newType	=	(leader _grp) getVariable ["TF47_TEAMMANAGER_GROUP_TYPE","Recruits"];
player setVariable ["TF47_TEAMMANAGER_GROUP_TYPE",_newType,true];

private _newVehicle	=	(leader _grp) getVariable ["TF47_TEAMMANAGER_GROUP_SIM","Casual"];
player setVariable ["TF47_TEAMMANAGER_GROUP_SIM",_newVehicle,true];

private _newRadio	=	(leader _grp) getVariable ["TF47_TEAMMANAGER_GROUP_RadioChannel","not set"];
player setVariable ["TF47_TEAMMANAGER_GROUP_RadioChannel",_newRadio,true];

private _newins	=	(leader _grp) getVariable ["bis_fnc_setUnitInsignia_class",""];
player setVariable ["bis_fnc_setUnitInsignia_class",_newins,true];

[] call tf47_TeamManager_fnc_setGroupBox;
[] call tf47_TeamManager_fnc_updateUnitsBox;

true;
