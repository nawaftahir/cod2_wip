


void FUN_1007e3d1(int *param_1,unsigned int param_2,int param_3,unsigned int *param_4,int param_5)

{
  int iVar1;
  int iVar2;
  
  if (param_5 != 0) {
    iVar1 = param_3 - (int)param_4;
    iVar2 = param_5;
    do {
      *param_4 = (unsigned int)(*(float *)(iVar1 + (int)param_4) != 0.0);
      param_4 = param_4 + 1;
      iVar2 = iVar2 + -1;
    } while (iVar2 != 0);
  }
  (**(void **)(*param_1 + 0x188))(param_1,param_2,param_3,param_5);
  return;
}


