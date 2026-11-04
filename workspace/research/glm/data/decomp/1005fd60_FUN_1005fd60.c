// 1005fd60 size=275 FUN_1005fd60

undefined1 * FUN_1005fd60(undefined4 *param_1)

{
  char *pcVar1;
  int iVar2;
  char *_Source;
  char *pcVar3;
  
  DAT_101aac7c = '\0';
  do {
    iVar2 = DAT_101aac70 * 0x45c;
    _Source = &DAT_101a66b0 + iVar2;
    if ((&DAT_101a6ab4)[iVar2] == '\0') {
LAB_1005fdae:
      _Source = (char *)FUN_1005f690(param_1);
    }
    else {
      (&DAT_101a6ab4)[iVar2] = 0;
      if ((&DAT_101a6ab5)[iVar2] != '\0') {
        *param_1 = *(undefined4 *)(&DAT_101a6ac8 + iVar2);
        *(undefined4 *)(&DAT_101a6ab0 + iVar2) = *(undefined4 *)(&DAT_101a6ac4 + iVar2);
        goto LAB_1005fdae;
      }
    }
    if (*_Source == '\0') {
      return &DAT_101aac7c;
    }
    if (DAT_101aac7c != '\0') {
      pcVar1 = &DAT_101aac7c;
      do {
        pcVar3 = pcVar1;
        pcVar1 = pcVar3 + 1;
      } while (*pcVar3 != '\0');
      if (0x3ff < (int)(pcVar3 + -0x101aac7c)) {
        FUN_10061cd0(0,&DAT_1019bc28);
      }
      _strncpy(pcVar3," ",0x3ff - (int)(pcVar3 + -0x101aac7c));
      DAT_101ab07b = 0;
    }
    pcVar1 = &DAT_101aac7c;
    do {
      pcVar3 = pcVar1;
      pcVar1 = pcVar3 + 1;
    } while (*pcVar3 != '\0');
    if (0x3ff < (int)(pcVar3 + -0x101aac7c)) {
      FUN_10061cd0(0,&DAT_1019bc28);
    }
    _strncpy(pcVar3,_Source,0x3ff - (int)(pcVar3 + -0x101aac7c));
    DAT_101ab07b = 0;
  } while( true );
}


