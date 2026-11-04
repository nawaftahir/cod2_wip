// 10084220 size=237 FUN_10084220

undefined4 FUN_10084220(uint *param_1,uint *param_2)

{
  undefined4 *puVar1;
  uint *in_ECX;
  uint uVar2;
  uint uVar3;
  uint uVar4;
  uint *puVar5;
  uint *puVar6;
  
  puVar5 = param_1;
  if (param_2 == (uint *)0xffffffff) {
    uVar4 = (in_ECX[1] + 3 >> 2) + 2;
  }
  else {
    uVar4 = (uint)param_2;
    if (param_2 < (in_ECX[1] + 3 >> 2) + 2) {
      return 0x80004005;
    }
  }
  if (0x8000 < uVar4) {
    return 0x80004005;
  }
  param_1 = (uint *)0x0;
  *puVar5 = (uVar4 - 1 & 0x7fff) << 0x10 | 0xfffe;
  puVar5[1] = *in_ECX;
  param_2 = puVar5 + 2;
  for (puVar1 = (undefined4 *)in_ECX[2]; puVar1 != (undefined4 *)0x0;
      puVar1 = (undefined4 *)puVar1[4]) {
    if ((*(byte *)(puVar1 + 2) & 4) == 0) {
      uVar2 = ((int)param_1 + 3U & 0xfffffffc) - (int)param_1;
      puVar5 = param_2;
      for (uVar3 = uVar2 >> 2; uVar3 != 0; uVar3 = uVar3 - 1) {
        *puVar5 = 0xabababab;
        puVar5 = puVar5 + 1;
      }
      for (uVar3 = uVar2 & 3; uVar3 != 0; uVar3 = uVar3 - 1) {
        *(undefined1 *)puVar5 = 0xab;
        puVar5 = (uint *)((int)puVar5 + 1);
      }
      param_2 = (uint *)((int)param_2 + uVar2);
      param_1 = (uint *)((int)param_1 + uVar2);
    }
    uVar2 = puVar1[1];
    puVar5 = (uint *)*puVar1;
    puVar6 = param_2;
    for (uVar3 = uVar2 >> 2; uVar3 != 0; uVar3 = uVar3 - 1) {
      *puVar6 = *puVar5;
      puVar5 = puVar5 + 1;
      puVar6 = puVar6 + 1;
    }
    for (uVar2 = uVar2 & 3; uVar2 != 0; uVar2 = uVar2 - 1) {
      *(char *)puVar6 = (char)*puVar5;
      puVar5 = (uint *)((int)puVar5 + 1);
      puVar6 = (uint *)((int)puVar6 + 1);
    }
    param_2 = (uint *)((int)param_2 + puVar1[1]);
    param_1 = (uint *)((int)param_1 + puVar1[1]);
  }
  uVar2 = (uVar4 * 4 + -8) - (int)param_1;
  for (uVar4 = uVar2 >> 2; uVar4 != 0; uVar4 = uVar4 - 1) {
    *param_2 = 0xabababab;
    param_2 = param_2 + 1;
  }
  for (uVar2 = uVar2 & 3; uVar2 != 0; uVar2 = uVar2 - 1) {
    *(undefined1 *)param_2 = 0xab;
    param_2 = (uint *)((int)param_2 + 1);
  }
  return 0;
}


