// 100265e0 size=266 FUN_100265e0

uint FUN_100265e0(int param_1,int param_2,undefined4 param_3,undefined4 param_4)

{
  float fVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  int in_EAX;
  int iVar5;
  float10 extraout_ST0;
  
  iVar5 = in_EAX * 0x24;
  fVar4 = (float)DAT_101d4928 * 0.5;
  fVar1 = *(float *)(&DAT_101903b0 + iVar5);
  fVar2 = *(float *)(&DAT_101903bc + iVar5);
  fVar3 = *(float *)(&DAT_101903c8 + iVar5);
  FUN_100590b0();
  FUN_1002c370(param_3,param_4,
               (((float)param_2 - fVar4) + 0.5) * fVar3 +
               (((float)param_1 - fVar4) + 0.5) * fVar2 + fVar4 * fVar1);
  return (int)ROUND((float)(extraout_ST0 * (float10)255.0) + 9.313226e-10) & 0xff;
}


