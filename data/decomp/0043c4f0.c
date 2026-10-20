
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_0043c4f0(int param_1,undefined4 *param_2)

{
  int iVar1;
  float fVar2;
  undefined1 local_3c [16];
  undefined4 local_2c;
  float local_28;
  float local_20;
  undefined4 local_1c;
  undefined1 local_18 [12];
  undefined4 local_c;
  float local_8;
  
  iVar1 = *(int *)(param_1 + 0x10);
  if ((float)iVar1 != _DAT_00556a70) {
    FUN_00470c50();
    fVar2 = -(float)iVar1;
    FUN_004897c0(fVar2,&local_8,&local_c);
    FUN_00485040();
    local_28 = -local_8;
    local_2c = local_c;
    local_1c = local_c;
    local_20 = local_8;
    FUN_00470ce0(local_18,local_3c,1,0,fVar2);
    DAT_0123348c = 0xffffffff;
    *param_2 = 0;
    return;
  }
  *param_2 = 0;
  return;
}

