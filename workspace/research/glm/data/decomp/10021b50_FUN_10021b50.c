// 10021b50 size=146 FUN_10021b50

void FUN_10021b50(undefined4 param_1,undefined4 param_2)

{
  int *piVar1;
  int iVar2;
  int iVar3;
  undefined2 *puVar4;
  undefined4 *unaff_ESI;
  undefined4 *unaff_EDI;
  
  iVar3 = DAT_1042e778;
  iVar2 = *(int *)(DAT_1042e778 + 0x30000);
  if (0x30000 - iVar2 < 0x30) {
    *(undefined4 *)(DAT_1042e778 + 0x30008) = 0;
    puVar4 = (undefined2 *)0x0;
  }
  else {
    puVar4 = (undefined2 *)(iVar2 + DAT_1042e778);
    *(int *)(DAT_1042e778 + 0x30000) = iVar2 + 0x30;
    piVar1 = (int *)(iVar3 + 0x30004);
    *piVar1 = *piVar1 + 0x30;
    *(undefined2 **)(iVar3 + 0x30008) = puVar4;
    *puVar4 = 0xc;
    puVar4[1] = 0x30;
  }
  *(undefined4 *)(puVar4 + 0x16) = param_1;
  *(undefined4 *)(puVar4 + 2) = *unaff_EDI;
  *(undefined4 *)(puVar4 + 4) = unaff_EDI[1];
  *(undefined4 *)(puVar4 + 6) = unaff_EDI[2];
  *(undefined4 *)(puVar4 + 8) = unaff_EDI[3];
  *(undefined4 *)(puVar4 + 10) = param_2;
  *(undefined4 *)(puVar4 + 0xc) = *unaff_ESI;
  *(undefined4 *)(puVar4 + 0xe) = unaff_ESI[1];
  *(undefined4 *)(puVar4 + 0x10) = unaff_ESI[2];
  *(undefined4 *)(puVar4 + 0x12) = unaff_ESI[3];
  *(undefined4 *)(puVar4 + 0x14) = unaff_ESI[4];
  return;
}


