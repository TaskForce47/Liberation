closeDialog 0; //close old dialog

private _return = createDialog 'tf47_TeamManager_mainTeamManager'; 

[] call tf47_TeamManager_fnc_setGroupBox;

// STATIC LB INFO!!!!!!
/*
(	(findDisplay 304031) displayCtrl 304039	) lbAdd "Callsign:";		//0
(	(findDisplay 304031) displayCtrl 304039	) lbAdd "Leader:";	//1
(	(findDisplay 304031) displayCtrl 304039	) lbAdd "Squadsize:";	//2
(	(findDisplay 304031) displayCtrl 304039	) lbAdd "Type:";	//3
(	(findDisplay 304031) displayCtrl 304039	) lbAdd "Simulation:";	//4
(	(findDisplay 304031) displayCtrl 304039	) lbAdd "Radiochannel:";	//5
*/
if(player != leader group player)then{
	//disable some buttons
	(	(findDisplay 304031) displayCtrl 304051	) ctrlEnable false;
	(	(findDisplay 304031) displayCtrl 304053	) ctrlEnable false;
	(	(findDisplay 304031) displayCtrl 304055	) ctrlEnable false;
	(	(findDisplay 304031) displayCtrl 304057	) ctrlEnable false;
	(	(findDisplay 304031) displayCtrl 304061	) ctrlEnable false;
};
[] call tf47_TeamManager_fnc_updateGroupType;
[] call tf47_TeamManager_fnc_updateInsignia;
[] call tf47_TeamManager_fnc_updateGroupSimulation;

true;