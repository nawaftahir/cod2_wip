// 10068174 size=126 FUN_10068174

int FUN_10068174(char *param_1,uint *param_2)

{
  char cVar1;
  bool bVar2;
  uint uVar3;
  int iVar4;
  int in_ECX;
  char *pcVar5;
  
  if ((param_1 < *(char **)(in_ECX + 4)) && (*param_1 == '0')) {
    uVar3 = 0;
    bVar2 = false;
    pcVar5 = param_1;
    while (((pcVar5 = pcVar5 + 1, pcVar5 < *(char **)(in_ECX + 4) && (cVar1 = *pcVar5, '/' < cVar1))
           && (cVar1 < '8'))) {
      if ((uVar3 & 0xe0000000) != 0) {
        bVar2 = true;
      }
      uVar3 = cVar1 + -0x30 + uVar3 * 8;
    }
    if (param_2 != (uint *)0x0) {
      *param_2 = uVar3;
    }
    if (bVar2) {
      FUN_10067c3e(*(undefined4 *)(in_ECX + 0x30),in_ECX + 8,0x3eb,"octal value truncated to 32bits"
                  );
    }
    iVar4 = (int)pcVar5 - (int)param_1;
  }
  else {
    iVar4 = 0;
  }
  return iVar4;
}


