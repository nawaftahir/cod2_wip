// 10064392 size=106 FUN_10064392

undefined4 FUN_10064392(void)

{
  int *piVar1;
  int in_ECX;
  undefined4 uVar2;
  char *pcVar3;
  
  piVar1 = *(int **)(*(int *)(in_ECX + 0x268) + 0x38);
  if (piVar1 == (int *)0x0) {
    pcVar3 = "unexpected #else";
    uVar2 = 0x5e5;
  }
  else {
    if (piVar1[2] == 0) {
      uVar2 = 0;
      if ((*piVar1 == 0) && (piVar1[1] != 0)) {
        uVar2 = 1;
      }
      *(undefined4 *)(in_ECX + 0x54) = uVar2;
      *piVar1 = 1;
      piVar1[2] = 1;
      return 0;
    }
    pcVar3 = "unexpected #else following #else";
    uVar2 = 0x5ea;
  }
  FUN_10067c3e(in_ECX + 0x18,in_ECX + 0x278,uVar2,pcVar3);
  *(undefined4 *)(in_ECX + 0x44) = 1;
  return 0x80004005;
}


