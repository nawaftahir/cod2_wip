// 100673e4 size=92 FUN_100673e4

int FUN_100673e4(void)

{
  int iVar1;
  undefined4 uVar2;
  int in_ECX;
  int local_24 [8];
  
  if (*(int *)(in_ECX + 0x68) == 0) {
    iVar1 = -0x7789f794;
  }
  else {
    do {
      iVar1 = FUN_1006709e(local_24);
      if (iVar1 < 0) {
        return iVar1;
      }
    } while (local_24[0] != 0xd);
    iVar1 = *(int *)(in_ECX + 0x68);
    *(undefined4 *)(in_ECX + 0x68) = *(undefined4 *)(iVar1 + 4);
    *(undefined4 *)(iVar1 + 4) = 0;
    FUN_10063dcf(1);
    if (*(undefined4 **)(in_ECX + 0x68) == (undefined4 *)0x0) {
      uVar2 = 1;
    }
    else {
      uVar2 = **(undefined4 **)(in_ECX + 0x68);
    }
    *(undefined4 *)(in_ECX + 0x298) = uVar2;
    iVar1 = 0;
  }
  return iVar1;
}


