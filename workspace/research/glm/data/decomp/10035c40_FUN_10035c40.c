// 10035c40 size=129 FUN_10035c40

int FUN_10035c40(int param_1,int param_2,int param_3)

{
  int iVar1;
  char cVar2;
  int iVar3;
  int iVar4;
  int unaff_EBX;
  int iVar5;
  int iVar6;
  
  iVar5 = DAT_1076457c + -1;
  iVar6 = 0;
  if (-1 < iVar5) {
    do {
      iVar3 = iVar6 + iVar5 >> 1;
      iVar1 = DAT_10764578 + iVar3 * 6;
      iVar4 = unaff_EBX - (uint)*(ushort *)(DAT_10764578 + iVar3 * 6);
      if (((iVar4 == 0) && (iVar4 = param_1 - (uint)*(ushort *)(iVar1 + 2), iVar4 == 0)) &&
         (iVar4 = param_2 - (uint)*(ushort *)(iVar1 + 4), iVar4 == 0)) {
        return iVar3;
      }
      if (iVar4 < 0) {
        iVar5 = iVar3 + -1;
      }
      else {
        iVar6 = iVar3 + 1;
      }
    } while (iVar6 <= iVar5);
  }
  if ((param_3 != 0) && (cVar2 = FUN_10035bd0(), cVar2 != '\0')) {
    return iVar6;
  }
  return -1;
}


