// 10018ee0 size=161 FUN_10018ee0

bool FUN_10018ee0(int *param_1)

{
  int iVar1;
  char *pcVar2;
  undefined4 *unaff_ESI;
  
  iVar1 = FUN_1005faf0("stateMap",1);
  if (iVar1 != 0) {
    iVar1 = DAT_101aac70 * 0x45c;
    if ((&DAT_101a6ab4)[iVar1] != '\0') {
      (&DAT_101a6ab4)[iVar1] = 0;
      *unaff_ESI = *(undefined4 *)(&DAT_101a6ac8 + iVar1);
      *(undefined4 *)(&DAT_101a6ab0 + iVar1) = *(undefined4 *)(&DAT_101a6ac4 + iVar1);
    }
    pcVar2 = (char *)FUN_1005f690();
    if ((*pcVar2 == '\0') || (*pcVar2 == ';')) {
      FUN_1005f360("missing stateMap filename\n");
    }
    else {
      iVar1 = FUN_10018e80();
      *param_1 = iVar1;
      if (iVar1 != 0) {
        iVar1 = FUN_1005faf0(&DAT_10195820,1);
        return iVar1 != 0;
      }
    }
  }
  return false;
}


