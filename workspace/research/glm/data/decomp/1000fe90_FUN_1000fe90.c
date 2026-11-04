// 1000fe90 size=605 FUN_1000fe90

/* WARNING: Function: __chkstk replaced with injection: alloca_probe */

void FUN_1000fe90(int *param_1)

{
  float fVar1;
  undefined1 *puVar2;
  float10 fVar3;
  int local_105c;
  int local_1054;
  float local_1048;
  undefined1 local_1040;
  undefined1 local_103c;
  undefined1 local_1038;
  undefined1 local_1034;
  float local_1030;
  float local_102c;
  float local_1028;
  float local_1024;
  undefined1 local_1000 [4092];
  undefined4 uStack_4;
  
  uStack_4 = 0x1000fe9a;
  puVar2 = local_1000;
  local_1054 = 0;
  do {
    local_105c = 0;
    fVar1 = ((float)local_1054 + 0.5) / 32.0;
    local_1048 = (fVar1 + fVar1) - 1.0;
    do {
      fVar1 = ((float)local_105c + 0.5) / 32.0;
      fVar1 = (fVar1 + fVar1) - 1.0;
      if (1.0 - (local_1048 * local_1048 + fVar1 * fVar1) < 0.0) {
        fVar3 = (float10)FUN_1010a920();
        if ((float)fVar3 != 0.0) {
          local_1048 = (1.0 / (float)fVar3) * local_1048;
        }
      }
      FUN_1010a920();
      FUN_1000fd70();
      local_103c = (undefined1)(int)ROUND(local_1030 * 255.0 + 9.313226e-10);
      *puVar2 = local_103c;
      local_1034 = (undefined1)(int)ROUND(local_102c * 255.0 + 9.313226e-10);
      puVar2[1] = local_1034;
      local_1038 = (undefined1)(int)ROUND(local_1028 * 255.0 + 9.313226e-10);
      puVar2[2] = local_1038;
      local_1040 = (undefined1)(int)ROUND(local_1024 * 255.0 + 9.313226e-10);
      puVar2[3] = local_1040;
      puVar2 = puVar2 + 4;
      local_105c = local_105c + 1;
    } while (local_105c < 0x20);
    local_1054 = local_1054 + 1;
  } while (local_1054 < 0x20);
  FUN_1000ee30(0x20,0x20,1,3,0);
  if (*param_1 != 4) {
    FUN_1000ea20(0x15,local_1000);
    return;
  }
  FUN_1000ec00(param_1,0x15,0,local_1000);
  return;
}


