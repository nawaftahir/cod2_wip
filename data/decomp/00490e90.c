
void FUN_00490e90(undefined4 param_1,float param_2)

{
  int iVar1;
  int iVar2;
  undefined4 uVar3;
  
  iVar1 = FUN_0048b7e0();
  iVar1 = (&DAT_01148e30)[iVar1];
  do {
    if (iVar1 == 0) {
LAB_00490ec7:
      uVar3 = FUN_004969e0(&DAT_0053d750,(double)param_2,0x4000);
      FUN_0048fa50(param_1,uVar3);
      return;
    }
    iVar2 = FUN_004965d0();
    if (iVar2 == 0) {
      if (iVar1 != 0) {
        FUN_004900e0();
        return;
      }
      goto LAB_00490ec7;
    }
    iVar1 = *(int *)(iVar1 + 0x20);
  } while( true );
}

