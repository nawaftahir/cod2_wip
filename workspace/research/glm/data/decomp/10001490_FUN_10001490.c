// 10001490 size=285 FUN_10001490

void FUN_10001490(void)

{
  int unaff_ESI;
  
  (*(code *)RI_Dvar_SetInt)(DAT_101ce73c,*(undefined4 *)(unaff_ESI + 0x40));
  (*(code *)RI_Dvar_SetInt)(DAT_101ce5fc,*(undefined4 *)(unaff_ESI + 0x50));
  (*(code *)RI_Dvar_SetInt)(DAT_101ce604,*(undefined4 *)(unaff_ESI + 0x54));
  (*(code *)RI_Dvar_SetString)
            (DAT_101ce6d8,*(undefined4 *)(unaff_ESI + 0x44),*(undefined4 *)(unaff_ESI + 0x48),
             *(undefined4 *)(unaff_ESI + 0x4c),0x3f800000);
  (*(code *)RI_Dvar_SetString)
            (DAT_101ce778,*(undefined4 *)(unaff_ESI + 0x58),*(undefined4 *)(unaff_ESI + 0x5c),
             *(undefined4 *)(unaff_ESI + 0x60),0x3f800000);
  (*(code *)RI_Dvar_SetString)
            (DAT_101ce768,*(undefined4 *)(unaff_ESI + 100),*(undefined4 *)(unaff_ESI + 0x68),
             *(undefined4 *)(unaff_ESI + 0x6c),0x3f800000);
  (*(code *)RI_Dvar_SetVec2)
            (DAT_101ce728,*(undefined4 *)(unaff_ESI + 0x74),*(undefined4 *)(unaff_ESI + 0x78),
             *(undefined4 *)(unaff_ESI + 0x7c));
  (*(code *)RI_Dvar_UnregisterSystem)(DAT_101ce73c,*(undefined4 *)(DAT_101ce73c + 8));
  (*(code *)RI_Dvar_UnregisterSystem)(DAT_101ce5fc,*(undefined4 *)(DAT_101ce5fc + 8));
  (*(code *)RI_Dvar_UnregisterSystem)(DAT_101ce604,*(undefined4 *)(DAT_101ce604 + 8));
  (*(code *)RI_Dvar_UnregisterSystem)(DAT_101ce6d8,*(undefined4 *)(DAT_101ce6d8 + 8));
  (*(code *)RI_Dvar_UnregisterSystem)(DAT_101ce778,*(undefined4 *)(DAT_101ce778 + 8));
  (*(code *)RI_Dvar_UnregisterSystem)(DAT_101ce768,*(undefined4 *)(DAT_101ce768 + 8));
  (*(code *)RI_Dvar_UnregisterSystem)(DAT_101ce728,*(undefined4 *)(DAT_101ce728 + 8));
  return;
}


