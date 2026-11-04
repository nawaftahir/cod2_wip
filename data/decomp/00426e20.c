
void __fastcall FUN_00426e20(int param_1,int param_2,float param_3,undefined4 param_4)

{
  int iVar1;
  
  iVar1 = *(int *)(param_2 + 0x18 + param_1 * 4);
  FUN_00426c90(param_2,param_4,param_1,iVar1,(float)*(int *)(iVar1 + 0x14) * param_3,
               (float)*(int *)(iVar1 + 0x18) * param_3,0,0,0,0);
  return;
}

