// 100681f2 size=163 FUN_100681f2

int FUN_100681f2(char *param_1,uint *param_2)

{
  bool bVar1;
  int iVar2;
  uint uVar3;
  int in_ECX;
  char *pcVar4;
  uint uVar5;
  
  if ((*(char **)(in_ECX + 4) <= param_1) || (iVar2 = _isdigit((int)*param_1), iVar2 == 0)) {
    return 0;
  }
  uVar5 = 0;
  bVar1 = false;
  pcVar4 = param_1;
  if (param_1 < *(char **)(in_ECX + 4)) {
    do {
      iVar2 = _isdigit((int)*pcVar4);
      if (iVar2 == 0) break;
      if (0x19999999 < uVar5) {
        bVar1 = true;
      }
      uVar3 = uVar5 * 10;
      uVar5 = *pcVar4 + -0x30 + uVar3;
      if (uVar5 < uVar3) {
        bVar1 = true;
      }
      pcVar4 = pcVar4 + 1;
    } while (pcVar4 < *(char **)(in_ECX + 4));
  }
  if (param_2 != (uint *)0x0) {
    *param_2 = uVar5;
  }
  if (bVar1) {
    FUN_10067c3e(*(undefined4 *)(in_ECX + 0x30),in_ECX + 8,0x3ec,"decimal value truncated to 32bits"
                );
  }
  return (int)pcVar4 - (int)param_1;
}


