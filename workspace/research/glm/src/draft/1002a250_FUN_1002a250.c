extern int FUN_1002a200();
extern int FUN_1005da30();


void FUN_1002a250(unsigned int param_1,int param_2,unsigned int param_3,float *param_4,
                 unsigned int *param_5)

{
  unsigned int uVar1;
  int iVar2;
  float afStack_18 [4];
  unsigned int uStack_8;
  unsigned int uStack_4;
  
  iVar2 = *(int *)(param_2 + 8);
  do {
    if (iVar2 != -2) {
      if (*(int *)(param_2 + 8) < 0) {
        return;
      }
      FUN_1002a200();
      return;
    }
    iVar2 = FUN_1005da30(param_4,param_5,*(unsigned int *)(param_2 + 0xc));
    if (iVar2 == 3) {
      if (*(byte *)(*(int *)(param_2 + 0xc) + 0x10) < 3) {
        afStack_18[2] = param_4[2];
        afStack_18[0] = *param_4;
        afStack_18[1] = param_4[1];
        uVar1 = *param_5;
        afStack_18[*(byte *)(*(int *)(param_2 + 0xc) + 0x10)] =
             *(float *)(*(int *)(param_2 + 0xc) + 0xc);
        afStack_18[3] = (float)uVar1;
        iVar2 = *(int *)(param_2 + 0xc);
        uStack_8 = param_5[1];
        uStack_4 = param_5[2];
        afStack_18[*(byte *)(iVar2 + 0x10) + 3] = *(float *)(iVar2 + 0xc);
        if (afStack_18[*(byte *)(iVar2 + 0x10)] < (float)param_5[*(byte *)(iVar2 + 0x10)]) {
          FUN_1002a250(param_1,*(unsigned int *)(param_2 + 0x10),param_3,afStack_18,param_5);
        }
        FUN_1002a250(param_1,*(unsigned int *)(param_2 + 0x14),param_3,param_4,afStack_18 + 3);
        return;
      }
      FUN_1002a250(param_1,*(unsigned int *)(param_2 + 0x10),param_3,param_4,param_5);
      param_2 = *(int *)(param_2 + 0x14);
    }
    else {
      param_2 = *(int *)(param_2 + 0xc + iVar2 * 4);
    }
    iVar2 = *(int *)(param_2 + 8);
  } while( true );
}


