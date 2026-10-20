
void FUN_00491030(undefined4 param_1,float param_2,float param_3,float param_4,float param_5)

{
  int iVar1;
  int iVar2;
  undefined4 uVar3;
  
  iVar1 = FUN_0048b7e0();
  iVar1 = (&DAT_01148e30)[iVar1];
  do {
    if (iVar1 == 0) {
LAB_00491067:
      uVar3 = FUN_004969e0("%g %g %g %g",(double)param_2,(double)param_3,(double)param_4,
                           (double)param_5,0x4000);
      FUN_0048fa50(param_1,uVar3);
      return;
    }
    iVar2 = FUN_004965d0();
    if (iVar2 == 0) {
      if (iVar1 != 0) {
        FUN_004904d0(param_2,param_3,param_4,param_5,0);
        return;
      }
      goto LAB_00491067;
    }
    iVar1 = *(int *)(iVar1 + 0x20);
  } while( true );
}

