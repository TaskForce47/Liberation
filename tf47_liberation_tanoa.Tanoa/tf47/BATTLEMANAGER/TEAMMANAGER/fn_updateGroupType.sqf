/*
private _types	= [
	"Light Infantry",			//10
	"Motorized Infantry",		//10
	"Mechanized Infantry",		//6-3
	"Airborne Infantry",		//10
	"Marine Infantry",			//14
	"EOD",						//4
	"Reconnaissance",			//4
	"Special Forces",			//10
	"Combat Engineers",			//4
	"CCT",						//1-4
	"FAC/JTAC",					//2
	"MBT",						//3
	"IFV",						//3
	"Field Artillery",			//3
	"Rotatory Wing",			//2-4
	"Fixed Wing",				//1-4
	"Search and Rescue",		//
	"HeadQuarter",				//1-4
	"Support/Logistic"			//
];
*/
private _types = [] call tf47_teamManager_fnc_getGroupTypes;
private _idx = lbCurSel (	(findDisplay 304031) displayCtrl 304043	); 
if(_idx == -1)then{

	_idx = 0;
	private _type = player getVariable ["TF47_TEAMMANAGER_GROUP_TYPE","Recruits"];
	{
		if(_type isEqualTo _x)then{_idx = _forEachIndex};
		(	(findDisplay 304031) displayCtrl 304043	) lbadd _x;
	}forEach _types;
	
	(	(findDisplay 304031) displayCtrl 304043	) lbSetCurSel _idx;

}else{

	{
		_x setVariable ["TF47_TEAMMANAGER_GROUP_TYPE",(_types select _idx),true];
	}forEach units group player;

};

[] call tf47_TeamManager_fnc_updateGroupInfo;

true;