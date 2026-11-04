// 1006a777 size=144 FUN_1006a777

undefined4 FUN_1006a777(char *param_1,undefined4 param_2,undefined4 param_3)

{
  char cVar1;
  int iVar2;
  char *pcVar3;
  char *pcVar4;
  void *pvVar5;
  int iVar6;
  int in_ECX;
  uint uVar7;
  char *pcVar8;
  
  iVar2 = FUN_10068b85(param_1);
  pcVar3 = param_1;
  do {
    cVar1 = *pcVar3;
    pcVar3 = pcVar3 + 1;
  } while (cVar1 != '\0');
  pcVar3 = pcVar3 + (1 - (int)(param_1 + 1));
  pcVar4 = operator_new((uint)pcVar3);
  if (pcVar4 != (char *)0x0) {
    pcVar8 = pcVar4;
    for (uVar7 = (uint)pcVar3 >> 2; uVar7 != 0; uVar7 = uVar7 - 1) {
      *(undefined4 *)pcVar8 = *(undefined4 *)param_1;
      param_1 = param_1 + 4;
      pcVar8 = pcVar8 + 4;
    }
    for (uVar7 = (uint)pcVar3 & 3; uVar7 != 0; uVar7 = uVar7 - 1) {
      *pcVar8 = *param_1;
      param_1 = param_1 + 1;
      pcVar8 = pcVar8 + 1;
    }
    pvVar5 = operator_new(0x24);
    if (pvVar5 == (void *)0x0) {
      iVar6 = 0;
    }
    else {
      iVar6 = FUN_1006a3c0(pcVar4,param_2,param_3,*(undefined4 *)(in_ECX + iVar2 * 4));
    }
    if (iVar6 != 0) {
      *(int *)(in_ECX + iVar2 * 4) = iVar6;
      return 0;
    }
  }
  return 0x8007000e;
}


