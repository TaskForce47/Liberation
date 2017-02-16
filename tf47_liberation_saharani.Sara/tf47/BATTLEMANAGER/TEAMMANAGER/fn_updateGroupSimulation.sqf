private _types	= [
	"Casual",
	"MilSim",
	"SIR, YES SIR!"
];

private _idx = lbCurSel (	(findDisplay 304031) displayCtrl 304059	); 
if(_idx == -1)then{

	_idx = 0;
	private _type = player getVariable ["TF47_TEAMMANAGER_GROUP_SIM","Casual"];
	{
		if(_type isEqualTo _x)then{_idx = _forEachIndex};
		(	(findDisplay 304031) displayCtrl 304059	) lbadd _x;
	}forEach _types;
	
	(	(findDisplay 304031) displayCtrl 304059	) lbSetCurSel _idx;

}else{

	{
		_x setVariable ["TF47_TEAMMANAGER_GROUP_SIM",(_types select _idx),true];
	}forEach units group player;

};

[] call tf47_TeamManager_fnc_updateGroupInfo;

true;