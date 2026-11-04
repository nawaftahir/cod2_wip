
undefined4 FUN_00448940(int *param_1,int *param_2,int *param_3)

{
  int iVar1;
  char cVar2;
  int *unaff_EBX;
  int iVar3;
  int iVar4;
  int local_10;
  
  local_10 = 0;
  if (0 < *param_1) {
    do {
      iVar4 = local_10 + 1;
      iVar3 = 0;
      if (0 < *unaff_EBX) {
        do {
          iVar1 = iVar3 + 1;
          cVar2 = FUN_00447c00(0x3dcccccd);
          if ((cVar2 != '\0') && (cVar2 = FUN_00447c00(0x3dcccccd), cVar2 != '\0')) {
            *param_2 = local_10;
            *param_3 = iVar3;
            return 1;
          }
          iVar3 = iVar1;
        } while (iVar1 < *unaff_EBX);
      }
      local_10 = iVar4;
    } while (iVar4 < *param_1);
  }
  return 0;
}

