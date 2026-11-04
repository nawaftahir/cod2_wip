// 1000d940 size=998 FUN_1000d940

/* WARNING: Function: __chkstk replaced with injection: alloca_probe */
/* WARNING (jumptable): Unable to track spacebase fully for stack */

void FUN_1000d940(void)

{
  int iVar1;
  int iVar2;
  char cVar3;
  int iVar4;
  int *piVar5;
  char *pcVar6;
  uint uVar7;
  int *piVar8;
  undefined **ppuVar9;
  undefined1 *puVar10;
  int iStack_20b0;
  char local_20a9;
  int iStack_20a8;
  int aiStack_20a4 [2];
  undefined1 auStack_209c [20];
  int iStack_2088;
  undefined1 auStack_207c [16];
  int aiStack_206c [24];
  int aiStack_200c [2048];
  undefined4 uStack_c;
  
  uStack_c = 0x1000d950;
  local_20a9 = '\0';
  iVar4 = (*(code *)RI_Cmd_RemoveCommand)();
  if (iVar4 == 2) {
    (*(code *)RI_Cmd_Argc)(1);
    iVar4 = FUN_10060950();
    if (iVar4 == 0) {
      local_20a9 = '\x01';
    }
  }
  aiStack_20a4[0] = 0;
  piVar5 = aiStack_206c + 3;
  for (iVar4 = 0x14; iVar4 != 0; iVar4 = iVar4 + -1) {
    *piVar5 = 0;
    piVar5 = piVar5 + 1;
  }
  aiStack_206c[0x17] = 0;
  aiStack_20a4[1] = 0;
  FUN_1000d480();
  cVar3 = local_20a9;
  uVar7 = aiStack_206c[0x17];
  if (local_20a9 != '\0') {
    piVar5 = &DAT_101ce890;
    do {
      if (0x7ff < uVar7) break;
      if (*piVar5 != 0) {
        aiStack_200c[uVar7] = (int)piVar5;
        uVar7 = aiStack_206c[0x17] + 1;
        aiStack_206c[0x17] = uVar7;
      }
      piVar5 = piVar5 + 9;
    } while ((int)piVar5 < 0x101cea64);
  }
  piVar5 = aiStack_200c + uVar7;
  piVar8 = aiStack_200c;
  puVar10 = &LAB_1000d900;
  iVar4 = (int)piVar5 - (int)piVar8 >> 2;
  FUN_1000df90();
  (*(code *)RI_Printf)(0,"\n-if-- ",piVar8,piVar5,iVar4,puVar10);
  ppuVar9 = &PTR_s_current_101a5a24;
  do {
    (*(code *)RI_Printf)(0,&DAT_10193358,*ppuVar9);
    ppuVar9 = ppuVar9 + 1;
  } while ((int)ppuVar9 < 0x101a5a2c);
  (*(code *)RI_Printf)(0,"  --name-------\n");
  iStack_20a8 = 0;
  if (0 < aiStack_206c[0x17]) {
    do {
      piVar5 = (int *)aiStack_200c[iStack_20a8];
      iVar4 = *piVar5;
      if (iVar4 == 3) {
LAB_1000da9c:
        (**(code **)(*(int *)piVar5[1] + 0x44))((int *)piVar5[1],0,auStack_209c);
        iVar4 = iStack_20a8;
      }
      else {
        if (iVar4 != 4) {
          if (iVar4 != 5) {
            return;
          }
          goto LAB_1000da9c;
        }
        (**(code **)(*(int *)piVar5[1] + 0x44))((int *)piVar5[1],0,auStack_207c);
        iVar4 = iStack_2088;
      }
      if (0x33 < iVar4) {
        if (iVar4 < 0x33545845) {
          if (iVar4 == 0x33545844) {
            pcVar6 = "DXT3  ";
          }
          else if (iVar4 == 0x72) {
            pcVar6 = "R32F  ";
          }
          else {
            if (iVar4 != 0x31545844) goto switchD_1000daca_caseD_18;
            pcVar6 = "DXT1  ";
          }
        }
        else {
          if (iVar4 != 0x35545844) goto switchD_1000daca_caseD_18;
          pcVar6 = "DXT5  ";
        }
        goto LAB_1000db47;
      }
      if (iVar4 == 0x33) {
        pcVar6 = "AL16  ";
        goto LAB_1000db47;
      }
      switch(iVar4) {
      case 0x15:
        pcVar6 = "RGBA32";
        break;
      case 0x16:
        pcVar6 = "RGB32 ";
        break;
      case 0x17:
        pcVar6 = "RGB16 ";
        break;
      default:
        goto switchD_1000daca_caseD_18;
      case 0x1c:
        pcVar6 = "A8    ";
        break;
      case 0x32:
        pcVar6 = "L8    ";
      }
LAB_1000db47:
      (*(code *)RI_Printf)(0,pcVar6);
switchD_1000daca_caseD_18:
      (*(code *)RI_Printf)(0,&DAT_101932ec,(&PTR_s_misc_101a59fc)[*(byte *)(piVar5 + 3)]);
      iVar4 = 0;
      piVar8 = piVar5 + 4;
      do {
        pcVar6 = "%7.1f";
        if (10.0 <= (float)*piVar8 * 0.0009765625) {
          pcVar6 = "%7.0f";
        }
        (*(code *)RI_Printf)(0,pcVar6,(double)((float)*piVar8 * 0.0009765625));
        iVar2 = *piVar8;
        iVar1 = iVar4 + (uint)*(byte *)(piVar5 + 3) * 2;
        aiStack_206c[iVar1] = aiStack_206c[iVar1] + iVar2;
        if ((cVar3 != '\0') || ((1 < *(byte *)(piVar5 + 3) && (*(byte *)(piVar5 + 3) != 4)))) {
          (&iStack_20b0)[iVar4] = (&iStack_20b0)[iVar4] + iVar2;
        }
        iVar4 = iVar4 + 1;
        piVar8 = piVar8 + 1;
      } while (iVar4 < 2);
      (*(code *)RI_Printf)(0);
      iStack_20a8 = iStack_20a8 + 1;
    } while (iStack_20a8 < aiStack_206c[0x17]);
  }
  (*(code *)RI_Printf)(0," ---------\n");
  (*(code *)RI_Printf)(0," %i total images\n",aiStack_206c[0x17]);
  iVar4 = 0;
  do {
    (*(code *)RI_Printf)
              (0," %5.1f MB %s total image size\n",
               (double)((float)*(int *)((int)aiStack_20a4 + iVar4) * 9.536743e-07),
               *(undefined4 *)((int)&PTR_s_current_101a5a24 + iVar4));
    iVar4 = iVar4 + 4;
  } while (iVar4 < 8);
  (*(code *)RI_Printf)(0,&DAT_10193290);
  (*(code *)RI_Printf)();
  ppuVar9 = &PTR_s_current_101a5a24;
  do {
    (*(code *)RI_Printf)(0,&DAT_10193358,*ppuVar9);
    ppuVar9 = ppuVar9 + 1;
  } while ((int)ppuVar9 < 0x101a5a2c);
  (*(code *)RI_Printf)(0,&DAT_10193290);
  ppuVar9 = &PTR_s_misc_101a59fc;
  do {
    (*(code *)RI_Printf)(0,&DAT_10193284,*ppuVar9);
    iVar4 = 2;
    do {
      (*(code *)RI_Printf)();
      iVar4 = iVar4 + -1;
    } while (iVar4 != 0);
    (*(code *)RI_Printf)(0,"  MB\n");
    ppuVar9 = ppuVar9 + 1;
  } while ((int)ppuVar9 < 0x101a5a24);
  (*(code *)RI_Printf)
            (0,
             "Related commands: meminfo, imagelist, gfx_world, gfx_model, cg_drawfps, com_statmon, tempmeminfo\n"
            );
  return;
}


