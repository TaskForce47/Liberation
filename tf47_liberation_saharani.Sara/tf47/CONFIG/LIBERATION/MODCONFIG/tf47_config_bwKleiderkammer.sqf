params [["_entryToGet",""]];

if(_entryToGet isEqualTo "")exitWith {[]};
if !(isClass (configFile >> "cfgPatches" >> "PBW_German_Chests") )exitWith{[]};

private _return = switch tolower _entryToGet do {
  case("lv"):{[]};
  case("hv"):{[]};
  case("av"):{[]};
  case("sv"):{[]};
  case("st"):{[]};
  case("w"):{[]};
  case("m"):{[]};
  case("i"):{
    [
      'PBW_sem52sl',
      'PBW_barett_fespaeh',
      'PBW_barett_art',
      'PBW_barett_fm',
      'PBW_barett_ksk',
      'PBW_barett_nsch',
      'PBW_barett_pi',
      'PBW_barett_san',
      'PBW_Buschhut_fleck',
      'PBW_Buschhut_tropen',
      'PBW_muetze1_fleck',
      'PBW_muetze2_fleck',
      'PBW_muetze1_tropen',
      'PBW_muetze2_tropen',
      'PBW_muetze3_grau',
      'PBW_Helm2_fleck',
      'PBW_Helm1_fleck',
      'PBW_Helm1_tropen',
      'PBW_Helm2_fleck_H',
      'PBW_Helm1_fleck_H',
      'PBW_Helm1_tropen_H',
      'PBW_Helm1_fleck_HBO',
      'PBW_Helm1_fleck_HBOD',
      'PBW_Helm1_tropen_HBO',
      'PBW_Helm1_tropen_HBOD',
      'PBW_Helm3_fleck',
      'PBW_Helm3_tropen',
      'PBW_Helm3_UN',
      'PBW_Helm6_fleck',
      'PBW_Helm6_tropen',
      'PBW_b828_fleck',
      'PBW_b828_tropen',
      'PBW_Helm5_fleck',
      'PBW_Helm4_fleck',
      'PBW_Helm4_tropen',
      'PBW_Helm5_fleck_H',
      'PBW_Helm4_fleck_H',
      'PBW_Helm4_tropen_H',
      'PBW_Helm4_fleck_HBO',
      'PBW_Helm4_fleck_HBOD',
      'PBW_Helm4_tropen_HBO',
      'PBW_Helm4_tropen_HBOD',
      'PBW_Uniform1_fleck',
      'PBW_Uniform1_tropen',
      'PBW_Uniform1H_fleck',
      'PBW_Uniform1H_tropen',
      'PBW_Uniform2_fleck',
      'PBW_Uniform2_tropen',
      'PBW_Uniform3K_fleck',
      'PBW_Uniform3K_tropen',
      'PBW_Uniform3_fleck',
      'PBW_Uniform3_tropen',
      'PBW_Uniform4K_fleck',
      'PBW_Uniform4K_tropen',
      'PBW_Uniform4_fleck',
      'PBW_Uniform4_tropen',
      'pbw_koppel_grpfhr',
      'pbw_koppel_mg',
      'pbw_koppel_mg_h',
      'pbw_koppel_sani',
      'pbw_koppel_schtz',
      'pbw_splitter_grpfhr',
      'pbw_splitter_mg',
      'pbw_splitter_mg_h',
      'pbw_splitter_sani',
      'pbw_splitter_schtz',
      'pbw_splitter_zivil'
    ]
  };
  case("b"):{[]};
  default{[]};
};
_return
