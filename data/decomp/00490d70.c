
void FUN_00490d70(undefined4 param_1,undefined4 param_2)

{
  undefined4 *puVar1;
  int iVar2;
  undefined *puVar3;
  
  iVar2 = FUN_0048b7e0();
  puVar1 = (undefined4 *)(&DAT_01148e30)[iVar2];
  do {
    if (puVar1 == (undefined4 *)0x0) {
LAB_00490da7:
      puVar3 = &DAT_0054b548;
      if ((char)param_2 == '\0') {
        puVar3 = &DAT_0053d528;
      }
      FUN_0048fa50(param_1,puVar3,0x4000);
      return;
    }
    iVar2 = FUN_004965d0(param_1,*puVar1);
    if (iVar2 == 0) {
      if (puVar1 != (undefined4 *)0x0) {
        FUN_0048fe70(param_2,0);
        return;
      }
      goto LAB_00490da7;
    }
    puVar1 = (undefined4 *)puVar1[8];
  } while( true );
}

