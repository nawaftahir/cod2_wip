// 1001d830 size=107 R_RegisterModel

undefined4 R_RegisterModel(char *param_1)

{
  char cVar1;
  char *pcVar2;
  int iVar3;
  undefined4 uVar4;
  
  pcVar2 = param_1;
  do {
    cVar1 = *pcVar2;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  if ((uint)((int)pcVar2 - (int)(param_1 + 1)) < 0x40) {
    iVar3 = __strnicmp(param_1,"xmodel",6);
    if ((iVar3 == 0) && ((param_1[6] == '/' || (param_1[6] == '\\')))) {
      uVar4 = (*(code *)RI_CM_RayTriangleIntersect)(param_1 + 7,&DAT_1001d810,&DAT_1001d820);
      return uVar4;
    }
  }
  (*(code *)RI_Printf)(2,"R_RegisterModel: Invalid model name \'%s\'\n",param_1);
  return 0;
}


