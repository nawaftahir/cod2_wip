// 1001a810 size=266 FUN_1001a810

int FUN_1001a810(undefined4 param_1)

{
  char cVar1;
  undefined4 *in_EAX;
  int iVar2;
  char *_String;
  undefined4 uVar3;
  int iVar4;
  double dVar5;
  int local_c [3];
  
  iVar2 = DAT_101aac70 * 0x45c;
  if ((&DAT_101a6ab4)[iVar2] != '\0') {
    (&DAT_101a6ab4)[iVar2] = 0;
    *in_EAX = *(undefined4 *)(&DAT_101a6ac8 + iVar2);
    *(undefined4 *)(&DAT_101a6ab0 + iVar2) = *(undefined4 *)(&DAT_101a6ac4 + iVar2);
  }
  _String = (char *)FUN_1005f690();
  dVar5 = _atof(_String);
  local_c[1] = 0;
  local_c[2] = 0x3e100000;
  local_c[0] = (int)ROUND((float)dVar5 * 10.0 + 9.313226e-10);
  iVar2 = DAT_101aac70 * 0x45c;
  if ((&DAT_101a6ab4)[iVar2] != '\0') {
    (&DAT_101a6ab4)[iVar2] = 0;
    *in_EAX = *(undefined4 *)(&DAT_101a6ac8 + iVar2);
    *(undefined4 *)(&DAT_101a6ab0 + iVar2) = *(undefined4 *)(&DAT_101a6ac4 + iVar2);
  }
  uVar3 = FUN_1005f690();
  iVar2 = local_c[0];
  cVar1 = FUN_10016c10(uVar3,param_1,local_c);
  if ((cVar1 == '\0') || (iVar4 = (&DAT_101da564)[local_c[0]], iVar4 == 0)) {
    iVar4 = FUN_1001a4c0(uVar3,param_1,iVar2);
    if (iVar4 == 0) {
      return 0;
    }
    FUN_10016cf0(uVar3,param_1,iVar4);
  }
  return iVar4;
}


