// 1001a030 size=140 FUN_1001a030

uint FUN_1001a030(void)

{
  undefined2 uVar1;
  uint uVar2;
  int iVar3;
  int in_ECX;
  
  if (**(short **)(in_ECX + 0xc) == 1) {
    uVar2 = FUN_10019f10();
    if ((char)uVar2 == '\0') {
      return uVar2;
    }
  }
  else {
    *(undefined1 *)(in_ECX + 4) = 0;
    *(undefined1 *)(in_ECX + 5) = 1;
  }
  iVar3 = FUN_1005faf0(&DAT_1019563c,1);
  uVar2 = 0;
  if (iVar3 != 0) {
    uVar1 = *(undefined2 *)(*(int *)(in_ECX + 0xc) + 2);
    switch(uVar1) {
    case 3:
      uVar2 = FUN_10019ca0();
      return uVar2;
    default:
      uVar2 = FUN_1005f360("unknown constant type \'%i\'\n",uVar1);
      break;
    case 10:
    case 0xc:
    case 0xd:
    case 0xe:
      uVar2 = FUN_10019620();
      return uVar2;
    }
  }
  return uVar2 & 0xffffff00;
}


