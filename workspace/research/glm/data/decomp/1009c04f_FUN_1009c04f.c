// 1009c04f size=232 FUN_1009c04f

int FUN_1009c04f(int param_1,int *param_2)

{
  int iVar1;
  int iVar2;
  int iVar3;
  undefined4 uVar4;
  int *piVar5;
  int local_8;
  
  for (; *(int *)(param_1 + 4) != 3; param_1 = *(int *)(param_1 + 8)) {
  }
  iVar2 = FUN_1006506e(0x50);
  if (iVar2 == 0) {
    local_8 = 0;
  }
  else {
    local_8 = FUN_10083255(0,0,0,0,1,param_1 + 0x10);
  }
  if (local_8 == 0) {
LAB_1009c133:
    local_8 = 0;
  }
  else {
    if (param_2 != (int *)0x0) {
      iVar2 = (**(code **)(*param_2 + 4))();
      *(int *)(local_8 + 0x20) = iVar2;
      if (iVar2 == 0) goto LAB_1009c133;
    }
    piVar5 = (int *)(local_8 + 0x10);
    for (iVar2 = *(int *)(local_8 + 0x20); iVar2 != 0; iVar2 = *(int *)(iVar2 + 0xc)) {
      iVar1 = *(int *)(iVar2 + 8);
      if (((iVar1 != 0) && (*(int *)(iVar1 + 4) == 0xd)) && (*(int *)(iVar1 + 0x10) != 0)) {
        iVar3 = FUN_1006506e(0x14);
        if (iVar3 == 0) {
          iVar3 = 0;
        }
        else {
          iVar3 = FUN_10082872(0,0,"Types");
        }
        *piVar5 = iVar3;
        if (iVar3 == 0) goto LAB_1009c133;
        uVar4 = FUN_10082816(*(undefined4 *)(iVar1 + 0x10));
        *(undefined4 *)(*piVar5 + 8) = uVar4;
        if (*(int *)(*piVar5 + 8) == 0) goto LAB_1009c133;
        piVar5 = (int *)(*piVar5 + 0xc);
      }
    }
    FUN_1009a568(local_8);
  }
  return local_8;
}


