// 10023ed0 size=245 R_DefaultVertexFrames

void R_DefaultVertexFrames(int param_1,undefined2 param_2,ushort param_3,undefined4 *param_4)

{
  undefined4 *puVar1;
  int iVar2;
  uint uVar3;
  int iVar4;
  uint uVar5;
  undefined4 *puVar6;
  
  iVar2 = DAT_101da9c8;
  if (DAT_101d4d00 != '\0') {
    if (param_1 == 0) {
      param_1 = DAT_101d1b2c;
    }
    uVar5 = (uint)param_3;
    if (((int)(*(int *)(DAT_101da9c8 + 0x18fc74) + uVar5) < 0x2001) &&
       (*(int *)(DAT_101da9c8 + 0x187c70) < 0x800)) {
      puVar1 = (undefined4 *)(*(int *)(DAT_101da9c8 + 0x187c70) * 0x10 + 0x187c74 + DAT_101da9c8);
      *(undefined2 *)(puVar1 + 2) = param_2;
      puVar1[1] = param_1;
      *(ushort *)((int)puVar1 + 10) = param_3;
      *puVar1 = 1;
      puVar6 = (undefined4 *)(*(int *)(iVar2 + 0x18fc74) * 0x44 + 0x18fc78 + iVar2);
      puVar1[3] = puVar6;
      for (uVar3 = uVar5 * 0x44 >> 2; uVar3 != 0; uVar3 = uVar3 - 1) {
        *puVar6 = *param_4;
        param_4 = param_4 + 1;
        puVar6 = puVar6 + 1;
      }
      for (iVar4 = 0; iVar4 != 0; iVar4 = iVar4 + -1) {
        *(undefined1 *)puVar6 = *(undefined1 *)param_4;
        param_4 = (undefined4 *)((int)param_4 + 1);
        puVar6 = (undefined4 *)((int)puVar6 + 1);
      }
      FUN_10024380(puVar1);
      *(int *)(iVar2 + 0x187c70) = *(int *)(iVar2 + 0x187c70) + 1;
      *(uint *)(iVar2 + 0x18fc74) = *(int *)(iVar2 + 0x18fc74) + uVar5;
      DAT_10678ac0 = DAT_10678ac0 + 1;
    }
  }
  return;
}


