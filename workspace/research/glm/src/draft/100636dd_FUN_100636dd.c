extern int FUN_10062db3();
extern int FUN_10081d1e();


int FUN_100636dd(unsigned int param_1,int *param_2)

{
  int *piVar1;
  int iVar2;
  unsigned int *puVar3;
  unsigned int uVar4;
  unsigned int *puVar5;
  unsigned int local_30 [10];
  unsigned int *local_8;
  
  piVar1 = param_2;
  if (param_2 != (int *)0x0) {
    *param_2 = 0;
  }
  if ((param_1 == 0) || (param_2 == (int *)0x0)) {
    iVar2 = -0x7789f794;
  }
  else {
    iVar2 = FUN_10062db3(param_1,0x47554244,&local_8,&param_1);
    if (iVar2 >= 0) {
      puVar5 = local_8;
      if (iVar2 == 1) {
        puVar5 = local_30;
        for (iVar2 = 10; iVar2 != 0; iVar2 = iVar2 + -1) {
          *puVar5 = 0;
          puVar5 = puVar5 + 1;
        }
        local_30[0] = 0x28;
        param_1 = 0x28;
        puVar5 = local_30;
      }
      iVar2 = FUN_10081d1e(param_1,&param_2);
      if (iVar2 >= 0) {
        puVar3 = (unsigned int *)(**(void **)(*param_2 + 0xc))(param_2);
        for (uVar4 = param_1 >> 2; uVar4 != 0; uVar4 = uVar4 - 1) {
          *puVar3 = *puVar5;
          puVar5 = puVar5 + 1;
          puVar3 = puVar3 + 1;
        }
        for (param_1 = param_1 & 3; param_1 != 0; param_1 = param_1 - 1) {
          *(unsigned char *)puVar3 = *(unsigned char *)puVar5;
          puVar5 = (unsigned int *)((int)puVar5 + 1);
          puVar3 = (unsigned int *)((int)puVar3 + 1);
        }
        *piVar1 = (int)param_2;
        iVar2 = 0;
      }
    }
  }
  return iVar2;
}


