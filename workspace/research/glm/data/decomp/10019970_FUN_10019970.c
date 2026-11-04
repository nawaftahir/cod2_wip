// 10019970 size=271 FUN_10019970

bool FUN_10019970(int param_1,int *param_2)

{
  int iVar1;
  char *pcVar2;
  int iVar3;
  undefined4 *unaff_EBX;
  undefined4 *unaff_EDI;
  
  iVar1 = DAT_101aac70 * 0x45c;
  if ((&DAT_101a6ab4)[iVar1] != '\0') {
    (&DAT_101a6ab4)[iVar1] = 0;
    *unaff_EDI = *(undefined4 *)(&DAT_101a6ac8 + iVar1);
    *(undefined4 *)(&DAT_101a6ab0 + iVar1) = *(undefined4 *)(&DAT_101a6ac4 + iVar1);
  }
  pcVar2 = (char *)FUN_1005f690();
  if (*pcVar2 != '[') {
    FUN_1005f3f0();
    if ((int)(uint)*(byte *)(param_1 + 5) <= (int)unaff_EBX[3]) {
      *param_2 = 0;
      return true;
    }
    FUN_1005f360("code constant \'%s\' has only %i members, but %i were requested\n",*unaff_EBX,
                 unaff_EBX[3],(uint)*(byte *)(param_1 + 5));
    return false;
  }
  iVar1 = FUN_1005ff30();
  if ((iVar1 < 0) || ((int)unaff_EBX[3] <= iVar1)) {
    FUN_1005f360("index %i is not in the range [0, %i]\n",iVar1,unaff_EBX[3] + -1);
    return false;
  }
  *param_2 = iVar1;
  if (1 < *(byte *)(param_1 + 5)) {
    iVar3 = FUN_1005faf0(&DAT_1019581c,1);
    if (iVar3 == 0) {
      return false;
    }
    iVar3 = FUN_1005ff30();
    iVar1 = (*(byte *)(param_1 + 5) - 1) + iVar1;
    if (iVar3 != iVar1) {
      FUN_1005f360("ending index %i should be %i instead\n",iVar3,iVar1);
      return false;
    }
  }
  iVar1 = FUN_1005faf0(&DAT_101958a8,1);
  return iVar1 != 0;
}


