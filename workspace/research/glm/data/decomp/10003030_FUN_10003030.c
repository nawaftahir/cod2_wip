// 10003030 size=328 FUN_10003030

undefined4 FUN_10003030(int param_1,int *param_2,float *param_3)

{
  char cVar1;
  int iVar2;
  int unaff_EBX;
  int iVar3;
  char *_Str1;
  float local_14;
  float local_10;
  float local_c;
  
  cVar1 = FUN_10002ed0("origin");
  if (cVar1 == '\0') {
    FUN_100138c0(1);
  }
  iVar3 = 1;
  if (1 < param_1) {
    do {
      iVar2 = __stricmp(*(char **)(unaff_EBX + iVar3 * 8),"model");
      if (iVar2 == 0) {
        _Str1 = *(char **)(unaff_EBX + 4 + iVar3 * 8);
        if (_Str1 != (char *)0x0) goto LAB_100030c4;
        goto LAB_1000309b;
      }
      iVar3 = iVar3 + 1;
    } while (iVar3 < param_1);
  }
  _Str1 = (char *)0x0;
LAB_1000309b:
  FUN_100138c0(1,&DAT_10191868,(double)local_14,(double)local_10,(double)local_c);
LAB_100030c4:
  iVar3 = __strnicmp(_Str1,"xmodel/shadow_",0xe);
  if (iVar3 == 0) {
    return 0;
  }
  iVar3 = R_RegisterModel();
  if (((iVar3 == 0) || (iVar2 = (*(code *)RI_XModelGetSurfaces)(), iVar2 != 0)) ||
     (cVar1 = FUN_1002a940(), cVar1 == '\0')) {
    FUN_10061c80("^1bad static model \'%s\' at (%.0f %.0f %.0f)\n",_Str1,(double)local_14,
                 (double)local_10,(double)local_c);
    iVar3 = R_RegisterModel("xmodel/default_static_model");
  }
  if ((iVar3 != 0) && (iVar2 = (*(code *)RI_XModelGetSurfaces)(), iVar2 == 0)) {
    if (param_2 != (int *)0x0) {
      *param_2 = iVar3;
    }
    if (param_3 != (float *)0x0) {
      *param_3 = local_14;
      param_3[1] = local_10;
      param_3[2] = local_c;
    }
    return 1;
  }
  return 0;
}


