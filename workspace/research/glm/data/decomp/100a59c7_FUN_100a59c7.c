// 100a59c7 size=136 FUN_100a59c7

void FUN_100a59c7(int param_1,char *param_2,size_t param_3)

{
  undefined4 uVar1;
  undefined4 *puVar2;
  int *in_ECX;
  
  if ((*(int *)(param_1 + 4) == in_ECX[0x20]) || (*(int *)(param_1 + 4) == in_ECX[0x21])) {
    uVar1 = (**(code **)(*in_ECX + 0x54))(*(undefined4 *)(param_1 + 0x6c));
    puVar2 = (undefined4 *)FUN_100c5108(&PTR_s_Tessfactor_101a3c68,uVar1);
    if (puVar2[4] != -1) {
      uVar1 = (**(code **)(*in_ECX + 0x58))(*(undefined4 *)(param_1 + 0x6c));
      __snprintf(param_2,param_3,"%s%s%u",**(undefined4 **)(in_ECX[4] + *(int *)(param_1 + 4) * 4),
                 *puVar2,uVar1);
      param_2[param_3 - 1] = '\0';
      return;
    }
  }
  FUN_1008b023(param_1,param_2,param_3);
  return;
}


