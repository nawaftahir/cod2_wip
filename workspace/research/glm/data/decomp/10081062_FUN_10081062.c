// 10081062 size=334 FUN_10081062

int FUN_10081062(char *param_1,uint param_2)

{
  char cVar1;
  ushort uVar2;
  int iVar3;
  int iVar4;
  int in_ECX;
  int local_8;
  
  local_8 = in_ECX;
  do {
    while (iVar3 = _isspace((int)*param_1), iVar3 != 0) {
      param_1 = param_1 + 1;
    }
    cVar1 = *param_1;
    if (cVar1 == '\0') {
      return local_8;
    }
    if (cVar1 == '[') {
      do {
        param_1 = param_1 + 1;
        iVar3 = _isspace((int)*param_1);
      } while (iVar3 != 0);
      iVar3 = _isdigit((int)*param_1);
      if (iVar3 == 0) {
        return 0;
      }
      iVar3 = 0;
      while (iVar4 = _isdigit((int)*param_1), iVar4 != 0) {
        iVar3 = *param_1 + -0x30 + iVar3 * 10;
        param_1 = param_1 + 1;
      }
      while (iVar4 = _isspace((int)*param_1), iVar4 != 0) {
        param_1 = param_1 + 1;
      }
      if (*param_1 != ']') {
        return 0;
      }
      local_8 = FUN_10080c7b(iVar3);
      if (local_8 == 0) {
        return 0;
      }
      param_1 = param_1 + 1;
    }
    else {
      if (cVar1 != '.') {
        if (param_2 == 0) {
          return 0;
        }
        if (cVar1 != '.') goto LAB_10081116;
      }
      do {
        param_1 = param_1 + 1;
LAB_10081116:
        iVar3 = _isspace((int)*param_1);
      } while (iVar3 != 0);
      for (iVar3 = 0; (iVar4 = _isalnum((int)param_1[iVar3]), iVar4 != 0 || (param_1[iVar3] == '_'))
          ; iVar3 = iVar3 + 1) {
      }
      if (iVar3 == 0) {
        return 0;
      }
      uVar2 = *(ushort *)(*(int *)(local_8 + 0x18) + 10);
      param_2 = 0;
      while( true ) {
        if (uVar2 <= param_2) {
          return 0;
        }
        if ((*(int *)(*(int *)(*(int *)(local_8 + 0x38) + param_2 * 4) + 4) != 0) &&
           (iVar4 = FUN_1007d7ee(iVar3), iVar4 == 0)) break;
        param_2 = param_2 + 1;
      }
      local_8 = FUN_1007da77(param_2);
      if (local_8 == 0) {
        return 0;
      }
      param_1 = param_1 + iVar3;
    }
    param_2 = 0;
  } while( true );
}


