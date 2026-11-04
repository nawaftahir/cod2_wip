// 1001c3c0 size=63 FUN_1001c3c0

undefined4 FUN_1001c3c0(undefined4 param_1)

{
  char cVar1;
  undefined4 *puVar2;
  int iVar3;
  undefined4 *unaff_ESI;
  
  iVar3 = 0;
  if (*(short *)((int)unaff_ESI + 6) != 0) {
    puVar2 = unaff_ESI + 5;
    do {
      cVar1 = FUN_1001c2f0(param_1,*unaff_ESI,2,puVar2);
      if (cVar1 == '\0') {
        return 0;
      }
      iVar3 = iVar3 + 1;
      puVar2 = puVar2 + 0x17;
    } while (iVar3 < (int)(uint)*(ushort *)((int)unaff_ESI + 6));
  }
  return 1;
}


