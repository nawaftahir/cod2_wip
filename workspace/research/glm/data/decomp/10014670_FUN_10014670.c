// 10014670 size=713 FUN_10014670

void FUN_10014670(undefined4 param_1,undefined4 param_2,int param_3,uint param_4,int param_5)

{
  undefined4 uVar1;
  int iVar2;
  code ***pppcVar3;
  int iStack_204;
  code **local_200 [4];
  undefined1 local_1f0;
  code *local_1ec;
  undefined *local_1e8;
  undefined1 *local_1e4;
  int local_1e0;
  int iStack_1dc;
  uint uStack_1d8;
  undefined4 uStack_1d4;
  undefined4 uStack_1d0;
  undefined8 local_1c8;
  undefined4 local_1b4;
  undefined4 local_1b0;
  undefined4 local_1ac;
  undefined4 local_1a8;
  undefined4 local_1a4;
  undefined4 auStack_1a0 [4];
  undefined4 auStack_190 [18];
  char cStack_148;
  uint uStack_128;
  undefined4 *puStack_bc;
  undefined4 local_98;
  code *local_90;
  undefined1 *local_8c;
  undefined1 *local_88;
  undefined1 *local_84;
  undefined1 *local_80;
  undefined4 local_7c;
  undefined4 local_28;
  undefined4 local_24;
  undefined **local_20;
  undefined4 local_1c;
  undefined4 local_18;
  undefined4 local_14;
  undefined4 local_10;
  undefined1 *local_c;
  undefined1 *local_8;
  
  pppcVar3 = local_200;
  for (iVar2 = 0x5c; iVar2 != 0; iVar2 = iVar2 + -1) {
    *pppcVar3 = (code **)0x0;
    pppcVar3 = pppcVar3 + 1;
  }
  local_200[0] = &local_90;
  local_90 = FUN_10051f90;
  local_8c = &LAB_10052010;
  local_88 = &LAB_10051fd0;
  local_84 = &LAB_10052050;
  local_80 = &LAB_10052100;
  local_28 = 0;
  local_24 = 0;
  local_7c = 0;
  local_20 = &PTR_s_Bogus_message_code__d_10190ee8;
  local_1c = 0x7b;
  local_18 = 0;
  local_14 = 0;
  local_10 = 0;
  local_c = &LAB_10014630;
  local_8 = &LAB_10014650;
  local_1e8 = &DAT_10014610;
  local_1e4 = &LAB_10014620;
  local_1f0 = 0;
  FUN_10055840();
  local_1b0 = 0;
  local_1ac = 0;
  local_1a8 = 0;
  local_200[2] = (code **)0x0;
  local_1e0 = 0;
  local_1b4 = 0;
  local_1a4 = 0;
  iVar2 = 0;
  do {
    auStack_1a0[iVar2] = 0;
    auStack_190[iVar2] = 0;
    iVar2 = iVar2 + 1;
  } while (iVar2 < 4);
  local_1c8 = 0x3ff0000000000000;
  iVar2 = param_3 * param_4 * 3;
  local_98 = 0;
  local_1ec = (code *)0x64;
  uVar1 = (*(code *)RI_Hunk_AllocateTempMemoryInternal)(iVar2);
  if (local_1e0 == 0) {
    local_1e0 = (**local_200[1])(local_200,0,0x1c);
  }
  *(undefined1 **)(local_1e0 + 8) = &LAB_10014580;
  *(undefined1 **)(local_1e0 + 0xc) = &LAB_100145a0;
  *(undefined1 **)(local_1e0 + 0x10) = &LAB_100145b0;
  *(undefined4 *)(local_1e0 + 0x14) = uVar1;
  *(int *)(local_1e0 + 0x18) = iVar2;
  iStack_1dc = param_3;
  uStack_1d8 = param_4;
  uStack_1d4 = 3;
  uStack_1d0 = 2;
  FUN_10046e00();
  FUN_10046c70(1);
  if (local_1ec != (code *)0x64) {
    local_200[0][5] = (code *)0x14;
    local_200[0][6] = local_1ec;
    (**local_200[0])(local_200);
  }
  FUN_10041850();
  (*local_200[0][4])(local_200);
  (**(code **)(local_1e0 + 8))(local_200);
  FUN_10044b70();
  (*(code *)*puStack_bc)(local_200);
  uStack_128 = 0;
  local_1ec = (code *)((cStack_148 != '\0') + 0x65);
  if (uStack_1d8 != 0) {
    do {
      iStack_204 = uStack_128 * param_3 * 3 + param_5;
      FUN_10041be0(&iStack_204);
    } while (uStack_128 < uStack_1d8);
  }
  FUN_100418c0();
  (*(code *)RI_FS_FileExists)(param_1,uVar1,DAT_101d7ea8);
  (*(code *)RI_Hunk_FreeTempMemory)(uVar1);
  if (local_200[1] != (code **)0x0) {
    (*local_200[1][10])(local_200);
  }
  return;
}


