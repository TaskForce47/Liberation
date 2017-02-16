closeDialog 0; //close old dialog

private _return = createDialog 'tf47_UnitTracker_mainMenu';

lbClear (	(findDisplay 305031) displayCtrl 305033	);

{
	if(side _x == side player)then{

		if(count units _x >0)then{
			private _str = format [
				"%5  |  %1  |  (%2) %3  |  %4",
				groupID _x,
				count units _x,
				name leader _x,
				(leader _x) getVariable ["TF47_TEAMMANAGER_GROUP_RadioChannel","not set"],
				(leader _x) getVariable ["TF47_TEAMMANAGER_GROUP_TYPE","Recruits"]
			];
			(	(findDisplay 305031) displayCtrl 305033	) lbAdd _str;
		};
	};
}forEach (allGroups select {leader _x in allPlayers} );

true;
