// 100027c0 size=113 FUN_100027c0

ushort FUN_100027c0(undefined4 *param_1)

{
  int in_EAX;
  ushort *puVar1;
  int iVar2;
  int unaff_EBX;
  ushort uVar3;
  int unaff_EDI;
  
  uVar3 = 0;
  iVar2 = 0;
  if (0 < unaff_EDI) {
    puVar1 = (ushort *)(in_EAX + 6);
    do {
      if (*(undefined4 **)(puVar1 + -3) == param_1) {
        if ((*(int *)(*(int *)(puVar1 + 1) + 0x1c) == *(int *)(unaff_EBX + 0x1c)) &&
           (*(short *)(*(int *)(puVar1 + 1) + 0x20) == *(short *)(unaff_EBX + 0x20))) {
          return *puVar1;
        }
        if (uVar3 <= *puVar1) {
          uVar3 = *puVar1 + 1;
        }
      }
      iVar2 = iVar2 + 1;
      puVar1 = puVar1 + 6;
    } while (iVar2 < unaff_EDI);
    if (0x7ff < uVar3) {
      FUN_10061cd0(1,"Material %s has more than %i sort groups\n",*param_1,0x800);
    }
  }
  return uVar3;
}


