
void __thiscall FUN_004bec60(int *param_1,int *param_2)

{
  int iVar1;
  undefined4 *puVar2;
  
  iVar1 = *param_2;
  *param_1 = iVar1;
  if (iVar1 != 0) {
    if (param_1[2] == 0) {
      puVar2 = (undefined4 *)FUN_004ff450(0x114);
      if (puVar2 == (undefined4 *)0x0) {
        puVar2 = (undefined4 *)0x0;
      }
      else {
        *puVar2 = &PTR_FUN_00529cc0;
        puVar2[0x15] = 0;
        puVar2[0x14] = 0;
        puVar2[0x13] = &DAT_00598c80;
        puVar2[0x18] = 0;
        puVar2[0x17] = 0;
        puVar2[0x16] = &DAT_00598c80;
      }
      param_1[2] = (int)puVar2;
    }
    param_1[1] = param_2[1];
    FUN_004be9d0(param_2[2]);
  }
  return;
}

