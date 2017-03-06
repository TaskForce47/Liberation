while {	!( ([] call TFAR_fnc_isTeamSpeakPluginEnabled)	&& ([] call TFAR_fnc_getTeamSpeakChannelName isEqualTo tf_radio_channel_name))	}do{
  cutText ["Please turn on your Teamspeak 3 TFAR Plugin and/or switch to the appropriate channel!","BLACK FADED",0.1,true];
  player enableSimulation false;
  sleep 0.1;
};
player enableSimulation true;
cutText ["","PLAIN",0.25,true];
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\ui\ui_manager.sqf";
