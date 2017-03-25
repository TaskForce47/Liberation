player params ["_unit"];
if( isClass (configFile >> "cfgPatches" >> "task_force_radio" ) )then{
	private _items = assignedItems _unit;
	{
		if("tf" in (_x splitstring "_")	)then{
			_unit unassignitem _x;
			_unit removeitem _x;
		};
		false
	}count _items;
};
['Open',[nil,player,player]] spawn XLA_fnc_arsenal;

waitUntil {!isnull( (uinamespace getvariable ["XLA_fnc_arsenal_cam",objnull]) )};
waitUntil {isnull( (uinamespace getvariable ["XLA_fnc_arsenal_cam",objnull]) )};

[] call tf47_battlemanager_fnc_destroyMenu;

if( isClass (configFile >> "cfgPatches" >> "task_force_radio" ) )then{
	private _items = assignedItems _unit;
	private _state = true;
	{
		if("tf" in (_x splitstring "_")	)then{
			_state = false;
		};
		false
	}count _items;
	if(_state)then{
		(uniformContainer _unit) addItemCargo ["itemRadio",1];	//should now work, thx crewt
		_unit assignitem "itemRadio";
		sleep 5;
		private _items = assignedItems _unit;
		private _state = true;
	};
};
true;
