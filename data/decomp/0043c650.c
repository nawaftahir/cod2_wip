
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_0043c650(int param_1,undefined4 *param_2)

{
  int iVar1;
  float fVar2;
  undefined4 local_3c;
  float local_38;
  float local_30;
  undefined4 local_2c;
  undefined1 local_18 [12];
  undefined4 local_c;
  float local_8;
  
  iVar1 = *(int *)(param_1 + 0x10);
  if ((float)iVar1 != _DAT_00556a70) {
    FUN_00470c50();
    fVar2 = -(float)iVar1;
    FUN_004897c0(fVar2,&local_8,&local_c);
    FUN_00485040();
    local_38 = -local_8;
    local_3c = local_c;
    local_2c = local_c;
    local_30 = local_8;
    FUN_00470ce0(local_18,&local_3c,1,2,fVar2);
    DAT_0123348c = 0xffffffff;
    *param_2 = 0;
    return;
  }
  *param_2 = 0;
  return;
}

