private _frequ = ctrlText (	(findDisplay 304031) displayCtrl 304045); //CT_EDIT
{
	_x setVariable ["TF47_TEAMMANAGER_GROUP_RadioChannel",_frequ,true];
}forEach units group player;
[] call tf47_TeamManager_fnc_updateGroupInfo;
true;