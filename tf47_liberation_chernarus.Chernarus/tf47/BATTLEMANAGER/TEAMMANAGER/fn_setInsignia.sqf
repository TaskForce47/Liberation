private _idx = lbCurSel (	(findDisplay 304031) displayCtrl 304047	); 
private _class = (	(findDisplay 304031) displayCtrl 304047	) lbText _idx;
private _texture = ctrltext (	(findDisplay 304031) displayCtrl 304049	);
{
	_x setVariable ["bis_fnc_setUnitInsignia_class",_class,true];
	private _index = -1;
	{
		if (_x == "insignia") exitwith {_index = _foreachindex;};
	} foreach getarray (configfile >> "CfgVehicles" >> gettext (configfile >> "CfgWeapons" >> uniform _x >> "ItemInfo" >> "uniformClass") >> "hiddenSelections");

	if (_index < 0) then {
		//["'insignia' hidden selection not found on object of type '%1'",typeof _unit] call bis_fnc_error;
		false
	} else {
		_x setobjecttextureglobal [_index,_texture];
		true
	};
}forEach units group player;

true;