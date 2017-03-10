private _idxG = lbCurSel ((findDisplay 304031) displayCtrl 304033); 

lbClear  (	(findDisplay 304031) displayCtrl 304035	);

private _idxGrpCtrl = uiNamespace getVariable ["TF47_TEAMMANAGER_GROUPS",[]];

private _unitList = [];

{
	(	(findDisplay 304031) displayCtrl 304035	) lbAdd (name _x);
	private _color = [1,1,1,1];
	switch(assignedTeam _x)do{
		case ("MAIN") : {_color = [1,1,1,1];};
		case ("RED") : {_color = [0.9,0,0,1];};
		case ("GREEN") : {_color = [0,0.8,0,1];};
		case ("BLUE") : {_color = [0,0,.8,1];};
		case ("YELLOW") : {_color = [0.85,0.85,0,1];};
	};
	(	(findDisplay 304031) displayCtrl 304035	) lbSetColor [_forEachIndex, _color];
	_unitList	pushBack _x;
}forEach units (_idxGrpCtrl select _idxG);

uiNamespace setVariable ["TF47_TEAMMANAGER_UNITS",_unitList];
[] call tf47_TeamManager_fnc_updateGroupInfo;
true;