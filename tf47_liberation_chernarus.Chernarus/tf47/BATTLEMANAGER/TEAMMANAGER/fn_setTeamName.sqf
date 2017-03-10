private _idxG = lbCurSel ((findDisplay 304031) displayCtrl 304033); 
private _idxGrpCtrl = uiNamespace getVariable ["TF47_TEAMMANAGER_GROUPS",[]];

private _grpName = ctrlText ((findDisplay 304031) displayCtrl 304037);

private _grp = _idxGrpCtrl select _idxG;

if( group player isEqualTo _grp )then{

	if( player isEqualTo leader _grp )then{
	
		_grp setGroupIdGlobal [_grpName];
		[] call tf47_TeamManager_fnc_setGroupBox;
		((findDisplay 304031) displayCtrl 304033) lbSetCurSel _idxG;

	};

};

true;