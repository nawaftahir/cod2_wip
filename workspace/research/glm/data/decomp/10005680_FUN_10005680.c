// 10005680 size=131 FUN_10005680

void FUN_10005680(undefined4 *param_1,undefined4 param_2,char *param_3)

{
  undefined4 uVar1;
  undefined4 *unaff_EBX;
  undefined4 *puVar2;
  int unaff_EDI;
  
  if (*(int *)(unaff_EDI + 0x1c) + 1 <= *(int *)(unaff_EDI + 0x20)) {
    if (*(int *)(unaff_EDI + 0x18) == 0) {
      uVar1 = (*(code *)RI_Z_MallocInternal)(*(int *)(unaff_EDI + 0x20) << 7);
      *(undefined4 *)(unaff_EDI + 0x18) = uVar1;
    }
    puVar2 = (undefined4 *)(*(int *)(unaff_EDI + 0x1c) * 0x80 + *(int *)(unaff_EDI + 0x18));
    *puVar2 = *param_1;
    puVar2[1] = param_1[1];
    puVar2[2] = param_1[2];
    puVar2[3] = *unaff_EBX;
    puVar2[4] = unaff_EBX[1];
    puVar2[5] = unaff_EBX[2];
    puVar2[6] = unaff_EBX[3];
    puVar2[7] = param_2;
    _strncpy((char *)(puVar2 + 8),param_3,0x5f);
    *(undefined1 *)((int)puVar2 + 0x7f) = 0;
    *(int *)(unaff_EDI + 0x1c) = *(int *)(unaff_EDI + 0x1c) + 1;
  }
  return;
}


