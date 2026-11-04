// 10002f50 size=192 FUN_10002f50

undefined4 FUN_10002f50(char *param_1,int param_2,float *param_3)

{
  float fVar1;
  char *in_EAX;
  int iVar2;
  float *pfVar3;
  float *pfVar4;
  undefined1 uVar5;
  int iVar6;
  char *_Src;
  int unaff_EDI;
  int local_10;
  undefined1 local_c [4];
  undefined1 local_8 [4];
  undefined1 local_4 [4];
  
  iVar6 = 1;
  if (unaff_EDI < 2) {
LAB_10002f97:
    uVar5 = 0;
    _Src = param_1;
  }
  else {
    do {
      iVar2 = __stricmp(*(char **)(param_2 + iVar6 * 8),in_EAX);
      if (iVar2 == 0) {
        _Src = *(char **)(param_2 + 4 + iVar6 * 8);
        if (_Src == (char *)0x0) goto LAB_10002f97;
        uVar5 = 1;
        goto LAB_10002fa3;
      }
      iVar6 = iVar6 + 1;
    } while (iVar6 < unaff_EDI);
    uVar5 = 0;
    _Src = param_1;
  }
LAB_10002fa3:
  iVar6 = _sscanf(_Src,"%02x%02x%02x%02x",&local_10,local_c,local_8,local_4);
  if (iVar6 != 4) {
    FUN_100138c0(1,&DAT_101918f0);
  }
  iVar6 = 4;
  pfVar3 = param_3;
  do {
    fVar1 = (float)*(int *)(((int)&local_10 - (int)param_3) + (int)pfVar3);
    if (*(int *)(((int)&local_10 - (int)param_3) + (int)pfVar3) < 0) {
      fVar1 = fVar1 + 4.2949673e+09;
    }
    pfVar4 = pfVar3 + 1;
    iVar6 = iVar6 + -1;
    *pfVar3 = fVar1 * 0.003921569;
    pfVar3 = pfVar4;
  } while (iVar6 != 0);
  return CONCAT31((int3)((uint)pfVar4 >> 8),uVar5);
}


