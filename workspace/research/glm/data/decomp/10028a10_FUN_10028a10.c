// 10028a10 size=702 FUN_10028a10

void FUN_10028a10(void)

{
  DAT_10696be0 = (*(code *)RI_Dvar_RegisterFloat)("r_sunsprite_shader",&DAT_101968dc,0x2000);
  DAT_10696c2c = (*(code *)RI_Dvar_RegisterInt)
                           ("r_sunsprite_size",0x41800000,0x3f800000,0x447a0000,0x2000);
  DAT_10696c24 = (*(code *)RI_Dvar_RegisterFloat)("r_sunflare_shader","sun_flare",0x2000);
  DAT_10696bdc = (*(code *)RI_Dvar_RegisterInt)("r_sunflare_min_size",0,0,0x461c4000,0x2000);
  DAT_10696c1c = (*(code *)RI_Dvar_RegisterInt)
                           ("r_sunflare_min_angle",0x42340000,0,0x42b40000,0x2000);
  DAT_10696c20 = (*(code *)RI_Dvar_RegisterInt)
                           ("r_sunflare_max_size",0x451c4000,0,0x461c4000,0x2000);
  DAT_10696c0c = (*(code *)RI_Dvar_RegisterInt)
                           ("r_sunflare_max_angle",0x40000000,0,0x42b40000,0x2000);
  DAT_10696c04 = (*(code *)RI_Dvar_RegisterInt)
                           ("r_sunflare_max_alpha",0x3f800000,0,0x3f800000,0x2000);
  DAT_10696bf8 = (*(code *)RI_Dvar_RegisterInt)("r_sunflare_fadein",0x3f800000,0,0x42700000,0x2000);
  DAT_10696c00 = (*(code *)RI_Dvar_RegisterInt)("r_sunflare_fadeout",0x3f800000,0,0x42700000,0x2000)
  ;
  DAT_10696be4 = (*(code *)RI_Dvar_RegisterInt)
                           ("r_sunblind_min_angle",0x41f00000,0,0x42b40000,0x2000);
  DAT_10696c10 = (*(code *)RI_Dvar_RegisterInt)
                           ("r_sunblind_max_angle",0x40a00000,0,0x42b40000,0x2000);
  DAT_10696c08 = (*(code *)RI_Dvar_RegisterInt)
                           ("r_sunblind_max_darken",0x3f400000,0,0x3f800000,0x2000);
  DAT_10696bfc = (*(code *)RI_Dvar_RegisterInt)("r_sunblind_fadein",0x3f000000,0,0x42700000,0x2000);
  DAT_10696be8 = (*(code *)RI_Dvar_RegisterInt)("r_sunblind_fadeout",0x40400000,0,0x42700000,0x2000)
  ;
  DAT_10696c18 = (*(code *)RI_Dvar_RegisterInt)
                           ("r_sunglare_min_angle",0x41f00000,0,0x42b40000,0x2000);
  DAT_10696c14 = (*(code *)RI_Dvar_RegisterInt)
                           ("r_sunglare_max_angle",0x40a00000,0,0x42b40000,0x2000);
  DAT_10696c30 = (*(code *)RI_Dvar_RegisterInt)
                           ("r_sunglare_max_lighten",0x3f400000,0,0x3f800000,0x2000);
  DAT_10696bf0 = (*(code *)RI_Dvar_RegisterInt)("r_sunglare_fadein",0x3f000000,0,0x42700000,0x2000);
  DAT_10696bf4 = (*(code *)RI_Dvar_RegisterInt)("r_sunglare_fadeout",0x40400000,0,0x42700000,0x2000)
  ;
  DAT_10696bec = (*(code *)RI_Dvar_RegisterVec2)
                           ("r_sun_fx_position",0,0,0,0xc3b40000,0x43b40000,0x2000);
  return;
}


