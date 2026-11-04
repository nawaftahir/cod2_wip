// 1009a7cb size=313 FUN_1009a7cb

int FUN_1009a7cb(int param_1)

{
  void *pvVar1;
  int iVar2;
  uint uVar3;
  undefined4 *puVar4;
  undefined4 *puVar5;
  uint *in_ECX;
  uint uVar6;
  undefined4 *puVar7;
  int *local_c;
  void *local_8;
  
  local_c = (int *)0x0;
  local_8 = (void *)0x0;
  FUN_10068c26();
  if (param_1 == 0) {
LAB_1009a817:
    iVar2 = FUN_1006be48(in_ECX[1],*in_ECX & 0xc3,local_8,&local_c);
    if (-1 < iVar2) {
      uVar3 = (**(code **)(*local_c + 0x10))(local_c);
      puVar4 = (undefined4 *)FUN_100826bd(uVar3,1);
      if (puVar4 != (undefined4 *)0x0) {
        puVar5 = (undefined4 *)(**(code **)(*local_c + 0xc))(local_c);
        puVar7 = puVar4;
        for (uVar6 = uVar3 >> 2; uVar6 != 0; uVar6 = uVar6 - 1) {
          *puVar7 = *puVar5;
          puVar5 = puVar5 + 1;
          puVar7 = puVar7 + 1;
        }
        for (uVar6 = uVar3 & 3; uVar6 != 0; uVar6 = uVar6 - 1) {
          *(undefined1 *)puVar7 = *(undefined1 *)puVar5;
          puVar5 = (undefined4 *)((int)puVar5 + 1);
          puVar7 = (undefined4 *)((int)puVar7 + 1);
        }
        if (local_c != (int *)0x0) {
          (**(code **)(*local_c + 8))(local_c);
          local_c = (int *)0x0;
        }
        iVar2 = FUN_1006506e(0x38);
        if (iVar2 == 0) {
          iVar2 = 0;
        }
        else {
          iVar2 = FUN_100835be(in_ECX + 8,puVar4,uVar3);
        }
        if (iVar2 != 0) {
          _free(local_8);
          FUN_1006b285();
          return iVar2;
        }
        FUN_1006b285();
        goto LAB_1009a8c6;
      }
    }
  }
  else {
    pvVar1 = operator_new(8);
    if (pvVar1 == (void *)0x0) {
      local_8 = (void *)0x0;
    }
    else {
      local_8 = (void *)FUN_1008430d(in_ECX,in_ECX[4]);
    }
    if (local_8 != (void *)0x0) goto LAB_1009a817;
  }
  FUN_1006b285();
LAB_1009a8c6:
  in_ECX[0x10] = 1;
  _free(local_8);
  if (local_c != (int *)0x0) {
    (**(code **)(*local_c + 8))(local_c);
  }
  return 0;
}


