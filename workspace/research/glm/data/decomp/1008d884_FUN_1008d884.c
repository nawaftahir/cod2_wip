// 1008d884 size=129 FUN_1008d884

undefined4 FUN_1008d884(int param_1,int param_2)

{
  int iVar1;
  int iVar2;
  undefined4 uVar3;
  int in_ECX;
  
  iVar1 = param_1;
  if ((*(int *)(param_1 + 0x48) != -1) && (*(int *)(param_2 + 0x14) != -1)) {
    param_1 = 0;
    if (*(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *(int *)(param_2 + 0x14) * 4) + 0x48) != -1) {
      param_1 = FUN_1008552a();
    }
    iVar2 = FUN_1008576b();
    if ((iVar2 != 0) && (param_1 == 0)) {
      *(undefined4 *)(iVar1 + 0x14) = 0xffffffff;
      *(undefined4 *)(iVar1 + 0x18) = 1;
      return 0;
    }
  }
  uVar3 = FUN_100872f1(iVar1 + 0x14,iVar1 + 0x18,*(undefined4 *)(param_2 + 0x14),
                       *(undefined4 *)(param_2 + 0x18));
  return uVar3;
}


