extern int FUN_1006506e();
extern int FUN_10082872();
extern int FUN_10083255();
extern int FUN_10083357();
extern int FUN_1009a568();
extern int FUN_1009ee58();


int FUN_100a06b8(void *param_1)

{
  int iVar1;
  unsigned int uVar2;
  void *_Memory;
  int iVar3;
  int iVar4;
  int *piVar5;
  unsigned int local_8;
  
  iVar1 = (int)param_1;
  if ((param_1 == (void *)0x0) || (*(int *)((int)param_1 + 4) != 0xd)) {
    return 0;
  }
  uVar2 = *(int *)((int)param_1 + 0x18) * *(int *)((int)param_1 + 0x14);
  _Memory = operator_new(uVar2 * 0x10);
  if ((_Memory != (void *)0x0) && (iVar3 = FUN_1009ee58(param_1,_Memory), -1 < iVar3)) {
    iVar3 = FUN_1006506e(0x50);
    if (iVar3 == 0) {
      iVar3 = 0;
    }
    else {
      iVar3 = FUN_10083255(0,0,0,0,1,(int)param_1 + 0x30);
    }
    if (iVar3 != 0) {
      if (*(int *)((int)param_1 + 0x10) != 0) {
        iVar4 = (**(void **)(**(int **)((int)param_1 + 0x10) + 4))();
        *(int *)(iVar3 + 0x10) = iVar4;
        if (iVar4 == 0) goto LAB_100a07cb;
      }
      local_8 = 0;
      piVar5 = (int *)(iVar3 + 0x20);
      param_1 = _Memory;
      if (uVar2 != 0) {
        do {
          iVar4 = FUN_1006506e(0x14);
          if (iVar4 == 0) {
            iVar4 = 0;
          }
          else {
            iVar4 = FUN_10082872(0,0,"Value");
          }
          *piVar5 = iVar4;
          if (iVar4 == 0) goto LAB_100a07cb;
          iVar4 = FUN_1006506e(0x40);
          if (iVar4 == 0) {
            iVar4 = 0;
          }
          else {
            iVar4 = FUN_10083357(param_1,iVar1 + 0x30);
          }
          *(int *)(*piVar5 + 8) = iVar4;
          if (iVar4 == 0) goto LAB_100a07cb;
          piVar5 = (int *)(*piVar5 + 0xc);
          local_8 = local_8 + 1;
          param_1 = (void *)((int)param_1 + 0x10);
        } while (local_8 < uVar2);
      }
      FUN_1009a568(iVar3);
      goto LAB_100a07cd;
    }
  }
LAB_100a07cb:
  iVar3 = 0;
LAB_100a07cd:
  _free(_Memory);
  return iVar3;
}


