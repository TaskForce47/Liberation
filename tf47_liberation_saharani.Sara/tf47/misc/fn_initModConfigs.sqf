/*
 * Author: mindbl4ster
 * check wether files with modcfg are present or not
 *
 * Arguments:
 * nothing
 *
 * Return Value:
 * nothing
 *
 * Example:
 *  [] call tf47_misc_fnc_initModConfigs;
 *
 * Public: yes
*/
private _pathToConfigs = "tf47\config\liberation\modconfig\";
tf47_arsenal_modconfig_rhs_usaf = compileFinal preprocessFileLineNumbers (_pathToConfigs + "tf47_config_rhs_usaf.sqf");
tf47_arsenal_modconfig_s4 = compileFinal preprocessFileLineNumbers (_pathToConfigs + "tf47_config_s4Gear.sqf");
tf47_arsenal_modconfig_milGear = compileFinal preprocessFileLineNumbers (_pathToConfigs + "tf47_config_milGear.sqf");
tf47_arsenal_modconfig_niarms = compileFinal preprocessFileLineNumbers (_pathToConfigs + "tf47_config_niarms.sqf");
tf47_arsenal_modconfig_bwa3 = compileFinal preprocessFileLineNumbers (_pathToConfigs + "tf47_config_bwa3.sqf");
tf47_arsenal_modconfig_3cb = compileFinal preprocessFileLineNumbers (_pathToConfigs + "tf47_config_3cb_baf.sqf");
tf47_arsenal_modconfig_ace3 = compileFinal preprocessFileLineNumbers (_pathToConfigs + "tf47_config_ace3.sqf");
tf47_arsenal_modconfig_tfar = compileFinal preprocessFileLineNumbers (_pathToConfigs + "tf47_config_tfar.sqf");
tf47_arsenal_modconfig_bwkk = compileFinal preprocessFileLineNumbers (_pathToConfigs + "tf47_config_bwKleiderkammer.sqf");
tf47_arsenal_modconfig_hafm = compileFinal preprocessFileLineNumbers (_pathToConfigs + "tf47_config_hafm.sqf");

tf47_arsenal_modconfigs =[];
{
  if !(isNil _x) then {tf47_arsenal_modconfigs pushBackUnique _x; };
} forEach [
  /*
    define which mods to use by commenting those you don't need
  */
  "tf47_arsenal_modconfig_rhs_usaf",
  "tf47_arsenal_modconfig_s4",
  "tf47_arsenal_modconfig_milGear",
  "tf47_arsenal_modconfig_niarms",
  "tf47_arsenal_modconfig_bwa3",
  //"tf47_arsenal_modconfig_3cb",
  "tf47_arsenal_modconfig_ace3",
  "tf47_arsenal_modconfig_tfar",
  "tf47_arsenal_modconfig_bwkk",
  "tf47_arsenal_modconfig_hafm"
];
call compileFinal preprocessFileLineNumbers (_pathToConfigs + "tf47_config_radiomodsettings.sqf");
true
