// 100840db size=313 FUN_100840db

undefined4 FUN_100840db(char *param_1,char *param_2,uint param_3,undefined4 *param_4)

{
  char cVar1;
  undefined4 *puVar2;
  undefined4 uVar3;
  char *pcVar4;
  int in_ECX;
  uint uVar5;
  char *pcVar6;
  char *pcVar7;
  bool bVar8;
  
  if ((param_2 != (char *)0x0) && (param_1 == (char *)0x0)) {
    return 0x80004005;
  }
  if (param_2 == (char *)0xffffffff) {
    param_2 = param_1;
    do {
      cVar1 = *param_2;
      param_2 = param_2 + 1;
    } while (cVar1 != '\0');
    param_2 = param_2 + (1 - (int)(param_1 + 1));
  }
  if ((param_3 & 1) == 0) {
    param_3 = param_3 | 2;
  }
  if ((param_3 & 2) != 0) {
    for (puVar2 = *(undefined4 **)(in_ECX + 8); puVar2 != (undefined4 *)0x0;
        puVar2 = (undefined4 *)puVar2[4]) {
      if (((*(byte *)(puVar2 + 2) & 2) != 0) && (param_2 == (char *)puVar2[1])) {
        bVar8 = true;
        pcVar4 = param_2;
        pcVar6 = param_1;
        pcVar7 = (char *)*puVar2;
        do {
          if (pcVar4 == (char *)0x0) break;
          pcVar4 = pcVar4 + -1;
          bVar8 = *pcVar6 == *pcVar7;
          pcVar6 = pcVar6 + 1;
          pcVar7 = pcVar7 + 1;
        } while (bVar8);
        if (bVar8) {
          if (param_4 != (undefined4 *)0x0) {
            *param_4 = puVar2[3];
          }
          if (((param_3 & 1) != 0) && ((param_3 & 8) != 0)) {
            _free(param_1);
          }
          return 0;
        }
      }
    }
  }
  puVar2 = operator_new(0x14);
  if (puVar2 == (undefined4 *)0x0) {
LAB_10084162:
    uVar3 = 0x8007000e;
  }
  else {
    if ((param_3 & 1) == 0) {
      pcVar4 = operator_new((uint)param_2);
      *puVar2 = pcVar4;
      if (pcVar4 == (char *)0x0) {
        _free(puVar2);
        goto LAB_10084162;
      }
      for (uVar5 = (uint)param_2 >> 2; uVar5 != 0; uVar5 = uVar5 - 1) {
        *(undefined4 *)pcVar4 = *(undefined4 *)param_1;
        param_1 = param_1 + 4;
        pcVar4 = pcVar4 + 4;
      }
      for (uVar5 = (uint)param_2 & 3; uVar5 != 0; uVar5 = uVar5 - 1) {
        *pcVar4 = *param_1;
        param_1 = param_1 + 1;
        pcVar4 = pcVar4 + 1;
      }
    }
    else {
      *puVar2 = param_1;
    }
    if ((param_3 & 4) == 0) {
      *(uint *)(in_ECX + 4) = *(int *)(in_ECX + 4) + 3U & 0xfffffffc;
    }
    uVar3 = *(undefined4 *)(in_ECX + 4);
    puVar2[2] = param_3;
    puVar2[4] = 0;
    puVar2[3] = uVar3;
    puVar2[1] = param_2;
    *(int *)(in_ECX + 4) = (int)(param_2 + *(int *)(in_ECX + 4));
    **(undefined4 **)(in_ECX + 0xc) = puVar2;
    *(undefined4 **)(in_ECX + 0xc) = puVar2 + 4;
    if (param_4 != (undefined4 *)0x0) {
      *param_4 = puVar2[3];
    }
    uVar3 = 0;
  }
  return uVar3;
}


