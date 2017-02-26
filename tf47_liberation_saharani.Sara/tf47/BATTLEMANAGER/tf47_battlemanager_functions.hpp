class TF47_TEAMMANAGER
{
	class TEAMMANAGER
	{
		file	="TF47\BATTLEMANAGER\TEAMMANAGER";
		class openTeamManager {};
		class updateUnitsBox {};
		class setTeamName {};
		class setGroupBox {};
		class createNewGroup {};
		class joinGroup {};
		class updateGroupInfo {};
		class updateGroupType {};
		class updateRadio {};
		class updateInsignia {};
		class setInsignia {};
		class updateGroupSimulation {};
		class getGroupTypes {};
		class isGroupTypeAllowed {};
	};
};
class tf47_battlemanager
{
	class battlemanager
	{
		file	="TF47\BATTLEMANAGER\MAINMENU";
		class initBattleManager {};
		class openMainMenuDialog {};
		class destroyMenu {};
	};
};
class tf47_unitTracker
{
	class battlemanager
	{
		file	="TF47\BATTLEMANAGER\UNITTRACKER";
		class openUnitTracker {};
	};
};
class tf47_arsenal
{
	class arsenal
	{
		file	="TF47\BATTLEMANAGER\ARSENAL";
		class openArsenalDialog {};
		class openArsenal {};
		class updateArsenalList {};
		class preInitArsenal {};
		class getGearFromUI {};
		class setGearFromUI {};
		class evalArrayEntries {};
	};
};
