
int * FUN_004093a0(int *param_1,undefined1 param_2)

{
  int *piVar1;
  int iVar2;
  uint uVar3;
  uint unaff_ESI;
  undefined4 *puVar4;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_005255b8;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  piVar1 = (int *)FUN_004ff4c3();
  iVar2 = (**(code **)(*piVar1 + 0xc))();
  *param_1 = iVar2 + 0x10;
  local_8 = 0;
  if (0 < (int)unaff_ESI) {
    if ((int)(1U - *(int *)(iVar2 + 0xc) | *(int *)(iVar2 + 8) - unaff_ESI) < 0) {
      FUN_00402d30(unaff_ESI);
    }
    puVar4 = (undefined4 *)*param_1;
    for (uVar3 = unaff_ESI >> 2; uVar3 != 0; uVar3 = uVar3 - 1) {
      *puVar4 = CONCAT22(CONCAT11(param_2,param_2),CONCAT11(param_2,param_2));
      puVar4 = puVar4 + 1;
    }
    for (uVar3 = unaff_ESI & 3; uVar3 != 0; uVar3 = uVar3 - 1) {
      *(undefined1 *)puVar4 = param_2;
      puVar4 = (undefined4 *)((int)puVar4 + 1);
    }
    if (*(int *)(*param_1 + -8) < (int)unaff_ESI) {
                    /* WARNING: Subroutine does not return */
      FUN_00402c90(0x80070057);
    }
    *(uint *)(*param_1 + -0xc) = unaff_ESI;
    *(undefined1 *)(unaff_ESI + *param_1) = 0;
  }
  ExceptionList = local_10;
  return param_1;
}

