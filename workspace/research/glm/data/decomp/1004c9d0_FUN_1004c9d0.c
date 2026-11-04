// 1004c9d0 size=211 FUN_1004c9d0

uint FUN_1004c9d0(int param_1,int param_2)

{
  int iVar1;
  char cVar2;
  int in_EAX;
  int iVar3;
  int in_ECX;
  int in_EDX;
  uint uVar4;
  
  if (in_EAX < in_ECX) {
    cVar2 = FUN_1004c8b0(param_1);
    if (cVar2 == '\0') {
      return 0xffffffff;
    }
    in_EDX = *(int *)(param_1 + 8);
    in_EAX = *(int *)(param_1 + 0xc);
  }
  iVar3 = in_EAX - in_ECX;
  uVar4 = in_EDX >> ((byte)iVar3 & 0x1f) & (1 << ((byte)in_ECX & 0x1f)) - 1U;
  if (*(int *)(param_2 + in_ECX * 4) < (int)uVar4) {
    do {
      if (iVar3 < 1) {
        cVar2 = FUN_1004c8b0(param_1,in_EDX,iVar3,1);
        if (cVar2 == '\0') {
          return 0xffffffff;
        }
        in_EDX = *(int *)(param_1 + 8);
        iVar3 = *(int *)(param_1 + 0xc);
      }
      iVar3 = iVar3 + -1;
      uVar4 = uVar4 << 1 | in_EDX >> ((byte)iVar3 & 0x1f) & 1U;
      iVar1 = in_ECX * 4;
      in_ECX = in_ECX + 1;
    } while (*(int *)(param_2 + 4 + iVar1) < (int)uVar4);
  }
  *(int *)(param_1 + 8) = in_EDX;
  *(int *)(param_1 + 0xc) = iVar3;
  if (0x10 < in_ECX) {
    *(undefined4 *)(**(int **)(param_1 + 0x10) + 0x14) = 0x76;
    (**(code **)(**(int **)(param_1 + 0x10) + 4))(*(int **)(param_1 + 0x10),0xffffffff);
    return 0;
  }
  return (uint)*(byte *)(*(int *)(param_2 + 0x48 + in_ECX * 4) + *(int *)(param_2 + 0x8c) + 0x11 +
                        uVar4);
}


