if(isNil "TF47_Missionarray")then{ TF47_Missionarray = []; };
addMissionEventHandler ["EntityKilled",{
  if( [TF47_helper_playerFaction,0] call BIS_fnc_respawnTickets == 0 )then{
    profileNamespace    setVariable ["GRLIB_save_key",nil];
    saveProfileNamespace;
    "missionFailed" call bis_fnc_endmissionServer;
  };
}];
addMissionEventHandler ["HandleDisconnect",{
  if ( (_this select 0) getVariable ["ace_isunconscious", false] )then{
    [TF47_helper_playerFaction,-1] call BIS_fnc_respawnTickets;
  };
}];
