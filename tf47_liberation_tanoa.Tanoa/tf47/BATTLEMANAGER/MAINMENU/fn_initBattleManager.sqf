/*

	author: tf47 mindbl4ster

	description:

		init vars and eh for gui

	parameter:

		nothing

	return:

		nothing

	example

		na

	notes

		na

*/
if( isDedicated || !hasInterface)exitWith{};
	
TF47_BATTLEMANAGER_GROUPMANAGER		=	true;
TF47_BATTLEMANAGER_GROUPTRACKER		= true;
TF47_BATTLEMANAGER_SAFEDISTANCE		=	800;

// add eventhandler for key assignement
waituntil {!isnull (finddisplay 46)};

if( isClass (configFile >> "cfgpatches" >> "ace_main") )then{
	_action = ["TF47_Battlemanager","Open TF47 Battlemanager","",{[] call TF47_BATTLEMANAGER_fnc_openMainMenuDialog; true},{true}] call ace_interact_menu_fnc_createAction;
	[(typeof player), 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToClass;
};
// add key assignment to ctrl + u
(findDisplay 46) displayAddEventHandler ["KeyDown", {
	params ["","_key","_shift","_strg","_alt"];
	if(_key isEqualTo 22	&&	_strg)then{
		[] spawn TF47_BATTLEMANAGER_fnc_openMainMenuDialog;
		true;
	};
}];


//init basic group infovars
PRIVATE _GRP = group player;

private _var = (leader _grp) getVariable ["TF47_TEAMMANAGER_GROUP_TYPE","Recruits"];
if !( _var isEqualTo "Recruits" ) then { player setVariable ["TF47_TEAMMANAGER_GROUP_TYPE",_var,true]; };

_var = (leader _grp) getVariable ["TF47_TEAMMANAGER_GROUP_RadioChannel","not set"];
if !( _var isEqualTo "not set" ) then { player setVariable ["TF47_TEAMMANAGER_GROUP_RadioChannel",_var,true]; };

_var = (leader _grp) getVariable ["bis_fnc_setUnitInsignia_class",""];
if !( _var isEqualTo "" ) then { player setVariable ["bis_fnc_setUnitInsignia_class",_var,true]; };
