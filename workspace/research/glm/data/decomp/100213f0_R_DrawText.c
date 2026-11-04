// 100213f0 size=229 R_DrawText

void R_DrawText(char *param_1,undefined4 param_2,undefined4 *param_3,undefined4 *param_4,
               undefined4 *param_5)

{
  undefined2 *puVar1;
  char cVar2;
  int iVar3;
  int iVar4;
  char *pcVar5;
  uint uVar6;
  uint uVar7;
  
  iVar4 = DAT_1042e778;
  if (*param_1 != '\0') {
    pcVar5 = param_1;
    do {
      cVar2 = *pcVar5;
      pcVar5 = pcVar5 + 1;
    } while (cVar2 != '\0');
    uVar6 = (int)pcVar5 - (int)(param_1 + 1);
    iVar3 = *(int *)(DAT_1042e778 + 0x30000);
    uVar7 = uVar6 + 0x34 & 0xfffffffc;
    if ((0x2e000 - iVar3) + *(int *)(DAT_1042e778 + 0x30004) < (int)uVar7) {
      *(undefined4 *)(DAT_1042e778 + 0x30008) = 0;
      return;
    }
    puVar1 = (undefined2 *)(iVar3 + DAT_1042e778);
    *(undefined2 **)(DAT_1042e778 + 0x30008) = puVar1;
    *(uint *)(iVar4 + 0x30000) = iVar3 + uVar7;
    puVar1[1] = (short)uVar7;
    *puVar1 = 0x16;
    *(undefined4 *)(puVar1 + 2) = *param_3;
    *(undefined4 *)(puVar1 + 4) = param_3[1];
    *(undefined4 *)(puVar1 + 6) = param_3[2];
    *(undefined4 *)(puVar1 + 8) = param_2;
    *(undefined4 *)(puVar1 + 10) = *param_4;
    *(undefined4 *)(puVar1 + 0xc) = param_4[1];
    *(undefined4 *)(puVar1 + 0xe) = param_4[2];
    *(undefined4 *)(puVar1 + 0x10) = *param_5;
    *(undefined4 *)(puVar1 + 0x12) = param_5[1];
    *(undefined4 *)(puVar1 + 0x14) = param_5[2];
    FUN_1002c0b0();
    pcVar5 = (char *)(puVar1 + 0x18);
    for (uVar7 = uVar6 >> 2; uVar7 != 0; uVar7 = uVar7 - 1) {
      *(undefined4 *)pcVar5 = *(undefined4 *)param_1;
      param_1 = param_1 + 4;
      pcVar5 = pcVar5 + 4;
    }
    for (uVar7 = uVar6 & 3; uVar7 != 0; uVar7 = uVar7 - 1) {
      *pcVar5 = *param_1;
      param_1 = param_1 + 1;
      pcVar5 = pcVar5 + 1;
    }
    *(undefined1 *)(uVar6 + 0x30 + (int)puVar1) = 0;
  }
  return;
}


