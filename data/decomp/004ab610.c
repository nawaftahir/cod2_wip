
undefined4 __thiscall FUN_004ab610(char *param_1,undefined4 param_2)

{
  short *psVar1;
  char cVar2;
  short sVar3;
  int iVar4;
  undefined4 uVar5;
  int *in_EAX;
  undefined4 *puVar6;
  char *pcVar7;
  char *pcVar8;
  char *pcVar9;
  int local_8;
  
  sVar3 = *(short *)*in_EAX;
  psVar1 = (short *)*in_EAX + 1;
  *in_EAX = (int)psVar1;
  if (sVar3 != 0x14) {
    FUN_00408f20("^1ERROR: xmodel \'%s\' out of date (version %d, expecting %d).\n",param_2,
                 (int)sVar3,0x14);
    return 0;
  }
  param_1[0x102c] = (char)*psVar1;
  iVar4 = *in_EAX;
  puVar6 = (undefined4 *)(iVar4 + 1);
  *in_EAX = (int)puVar6;
  uVar5 = *puVar6;
  *in_EAX = iVar4 + 5;
  *(undefined4 *)(param_1 + 0x1010) = uVar5;
  uVar5 = *(undefined4 *)*in_EAX;
  *in_EAX = (int)((undefined4 *)*in_EAX + 1);
  *(undefined4 *)(param_1 + 0x1014) = uVar5;
  uVar5 = *(undefined4 *)*in_EAX;
  *in_EAX = (int)((undefined4 *)*in_EAX + 1);
  *(undefined4 *)(param_1 + 0x1018) = uVar5;
  uVar5 = *(undefined4 *)*in_EAX;
  *in_EAX = (int)((undefined4 *)*in_EAX + 1);
  *(undefined4 *)(param_1 + 0x101c) = uVar5;
  uVar5 = *(undefined4 *)*in_EAX;
  *in_EAX = (int)((undefined4 *)*in_EAX + 1);
  *(undefined4 *)(param_1 + 0x1020) = uVar5;
  uVar5 = *(undefined4 *)*in_EAX;
  *in_EAX = (int)((undefined4 *)*in_EAX + 1);
  *(undefined4 *)(param_1 + 0x1024) = uVar5;
  local_8 = 4;
  pcVar7 = param_1;
  do {
    uVar5 = *(undefined4 *)*in_EAX;
    *in_EAX = (int)((undefined4 *)*in_EAX + 1);
    *(undefined4 *)(pcVar7 + 0x400) = uVar5;
    pcVar8 = (char *)*in_EAX;
    pcVar9 = pcVar7;
    do {
      cVar2 = *pcVar8;
      pcVar8 = pcVar8 + 1;
      *pcVar9 = cVar2;
      pcVar9 = pcVar9 + 1;
    } while (cVar2 != '\0');
    pcVar9 = (char *)*in_EAX;
    pcVar8 = pcVar9 + 1;
    do {
      cVar2 = *pcVar9;
      pcVar9 = pcVar9 + 1;
    } while (cVar2 != '\0');
    pcVar9 = pcVar9 + *in_EAX + (1 - (int)pcVar8);
    pcVar7 = pcVar7 + 0x404;
    local_8 = local_8 + -1;
    *in_EAX = (int)pcVar9;
  } while (local_8 != 0);
  uVar5 = *(undefined4 *)pcVar9;
  *in_EAX = (int)(pcVar9 + 4);
  *(undefined4 *)(param_1 + 0x1028) = uVar5;
  return 1;
}

