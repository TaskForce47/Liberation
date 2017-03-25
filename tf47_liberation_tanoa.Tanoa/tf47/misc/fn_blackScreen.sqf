cutText ["Please turn on your Teamspeak 3 TFAR Plugin and/or switch to the appropriate channel!","BLACK FADED",0.1,true];
player enableSimulation false;

waitUntil { ([] call TFAR_fnc_isTeamSpeakPluginEnabled)	&& ([] call TFAR_fnc_getTeamSpeakChannelName isEqualTo tf_radio_channel_name)	};

player enableSimulation true;
cutText ["","PLAIN",0.25,true];

[] spawn ui_manager;
