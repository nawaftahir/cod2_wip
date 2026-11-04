// 10021770 size=195 FUN_10021770

void FUN_10021770(undefined4 param_1)

{
  int *piVar1;
  undefined4 uVar2;
  float fVar3;
  int iVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  int iVar7;
  undefined2 *puVar8;
  undefined4 *in_ECX;
  
  iVar7 = DAT_1042e778;
  iVar4 = *(int *)(DAT_1042e778 + 0x30000);
  if (0x30000 - iVar4 < 0x4c) {
    puVar8 = (undefined2 *)0x0;
    *(undefined4 *)(DAT_1042e778 + 0x30008) = 0;
  }
  else {
    puVar8 = (undefined2 *)(iVar4 + DAT_1042e778);
    *(int *)(DAT_1042e778 + 0x30000) = iVar4 + 0x4c;
    piVar1 = (int *)(iVar7 + 0x30004);
    *piVar1 = *piVar1 + 0x4c;
    *(undefined2 **)(iVar7 + 0x30008) = puVar8;
    *puVar8 = 5;
    puVar8[1] = 0x4c;
  }
  *(undefined4 *)(puVar8 + 2) = param_1;
  *(undefined4 *)(puVar8 + 4) = in_ECX[1];
  *(undefined4 *)(puVar8 + 6) = in_ECX[2];
  *(undefined4 *)(puVar8 + 8) = in_ECX[3];
  *(undefined4 *)(puVar8 + 10) = in_ECX[4];
  uVar2 = in_ECX[7];
  uVar5 = in_ECX[5];
  *(undefined4 *)(puVar8 + 0x16) = in_ECX[6];
  *(undefined4 *)(puVar8 + 0x14) = uVar5;
  *(undefined4 *)(puVar8 + 0x18) = uVar2;
  *(undefined4 *)(puVar8 + 0x1a) = 0x3f800000;
  uVar2 = in_ECX[10];
  uVar6 = in_ECX[8];
  uVar5 = in_ECX[9];
  *(undefined4 *)(puVar8 + 0x12) = 0x3f800000;
  iVar4 = DAT_101ce638;
  *(undefined4 *)(puVar8 + 0xe) = uVar5;
  *(undefined4 *)(puVar8 + 0xc) = uVar6;
  *(undefined4 *)(puVar8 + 0x10) = uVar2;
  fVar3 = *(float *)(iVar4 + 8);
  *(float *)(puVar8 + 0x1c) = fVar3 * *(float *)(puVar8 + 0x14);
  *(float *)(puVar8 + 0x1e) = fVar3 * *(float *)(puVar8 + 0x16);
  *(float *)(puVar8 + 0x20) = fVar3 * *(float *)(puVar8 + 0x18);
  *(float *)(puVar8 + 0x22) = fVar3 * *(float *)(puVar8 + 0x1a);
  *(undefined4 *)(puVar8 + 0x24) = *in_ECX;
  return;
}


