// 1000d680 size=510 FUN_1000d680

void FUN_1000d680(void)

{
  bool bVar1;
  uint uVar2;
  uint uVar3;
  uint uVar4;
  bool bVar5;
  
  uVar2 = FUN_1002bf50();
  uVar3 = (*(code *)RI_Dvar_GetBool)("sys_sysMB");
  if (*(char *)(DAT_101ce704 + 8) != '\0') {
    (*(code *)RI_Printf)(0,"Picmip is set manually.\n");
    DAT_101d0a68 = *(uint *)(DAT_101ce5f8 + 8);
    DAT_101d0a6c = *(uint *)(DAT_101ce6c0 + 8);
    DAT_101d0a70 = *(uint *)(DAT_101ce7d4 + 8);
    goto LAB_1000d823;
  }
  uVar4 = 2;
  if (*(int *)(DAT_101ce708 + 8) == 2) {
    (*(code *)RI_Printf)(0,"Texture detail is set automatically for DirectX 7.\n");
    if (uVar2 < 100) {
      if (uVar2 < 0x1c) {
        DAT_101d0a68 = 2;
        DAT_101d0a6c = 2;
        DAT_101d0a70 = 2;
      }
      else {
        DAT_101d0a68 = 1;
        DAT_101d0a6c = 1;
        DAT_101d0a70 = 1;
      }
    }
    else {
      DAT_101d0a68 = 0;
      DAT_101d0a6c = 0;
      DAT_101d0a70 = 0;
    }
    bVar5 = uVar3 < 0x180;
LAB_1000d7da:
    if (!bVar5) goto LAB_1000d823;
    uVar4 = 1;
  }
  else {
    (*(code *)RI_Printf)(0,"Texture detail is set automatically.\n");
    if (uVar2 < 300) {
      if (uVar2 < 0xf0) {
        if (uVar2 < 0xbe) {
          DAT_101d0a68 = 1;
          if (uVar2 < 0x96) {
            if (uVar2 < 0x82) {
              DAT_101d0a6c = 2;
              if (uVar2 < 0x78) {
                DAT_101d0a68 = 2;
              }
            }
            else {
              DAT_101d0a6c = 1;
            }
            DAT_101d0a70 = 2;
          }
          else {
            DAT_101d0a6c = 1;
            DAT_101d0a70 = 1;
          }
        }
        else {
          DAT_101d0a6c = 1;
          DAT_101d0a68 = 0;
          DAT_101d0a70 = 1;
        }
      }
      else {
        DAT_101d0a68 = 0;
        DAT_101d0a6c = 0;
        DAT_101d0a70 = 1;
      }
    }
    else {
      DAT_101d0a68 = 0;
      DAT_101d0a6c = 0;
      DAT_101d0a70 = 0;
    }
    if (0x17f < uVar3) {
      bVar5 = uVar3 < 0x1e0;
      goto LAB_1000d7da;
    }
  }
  bVar5 = DAT_101d0a68 < uVar4;
  if (bVar5) {
    DAT_101d0a68 = uVar4;
  }
  bVar1 = DAT_101d0a6c < uVar4;
  if (bVar1) {
    DAT_101d0a6c = uVar4;
  }
  if ((DAT_101d0a70 < uVar4) || (uVar4 = DAT_101d0a70, bVar1 || bVar5)) {
    DAT_101d0a70 = uVar4;
    (*(code *)RI_Printf)
              (0,
               "Reducing texture detail based on total system memory of %i MB to improve load times.\n"
               ,uVar3);
  }
LAB_1000d823:
  (*(code *)RI_Dvar_SetBool)(DAT_101ce5f8,DAT_101d0a68);
  (*(code *)RI_Dvar_SetBool)(DAT_101ce6c0,DAT_101d0a6c);
  (*(code *)RI_Dvar_SetBool)(DAT_101ce7d4,DAT_101d0a70);
  (*(code *)RI_Printf)
            (0,"Using picmip %i on most textures, %i on normal maps, and %i on specular maps\n",
             DAT_101d0a68,DAT_101d0a6c,DAT_101d0a70);
  return;
}


