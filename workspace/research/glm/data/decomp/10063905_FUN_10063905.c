// 10063905 size=111 FUN_10063905

int FUN_10063905(int param_1,int *param_2)

{
  int iVar1;
  void *pvVar2;
  int iVar3;
  
  if (param_1 == 0) {
    iVar1 = -0x7789f794;
  }
  else if (param_2 == (int *)0x0) {
    iVar1 = -0x7789f794;
  }
  else {
    pvVar2 = operator_new(0x14);
    if (pvVar2 == (void *)0x0) {
      iVar3 = 0;
    }
    else {
      iVar3 = FUN_100822ce();
    }
    if (iVar3 == 0) {
      iVar1 = -0x7ff8fff2;
    }
    else {
      iVar1 = FUN_100821c3(param_1);
      if (iVar1 < 0) {
        FUN_10063863(1);
      }
      else {
        *param_2 = iVar3;
        iVar1 = 0;
      }
    }
  }
  return iVar1;
}


