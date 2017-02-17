params ["_side",["_grp",nil]];
private _grpNew	=	createGroup	_side;
if(!isNil "_grp")then{
  (units _grp)	joinSilent	_grpNew;
};
deleteGroup _grp;
_grpNew;
