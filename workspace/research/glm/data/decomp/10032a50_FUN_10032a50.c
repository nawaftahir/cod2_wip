// 10032a50 size=442 FUN_10032a50

void FUN_10032a50(char *param_1,undefined4 param_2,float *param_3,undefined4 param_4)

{
  char cVar1;
  float *pfVar2;
  int iVar3;
  float *unaff_ESI;
  float fStack_18;
  float fStack_14;
  float fStack_10;
  float fStack_c;
  float fStack_8;
  float fStack_4;
  
  pfVar2 = param_3;
  FUN_1003e300();
  cVar1 = *param_1;
  while (cVar1 != '\0') {
    (*(code *)RI_Com_GetBsp)(&param_1,0);
    iVar3 = FUN_1000bc70(param_2);
    param_3 = (float *)(uint)*(byte *)(iVar3 + 6);
    fStack_4 = (float)*(byte *)(iVar3 + 5);
    fStack_c = fStack_4 * *unaff_ESI;
    fStack_8 = fStack_4 * unaff_ESI[1];
    fStack_4 = fStack_4 * unaff_ESI[2];
    fStack_10 = (float)(int)param_3;
    fStack_18 = fStack_10 * *pfVar2;
    fStack_14 = fStack_10 * pfVar2[1];
    fStack_10 = fStack_10 * pfVar2[2];
    FUN_10032890(&fStack_c,&fStack_18,iVar3,param_4);
    param_3 = (float *)(uint)*(byte *)(iVar3 + 4);
    cVar1 = *param_1;
  }
  return;
}


