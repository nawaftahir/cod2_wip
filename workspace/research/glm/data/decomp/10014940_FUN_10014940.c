// 10014940 size=785 FUN_10014940

void FUN_10014940(int *param_1,int *param_2,uint *param_3,uint *param_4,undefined4 *param_5)

{
  int iVar1;
  int iVar2;
  int iVar3;
  undefined1 *puVar4;
  int local_250;
  int iStack_248;
  code *pcStack_244;
  undefined1 *puStack_240;
  undefined1 *puStack_23c;
  undefined1 *puStack_238;
  undefined1 *puStack_234;
  undefined4 uStack_230;
  undefined4 uStack_1dc;
  undefined4 uStack_1d8;
  undefined **ppuStack_1d4;
  undefined4 uStack_1d0;
  undefined4 uStack_1cc;
  undefined4 uStack_1c8;
  undefined4 uStack_1c4;
  undefined1 *puStack_1c0;
  undefined1 *puStack_1bc;
  code **ppcStack_1b8;
  undefined4 *puStack_1b4;
  undefined4 uStack_1a4;
  undefined *puStack_1a0;
  undefined1 *puStack_19c;
  int *piStack_198;
  uint uStack_154;
  uint uStack_150;
  int iStack_148;
  uint uStack_138;
  
  iVar1 = (*(code *)RI_StatMon_Warning)();
  if (local_250 != 0) {
    ppcStack_1b8 = &pcStack_244;
    pcStack_244 = FUN_10051f90;
    puStack_240 = &LAB_10052010;
    puStack_23c = &LAB_10051fd0;
    puStack_238 = &LAB_10052050;
    puStack_234 = &LAB_10052100;
    uStack_1dc = 0;
    uStack_1d8 = 0;
    uStack_230 = 0;
    ppuStack_1d4 = &PTR_s_Bogus_message_code__d_10190ee8;
    uStack_1d0 = 0x7b;
    uStack_1cc = 0;
    uStack_1c8 = 0;
    uStack_1c4 = 0;
    puStack_1c0 = &LAB_10014630;
    puStack_1bc = &LAB_10014650;
    puStack_1a0 = &DAT_10014610;
    puStack_19c = &LAB_10014620;
    FUN_10049e00();
    if (piStack_198 == (int *)0x0) {
      piStack_198 = (int *)(*(code *)*puStack_1b4)(&ppcStack_1b8,0,0x20);
    }
    piStack_198[1] = iVar1;
    piStack_198[2] = (int)&LAB_1004a950;
    piStack_198[3] = 0;
    piStack_198[4] = (int)&LAB_1004a960;
    piStack_198[5] = (int)&LAB_1004f690;
    piStack_198[6] = (int)&DAT_1004a980;
    *piStack_198 = local_250;
    FUN_1004a130(1);
    FUN_1004a400();
    if ((DAT_101d4c84 < uStack_154) || (DAT_101d4c84 < uStack_150)) {
      (*(code *)RI_Printf)(2,"WARNING: image \'%s\' is larger than %i on at least one side\n");
      if (puStack_1b4 != (undefined4 *)0x0) {
        (*(code *)puStack_1b4[10])(&ppcStack_1b8);
      }
    }
    else {
      if (iStack_148 == 3) {
        *param_3 = uStack_154;
        *param_4 = uStack_150;
        *param_5 = 0x15;
        iVar2 = (*(code *)RI_Hunk_AllocateTempMemoryInternal)(uStack_150 * uStack_154 * 4);
        *param_2 = iVar2;
        iVar1 = uStack_154 * 4;
        *param_1 = local_250;
        if (uStack_138 < uStack_150) {
          do {
            iStack_248 = iVar2;
            FUN_1004a5d0(&iStack_248,1);
            iVar3 = uStack_154 - 1;
            if (-1 < iVar3) {
              puVar4 = (undefined1 *)(iVar2 + 2 + iVar3 * 4);
              do {
                puVar4[1] = 0xff;
                *puVar4 = *(undefined1 *)(iVar3 * iStack_148 + 2 + iVar2);
                puVar4[-1] = *(undefined1 *)(iVar3 * iStack_148 + 1 + iVar2);
                puVar4[-2] = *(undefined1 *)(iVar3 * iStack_148 + iVar2);
                iVar3 = iVar3 + -1;
                puVar4 = puVar4 + -4;
              } while (-1 < iVar3);
            }
            iVar2 = iVar2 + iVar1;
          } while (uStack_138 < uStack_150);
        }
        FUN_1004a310();
        if (puStack_1b4 == (undefined4 *)0x0) {
          return;
        }
        (*(code *)puStack_1b4[10])(&ppcStack_1b8);
        return;
      }
      (*(code *)RI_Printf)(2,"WARNING: jpeg image \'%s\' is not RGB\n");
      if (puStack_1b4 != (undefined4 *)0x0) {
        (*(code *)puStack_1b4[10])(&ppcStack_1b8);
      }
    }
    uStack_1a4 = 0;
    puStack_1b4 = (undefined4 *)0x0;
    (*(code *)RI_FS_ReadFile)(local_250);
  }
  return;
}


