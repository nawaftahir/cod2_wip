// 100c1978 size=112 FUN_100c1978

undefined4 FUN_100c1978(int param_1)

{
  int iVar1;
  uint uVar2;
  uint *puVar3;
  int *piVar4;
  int in_ECX;
  int *piVar5;
  uint uVar6;
  uint uVar7;
  
  iVar1 = *(int *)(*(int *)(in_ECX + 0x14) + param_1 * 4);
  uVar6 = *(uint *)(iVar1 + 0x54);
  if (((uVar6 != 0xffffffff) && ((*(byte *)(in_ECX + 0x6f) & 0x20) == 0)) &&
     (uVar2 = *(uint *)(iVar1 + 0x58), uVar6 <= uVar2)) {
    piVar4 = (int *)(*(int *)(in_ECX + 0x18) + uVar6 * 4);
    do {
      puVar3 = (uint *)*piVar4;
      if ((*puVar3 & 0xf0000000) == 0x60000000) {
        uVar7 = 0;
        if (puVar3[1] != 0) {
          piVar5 = (int *)puVar3[2];
          do {
            if (*piVar5 == param_1) {
              return 1;
            }
            uVar7 = uVar7 + 1;
            piVar5 = piVar5 + 1;
          } while (uVar7 < puVar3[1]);
        }
      }
      uVar6 = uVar6 + 1;
      piVar4 = piVar4 + 1;
    } while (uVar6 <= uVar2);
  }
  return 0;
}


