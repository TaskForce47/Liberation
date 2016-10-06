if(GRLIB_endgame == 1 ) exitWith {};
params [["_debug",false]];

/********************************/
/* kill fnc call if there are	*/
/* still bg units active		*/
/********************************/
if ( isNil "TF47_battlegroup_activeGroups" ) then { TF47_battlegroup_activeGroups = 0 };
if(	TF47_battlegroup_activeGroups	>	0)exitWith{};

/********************************/
/* some balancing 				*/
/********************************/
private _players	=	count allPlayers;
private _attackSize = 	"none";
switch(true)do{
	case(_players	>10):{_attackSize 	=	"small";	};
	case(_players	>20):{_attackSize 	=	"medium";	};
	case(_players	>30):{_attackSize	=	"mayhem";	};
	default{if(_debug)then{_attackSize 	=	"small";};};

};
if(_attackSize	==	"none")exitWith{TF47_helper_battlegroupSlumber 	=	TF47_helper_battlegroupSlumber 	+1;};

/********************************/
/* find the point to attack		*/
/********************************/
private _bullseye 	= selectRandom GRLIB_all_fobs;
if(isNil "_bullseye")exitWith{};

if(	air_weight >= 50 || _debug	)then{
	
	// sweep the sky from  boogies
	[_bullseye,0] spawn TF47_battlegroup_combatAirPatrol;

}; 
if(	armor_weight >= 50 || _debug	)then{
	
	// sweep the sky from  boogies
	[_bullseye, 0] spawn TF47_battlegroup_closeairsupport;

};

switch(_attackSize)do{

	case("small"):{
	
		[_bullseye,[],[],_debug] spawn TF47_battlegroup_spawnDropship; sleep 3;
		[_bullseye,[],[],_debug] spawn TF47_battlegroup_spawnDropship;
		
	};
	case("medium"):{
		[_bullseye,[],[],_debug] spawn TF47_battlegroup_spawnDropship; sleep 3;
		[_bullseye,[],[],_debug] spawn TF47_battlegroup_spawnDropship; sleep 3;
		[_bullseye,[],[],_debug] spawn TF47_battlegroup_spawnDropship;
	};
	case("mayhem"):{
		
		[_bullseye,[],[],_debug] spawn TF47_battlegroup_spawnDropship; sleep 3;
		[_bullseye,[],[],_debug] spawn TF47_battlegroup_spawnDropship; sleep 3;
		[_bullseye,[],[],_debug] spawn TF47_battlegroup_spawnDropship; sleep 3;
		[_bullseye,[],[],_debug] spawn TF47_battlegroup_spawnDropship;
	};

};

[ "TF47_planeIncoming",["AN-2"]] remoteExec ["BIS_fnc_showNotification",0];
