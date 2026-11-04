extern unsigned int DAT_101ce708;
extern unsigned int DAT_101d1b9c;
extern int FUN_1001d720();
extern int FUN_1001ee70();
extern int FUN_1002adb0();
extern int FUN_1002b3c0();
extern int FUN_10059250();


void FUN_1002b690(int *param_1,int param_2)

{
  unsigned int *puVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  unsigned int uVar5;
  unsigned char auStack_80 [64];
  unsigned char auStack_40 [60];
  
  puVar1 = (unsigned int *)*param_1;
  iVar2 = puVar1[2];
  iVar3 = param_1[1];
  iVar4 = *(int *)(DAT_101d1b9c + 0xf8);
  (*(void *)RI_XModelGetBasePose)
            (*(unsigned int *)(iVar3 * 0x60 + 0x10 + iVar4),(int)*(short *)(iVar2 + 6));
  FUN_1001d720();
  FUN_1001ee70(auStack_80,*(unsigned int *)(iVar3 * 0x60 + iVar4 + 0x50));
  FUN_10059250();
  FUN_10059250();
  FUN_10059250();
  uVar5 = *puVar1;
  if (*(int *)(DAT_101ce708 + 8) == 2) {
    FUN_1002b3c0(auStack_80,uVar5,(int)*(short *)(iVar2 + 2),*(unsigned int *)(iVar2 + 0xc),param_1[2]
                 ,param_2 + 0x2000);
    return;
  }
  FUN_1002adb0(auStack_40,uVar5,(int)*(short *)(iVar2 + 2),*(unsigned int *)(iVar2 + 0xc),
               param_2 + 0x2000);
  return;
}


