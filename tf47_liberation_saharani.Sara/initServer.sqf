if(isNil "TF47_Missionarray")then{ TF47_Missionarray = []; };
addMissionEventHandler ["HandleDisconnect",{
  waitUntil {
    !(isPlayer (_this select 0))
  };
  if(alive (_this select 0))then{
    deleteVehicle (_this select 0);
  };
}];
