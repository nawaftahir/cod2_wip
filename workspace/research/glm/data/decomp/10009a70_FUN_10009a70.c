// 10009a70 size=184 FUN_10009a70

uint FUN_10009a70(undefined4 param_1,undefined4 param_2,int param_3,int *param_4)

{
  int in_EAX;
  int iVar1;
  int iVar2;
  int unaff_ESI;
  uint local_4;
  
  local_4 = (uint)*(byte *)(in_EAX + 0x24);
  iVar1 = FUN_10007ef0(*(undefined4 *)(in_EAX + 0x20),&local_4);
  if ((local_4 != 0) &&
     ((DAT_101ce5b4 == 0 ||
      (iVar1 = FUN_10007ef0(iVar1,&local_4,(uint)(iVar1 == unaff_ESI) * 0x600 + unaff_ESI),
      local_4 != 0)))) {
    iVar2 = 0;
    if (0 < param_3) {
      do {
        iVar1 = FUN_10007ef0(iVar1,&local_4,(uint)(iVar1 == unaff_ESI) * 0x600 + unaff_ESI);
        if (local_4 == 0) {
          return 0;
        }
        iVar2 = iVar2 + 1;
      } while (iVar2 < param_3);
    }
    if (param_4 != (int *)0x0) {
      *param_4 = iVar1;
    }
    return local_4;
  }
  return 0;
}


