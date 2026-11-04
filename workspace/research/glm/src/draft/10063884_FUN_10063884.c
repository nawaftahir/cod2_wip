extern int FUN_100636bc();
extern int FUN_10080e16();
extern int FUN_10080e37();


int FUN_10063884(unsigned int *param_1,int *param_2)

{
  void *pvVar1;
  int iVar2;
  int iVar3;
  
  iVar3 = 0;
  if (param_2 != (int *)0x0) {
    *param_2 = 0;
  }
  if ((param_1 == (unsigned int *)0x0) || (param_2 == (int *)0x0)) {
    return -0x7789f794;
  }
  if (((*param_1 & 0xffff0000) == 0xfffe0000) || ((*param_1 & 0xffff0000) == 0xffff0000)) {
    pvVar1 = operator_new(0x20);
    if (pvVar1 != (void *)0x0) {
      iVar3 = FUN_10080e16();
    }
    if (iVar3 == 0) {
      return -0x7ff8fff2;
    }
    iVar2 = FUN_10080e37(param_1,0);
    if (iVar2 < 0) {
      FUN_100636bc(1);
      return iVar2;
    }
  }
  *param_2 = iVar3;
  return 0;
}


