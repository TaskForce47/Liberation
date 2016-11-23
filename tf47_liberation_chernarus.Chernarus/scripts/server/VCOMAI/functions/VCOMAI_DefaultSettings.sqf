VCOMAI_Func = {
	//Variable for enabling/disabling skill changes for AI. True is on, False is off.
	VCOM_AISkillEnabled = true;
	//Variable for finding out which config was loaded.
	VCOM_AIConfig = "Userconfig folder";
	//Turn this on to see certain debug messages
	VCOM_AIDEBUG = 0;
	//Turn on map markers that track AI movement
	VCOM_UseMarkers = false;
	//Turns off VCOMAI for AI units in a players squad
	NOAI_FOR_PLAYERLEADERS = 1;
	//Will AI garrison static weapons nearby?
	VCOM_STATICGARRISON = 1;
	//How far can the AI hear gunshots from?
	VCOM_HEARINGDISTANCE = 650;
	//Should AI be able to call for artillery. 1 = YES 0 = NO
	VCOM_Artillery = 1;
	//Should we let AI use flanking manuevers? false means they can flank
	VCOM_NOPATHING = false;
	//Should AI use smoke grenades? Besides default A3 behavior?
	VCOM_USESMOKE = true;
	//Chance of AI using grenades
	VCOM_GRENADECHANCE = 40;
	//Should the AI lay mines?
	VCOM_MineLaying = true;
	//Chance of AI to lay a mine.
	VCOM_MineLayChance = 40;

	//The longer an AIs target stays in 1 location, the more accurate and aware of the target the AI becomes. DEFAULT = [WEST,EAST,RESISTANCE];
	VCOM_IncreasingAccuracy = true;
	//VCOM_SideBasedMovement- Remove sides from the array below to force that specific AI side to not execute any advance movement code. (I.E. Moving to reinforce allies, being alerted by distant gunshots and etc). AI with this will still react normally in combat. DEFAULT = [WEST,EAST,RESISTANCE];
	VCOM_SideBasedMovement = [WEST,EAST,RESISTANCE];
	//VCOM_SideBasedExecution- Remove sides from the array below to remove that specific AI side from executing any of the VCOMAI scripts at all. DEFAULT = [WEST,EAST,RESISTANCE];
	VCOM_SideBasedExecution = [WEST,EAST,RESISTANCE];
	//Distance AI will respond to call of help from each other
	VCOM_Unit_AIWarnDistance = 750;

	//The following commands are to be left alone, except under rare circumstances.
	MarkerArray = [];
	VcomAI_UnitQueue = [];
	VcomAI_ActiveList = [];
	ArtilleryArray = [];
	

	//AI ACCURACY SETTINGS - You can change these numbers below
	//Colonel Level AI
	AccuracyFunctionRank6 = {
		_Unit = _this select 0;

		_Unit setSkill ["aimingAccuracy",(0.35 + (random 0.48))];
		_Unit setSkill ["aimingShake",(0.65 + (random 0.45))];
		_Unit setSkill ["spotDistance",0.8];
		_Unit setSkill ["spotTime",0.4];
		_Unit setSkill ["courage",1];
		_Unit setSkill ["commanding",1];
		_Unit setSkill ["aimingSpeed",0.6];
		_Unit setSkill ["general",0.88];
		_Unit setSkill ["endurance",1];
		_Unit setSkill ["reloadSpeed",1];
	};
	//Major Level AI
	AccuracyFunctionRank5 = {
		_Unit = _this select 0;

		_Unit setSkill ["aimingAccuracy",(0.35 + (random 0.48))];
		_Unit setSkill ["aimingShake",(0.65 + (random 0.45))];
		_Unit setSkill ["spotDistance",0.8];
		_Unit setSkill ["spotTime",0.4];
		_Unit setSkill ["courage",1];
		_Unit setSkill ["commanding",.88];
		_Unit setSkill ["aimingSpeed",0.6];
		_Unit setSkill ["general",0.88];
		_Unit setSkill ["endurance",1];
		_Unit setSkill ["reloadSpeed",1];
	};
	//Captain Level AI
	AccuracyFunctionRank4 = {
		_Unit = _this select 0;

		_Unit setSkill ["aimingAccuracy",(0.35 + (random 0.68))];
		_Unit setSkill ["aimingShake",(0.65 + (random 0.38))];
		_Unit setSkill ["spotDistance",0.8];
		_Unit setSkill ["spotTime",0.4];
		_Unit setSkill ["courage",1];
		_Unit setSkill ["commanding",1];
		_Unit setSkill ["aimingSpeed",0.6];
		_Unit setSkill ["general",0.88];
		_Unit setSkill ["endurance",1];
		_Unit setSkill ["reloadSpeed",1];
	};
	//Lieutenant Level AI
	AccuracyFunctionRank3 = {
		_Unit = _this select 0;

		_Unit setSkill ["aimingAccuracy",(0.35 + (random 0.48))];
		_Unit setSkill ["aimingShake",(0.64 + (random 0.36))];
		_Unit setSkill ["spotDistance",0.8];
		_Unit setSkill ["spotTime",0.4];
		_Unit setSkill ["courage",1];
		_Unit setSkill ["commanding",1];
		_Unit setSkill ["aimingSpeed",0.6];
		_Unit setSkill ["general",0.88];
		_Unit setSkill ["endurance",1];
		_Unit setSkill ["reloadSpeed",1];
	};
	//Sergeant Level AI
	AccuracyFunctionRank2 = {
		_Unit = _this select 0;

		_Unit setSkill ["aimingAccuracy",(0.30 + (random 0.4))];
		_Unit setSkill ["aimingShake",(0.55 + (random 0.45))];
		_Unit setSkill ["spotDistance",0.8];
		_Unit setSkill ["spotTime",0.4];
		_Unit setSkill ["courage",(0.56 + (random 0.24))];
		_Unit setSkill ["commanding",1];
		_Unit setSkill ["aimingSpeed",0.6];
		_Unit setSkill ["general",0.88];
		_Unit setSkill ["endurance",1];
		_Unit setSkill ["reloadSpeed",1];
	};
	//Corporal Level AI
	AccuracyFunctionRank1 = {
		_Unit = _this select 0;

		_Unit setSkill ["aimingAccuracy",(0.30 + (random 0.4))];
		_Unit setSkill ["aimingShake",(0.55 + (random 0.45))];
		_Unit setSkill ["spotDistance",0.8];
		_Unit setSkill ["spotTime",0.4];
		_Unit setSkill ["courage",(0.56 + (random 0.24))];
		_Unit setSkill ["commanding",1];
		_Unit setSkill ["aimingSpeed",0.6];
		_Unit setSkill ["general",0.88];
		_Unit setSkill ["endurance",1];
		_Unit setSkill ["reloadSpeed",1];
	};
	//Private Level AI
	AccuracyFunctionRank0 = {
		_Unit = _this select 0;

		_Unit setSkill ["aimingAccuracy",(0.30 + (random 0.4))];
		_Unit setSkill ["aimingShake",(0.55 + (random 0.45))];
		_Unit setSkill ["spotDistance",0.8];
		_Unit setSkill ["spotTime",(0.56 + (random 0.24))];
		_Unit setSkill ["courage",(0.56 + (random 0.24))];
		_Unit setSkill ["commanding",1];
		_Unit setSkill ["aimingSpeed",0.6];
		_Unit setSkill ["general",0.88];
		_Unit setSkill ["endurance",1];
		_Unit setSkill ["reloadSpeed",1];
	};
};