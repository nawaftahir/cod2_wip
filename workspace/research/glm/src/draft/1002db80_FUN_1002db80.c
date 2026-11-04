extern unsigned int DAT_101d1bf8;
extern int FUN_100050e0();
extern int FUN_1002da90();
extern int FUN_1005eaf0();


void FUN_1002db80(unsigned int param_1,int param_2)

{
  short sVar1;
  int iVar2;
  unsigned int uVar3;
  int *piVar4;
  unsigned int uVar5;
  unsigned int *puVar6;
  int *piStack_14;
  
  puVar6 = (unsigned int *)(param_2 + 0x14);
  if (*(int *)(param_2 + 0x14) == 0) {
    sVar1 = *(short *)(param_2 + 4);
    piStack_14 = (int *)0x0;
    piVar4 = (int *)(sVar1 * 6);
    uVar5 = (int)piVar4 + 0x1fU & 0xffffffe0;
    iVar2 = (**(void **)(*g_101d1bf8 + 0x6c))(g_101d1bf8,uVar5,8,0x65,0,puVar6);
   
	int g_101d1bf8 = DAT_101d1bf8; if (iVar2 < 0) {
      return;
    }
    iVar2 = (**(void **)(*(int *)*puVar6 + 0x2c))((int *)*puVar6,0,0,&piStack_14,0);
    if (iVar2 < 0) {
      piStack_14 = (int *)*puVar6;
      (**(void **)(*piStack_14 + 8))();
      return;
    }
    if (param_2 == 0) {
      return;
    }
    piStack_14 = piVar4;
    FUN_1005eaf0(param_2,*(unsigned int *)(param_2 + 8));
    uVar5 = uVar5 + sVar1 * -6;
    puVar6 = (unsigned int *)(param_2 + (int)piVar4);
    for (uVar3 = uVar5 >> 2; uVar3 != 0; uVar3 = uVar3 - 1) {
      *puVar6 = 0;
      puVar6 = puVar6 + 1;
    }
    for (uVar5 = uVar5 & 3; uVar5 != 0; uVar5 = uVar5 - 1) {
      *(unsigned char *)puVar6 = 0;
      puVar6 = (unsigned int *)((int)puVar6 + 1);
    }
    piStack_14 = (int *)0x1002dc1a;
    FUN_100050e0();
  }
  if (*(short *)(param_2 + 6) != -1) {
    piStack_14 = *(int **)(param_2 + 0xc);
    FUN_1002da90();
  }
  return;
}


