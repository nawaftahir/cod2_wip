// 100263a0 size=567 FUN_100263a0

void FUN_100263a0(int param_1)

{
  int iVar1;
  char cVar2;
  char *pcVar3;
  undefined4 uVar4;
  int iVar5;
  undefined *puVar6;
  char *pcVar7;
  bool bVar8;
  undefined1 auStack_108 [260];
  
  if (param_1 == 0) {
    puVar6 = &DAT_10196f08;
  }
  else {
    if (param_1 != 1) {
      return;
    }
    puVar6 = &DAT_10196f04;
  }
  pcVar3 = (char *)(*(code *)RI_Cmd_Argc)(1);
  iVar5 = 10;
  bVar8 = true;
  pcVar7 = "levelshot";
  do {
    if (iVar5 == 0) break;
    iVar5 = iVar5 + -1;
    bVar8 = *pcVar3 == *pcVar7;
    pcVar3 = pcVar3 + 1;
    pcVar7 = pcVar7 + 1;
  } while (bVar8);
  if (bVar8) {
    FUN_10026290();
    return;
  }
  pcVar3 = (char *)(*(code *)RI_Cmd_Argc)(1);
  iVar5 = 9;
  bVar8 = true;
  pcVar7 = "savegame";
  do {
    if (iVar5 == 0) break;
    iVar5 = iVar5 + -1;
    bVar8 = *pcVar3 == *pcVar7;
    pcVar3 = pcVar3 + 1;
    pcVar7 = pcVar7 + 1;
  } while (bVar8);
  if (((bVar8) && (iVar5 = (*(code *)RI_Cmd_RemoveCommand)(), iVar5 == 3)) &&
     (pcVar3 = (char *)(*(code *)RI_Cmd_Argc)(2), *pcVar3 != '\0')) {
    (*(code *)RI_Cmd_Argc)(2);
    FUN_10026330();
    return;
  }
  pcVar3 = (char *)(*(code *)RI_Cmd_Argc)(1);
  bVar8 = true;
  iVar5 = 7;
  pcVar7 = "silent";
  do {
    if (iVar5 == 0) break;
    iVar5 = iVar5 + -1;
    bVar8 = *pcVar3 == *pcVar7;
    pcVar3 = pcVar3 + 1;
    pcVar7 = pcVar7 + 1;
  } while (bVar8);
  iVar5 = (*(code *)RI_Cmd_RemoveCommand)();
  if ((iVar5 == 2) && (!bVar8)) {
    uVar4 = (*(code *)RI_Cmd_Argc)(1,puVar6);
    FUN_10060c10("screenshots/%s.%s",uVar4);
LAB_10026534:
    iVar1 = DAT_101d4c70;
    iVar5 = DAT_101d4c6c;
    if (param_1 == 0) {
      uVar4 = (*(code *)RI_Z_MallocInternal)(DAT_101d4c6c * DAT_101d4c70 * 3);
      cVar2 = FUN_10025e80(iVar5,iVar1,3,uVar4);
      if (cVar2 != '\0') {
        FUN_10014670(auStack_108,0x5a,iVar5,iVar1,uVar4);
      }
      (*(code *)RI_Z_FreeInternal)(uVar4);
    }
    else {
      if (param_1 != 1) {
        return;
      }
      FUN_100261b0(0,0,DAT_101d4c6c,auStack_108);
    }
    if (!bVar8) {
      (*(code *)RI_Printf)(0,"Wrote %s\n",auStack_108);
    }
    return;
  }
  if (DAT_1076a834 < 10000) {
    do {
      if ((DAT_1076a834 < 0) || (9999 < DAT_1076a834)) {
        FUN_10060c10("screenshots/shot9999.%s",puVar6);
      }
      else {
        FUN_10060c10("screenshots/shot%04i.%s",DAT_1076a834,puVar6);
      }
      iVar5 = (*(code *)RI_FS_FreeFileList)(auStack_108);
    } while ((iVar5 != 0) && (DAT_1076a834 = DAT_1076a834 + 1, DAT_1076a834 < 10000));
    if (DAT_1076a834 < 9999) {
      DAT_1076a834 = DAT_1076a834 + 1;
      goto LAB_10026534;
    }
  }
  (*(code *)RI_Printf)(0,"ScreenShot: Couldn\'t create a file\n");
  return;
}


