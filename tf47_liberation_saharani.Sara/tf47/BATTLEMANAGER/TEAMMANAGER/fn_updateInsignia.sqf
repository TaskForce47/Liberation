private _idx = lbCurSel (	(findDisplay 304031) displayCtrl 304047	); 

if(_idx == -1)then{
	// display was created and needs content
	private _class = player getVariable ["bis_fnc_setUnitInsignia_class",""];
	private _cfgs	=	("true" configClasses (missionConfigFile >> "CfgUnitInsignia")	) +  ("true" configClasses (configFile >> "CfgUnitInsignia")	);
	{
		((findDisplay 304031) displayCtrl 304047) lbAdd getText (_x >> "displayName");	
		if(	_class isEqualTo getText (_x >> "displayName") )then{
			_idx = _forEachIndex;
			private _texture = gettext (_x >> "texture");
			(	(findDisplay 304031) displayCtrl 304049	) ctrlSettext _texture;
		};
	}forEach _cfgs;
	((findDisplay 304031) displayCtrl 304047) lbAdd "NONE";
	if(_idx == -1)then{	
		_idx = count _cfgs;	
		(	(findDisplay 304031) displayCtrl 304049	) ctrlSettext "TF47\BATTLEMANAGER\TEAMMANAGER\empty.paa";
	};
	
	(	(findDisplay 304031) displayCtrl 304047	) lbSetCurSel _idx;
	
}else{
	//display update
	private _class = (	(findDisplay 304031) displayCtrl 304047	) lbText _idx;
	if(_class isEqualTo	"NONE")exitWith{(	(findDisplay 304031) displayCtrl 304049	) ctrlSettext "TF47\BATTLEMANAGER\TEAMMANAGER\empty.paa";};
	private _cfgs	=	("true" configClasses (missionConfigFile >> "CfgUnitInsignia")	) +  ("true" configClasses (configFile >> "CfgUnitInsignia")	);
	{	
		if(	_class isEqualTo getText (_x >> "displayName") )exitWith{
			private _texture = gettext (_x >> "texture");
			(	(findDisplay 304031) displayCtrl 304049	) ctrlSettext _texture;
		};
	}forEach _cfgs;
};

true;