// 10010b30 size=99 FUN_10010b30

int FUN_10010b30(undefined2 param_1)

{
  int iVar1;
  int iVar2;
  undefined2 unaff_DI;
  
  iVar2 = FUN_1000cc10();
  iVar1 = DAT_101ce708;
  *(undefined2 *)(iVar2 + 0x18) = param_1;
  *(undefined2 *)(iVar2 + 0x1a) = unaff_DI;
  if (*(int *)(iVar1 + 8) == 2) {
    FUN_1000ce80(1,0x200,0);
    return iVar2;
  }
  FUN_1000ce80(0,0x200,0);
  return iVar2;
}


