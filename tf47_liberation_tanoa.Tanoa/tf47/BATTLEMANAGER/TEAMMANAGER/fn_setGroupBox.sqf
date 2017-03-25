lbClear  ((findDisplay 304031) displayCtrl 304033);

private _idxGrpCtrl	=	[];
private _idPlayerGrp = 0;
private _sidePlayer	=	side player;

{
	if(side _x == _sidePlayer)then{
		if(count units _x !=0)then{
			private _grp = _x;
			private _units	=	units _grp;
			{
				if(_x in _units)exitWith{
					((findDisplay 304031) displayCtrl 304033) lbAdd (groupID _grp);
					_idxGrpCtrl pushBack _grp;
					if(player in _units)then{ _idPlayerGrp = _forEachIndex; };
				};
			}forEach allPlayers;
		};	
	};
}forEach allGroups;

uiNamespace setVariable ["TF47_TEAMMANAGER_GROUPS",_idxGrpCtrl];

((findDisplay 304031) displayCtrl 304033) lbSetCurSel _idPlayerGrp; //onLBSelChanged = ""; triggers with setting this value. -> updateUnitsBox

[] call tf47_TeamManager_fnc_updateGroupInfo;

true;