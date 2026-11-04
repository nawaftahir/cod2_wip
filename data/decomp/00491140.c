
void FUN_00491140(undefined4 param_1,byte param_2,byte param_3,byte param_4,byte param_5)

{
  undefined4 *puVar1;
  int iVar2;
  undefined4 uVar3;
  
  iVar2 = FUN_0048b7e0();
  puVar1 = (undefined4 *)(&DAT_01148e30)[iVar2];
  do {
    if (puVar1 == (undefined4 *)0x0) {
LAB_00491177:
      uVar3 = FUN_004969e0("%g %g %g %g",param_2,param_3,param_4,param_5,0x4000);
      FUN_0048fa50(param_1,uVar3);
      return;
    }
    iVar2 = FUN_004965d0(param_1,*puVar1);
    if (iVar2 == 0) {
      if (puVar1 != (undefined4 *)0x0) {
        FUN_00490830((float)param_2,(float)param_3,(float)param_4,(float)param_5,0);
        return;
      }
      goto LAB_00491177;
    }
    puVar1 = (undefined4 *)puVar1[8];
  } while( true );
}

