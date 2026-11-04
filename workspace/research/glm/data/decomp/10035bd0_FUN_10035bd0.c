// 10035bd0 size=111 FUN_10035bd0

uint FUN_10035bd0(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  int in_EDX;
  int iVar1;
  
  if (0x3fffff < (int)DAT_1076457c) {
    return DAT_1076457c & 0xffffff00;
  }
  iVar1 = in_EDX * 6;
  _memmove((void *)(DAT_10764578 + iVar1 + 6),(void *)(DAT_10764578 + iVar1),
           (DAT_1076457c - in_EDX) * 6);
  *(undefined2 *)(iVar1 + DAT_10764578) = param_1;
  *(undefined2 *)(iVar1 + 2 + DAT_10764578) = param_2;
  *(undefined2 *)(iVar1 + 4 + DAT_10764578) = param_3;
  DAT_1076457c = DAT_1076457c + 1;
  return CONCAT31((int3)(DAT_1076457c >> 8),1);
}


