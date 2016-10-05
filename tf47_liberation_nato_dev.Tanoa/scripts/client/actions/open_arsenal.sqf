private [ "_loadouts_data", "_saved_loadouts", "_counter", "_loadplayers", "_playerselected", "_namestr", "_nextplayer" ];

load_loadout = 0;
edit_loadout = 0;
respawn_loadout = 0;
load_from_player = -1;
exit_on_load = 0;
//_saved_loadouts = profileNamespace getVariable "bis_fnc_saveInventory_data"; //no need for that as i don't see any interaction, useless performacneloss
load_loadout = 0;
_frequency = 31;
params ["_unit"];
private _items = assignedItems _unit;
{

	if("tf" in (_x splitstring "_")	)then{
		_unit unassignitem _x;
		_unit removeitem _x;
	};

}forEach _items;


[ "Open", false ] spawn BIS_fnc_arsenal;

waitUntil {!isnull( uinamespace getvariable "RSCDisplayArsenal" )};	//because fucking scheduler is over the top!!!
waitUntil {isnull( uinamespace getvariable "RSCDisplayArsenal" )};	//should work now like expected, no need to open+close inventory

[] call tf47_fnc_forceArsenal;
private _items = assignedItems _unit;
private _state = true;
{
	if("tf" in (_x splitstring "_")	)then{
		_state = false;
		
	};
}forEach _items;
if(_state)then{ 

	(uniformContainer _unit) addItemCargo ["itemRadio",1];	//should now work, thx crewt
	_unit assignitem "itemRadio"; 
	
	sleep 5;
	private _items = assignedItems _unit;
	private _state = true;	
};
// wtf?
if ((_unit getVariable ["Ace_medical_medicClass",  0]) > 0 ) then {
	if ((secondaryWeapon _unit) != "") then {
		_unit removeWeapon (secondaryWeapon _unit);

		_waiting = 200 + random 300;
		[
			{
				if (secondaryWeapon (_this select 0) != "") then {
					(_this select 0) removeWeapon (secondaryWeapon (_this select 0));
				};
			}, 
			[_unit], 
			_waiting
		] call CBA_fnc_waitAndExecute;
	};
};