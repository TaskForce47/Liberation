private _cfgs = "true" configClasses (missionConfigFile >> "tf47_battlemanager_squadComposition");
private _return = [];
{
	/*
		conditional selections
	*/
	if(
		([_x] call tf47_TEAMMANAGER_fnc_isGroupTypeAllowed)
	)then{
		_return pushBack (	getText (_x >> "displayName") );
	};
}forEach _cfgs;
if(count _return == 0)then{
	{_return pushBack _x; false} count ["Recruits", "Light Infantry", "Reconnaissance", "Rotatory Wing", "Main Battle Tank", "Infantry Fighting Vehicle", "Fixed Wing", "Mortar"];
};
_return;
