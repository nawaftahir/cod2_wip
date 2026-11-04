// 10026110 size=150 FUN_10026110

int FUN_10026110(int param_1,int param_2)

{
  char cVar1;
  int in_EAX;
  int iVar2;
  int in_ECX;
  
  if (in_ECX - DAT_101d4c6c < 0) {
    in_ECX = DAT_101d4c6c;
  }
  iVar2 = DAT_101d4c70;
  if (-1 < param_1 - DAT_101d4c70) {
    iVar2 = param_1;
  }
  iVar2 = (*(code *)RI_Z_MallocInternal)(iVar2 * in_ECX * in_EAX + param_2);
  cVar1 = FUN_10025e80(DAT_101d4c6c,DAT_101d4c70);
  if (cVar1 == '\0') {
    (*(code *)RI_Z_FreeInternal)(iVar2);
    return 0;
  }
  FUN_10025d10(DAT_101d4c6c,DAT_101d4c70,param_1,iVar2 + param_2);
  return iVar2;
}


