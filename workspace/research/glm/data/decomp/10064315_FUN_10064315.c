// 10064315 size=125 FUN_10064315

undefined4 FUN_10064315(int param_1)

{
  int *piVar1;
  int in_ECX;
  undefined4 uVar2;
  char *pcVar3;
  
  piVar1 = *(int **)(*(int *)(in_ECX + 0x268) + 0x38);
  if (piVar1 == (int *)0x0) {
    pcVar3 = "unexpected #elif";
    uVar2 = 0x5e4;
  }
  else {
    if (piVar1[2] == 0) {
      if (((param_1 == 0) || (*piVar1 != 0)) || (piVar1[1] == 0)) {
        uVar2 = 0;
      }
      else {
        uVar2 = 1;
      }
      *(undefined4 *)(in_ECX + 0x54) = uVar2;
      if (param_1 != 0) {
        *piVar1 = 1;
      }
      return 0;
    }
    pcVar3 = "unexpected #elif following #else";
    uVar2 = 0x5e9;
  }
  FUN_10067c3e(in_ECX + 0x18,in_ECX + 0x278,uVar2,pcVar3);
  *(undefined4 *)(in_ECX + 0x44) = 1;
  return 0x80004005;
}


