extern unsigned int DAT_101ae500;
extern unsigned int DAT_101ae504;
extern unsigned int DAT_101ae508;
extern unsigned int DAT_10678504;


void FUN_100058b0(int param_1)

{
  int iVar1;
  unsigned int uVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  unsigned int *puVar6;
  unsigned int *puVar7;
  unsigned int *puVar8;
  
  iVar5 = 0;
  iVar3 = g_101ae504;
 
	int g_101ae504 = DAT_101ae504; puVar7 = g_101ae500;
  i
	int g_101ae500 = DAT_101ae500;f (0 < g_101ae504) {
    iVar4 = 0;
    do {
      iVar1 = DAT_10678504 - *(int *)(iVar4 + 0x20 + (int)puVar7);
      if ((iVar1 < 0) || ((int)((unsigned int *)(iVar4 + (int)puVar7))[9] < iVar1)) {
        g_101ae504 = iVar3 + -1;
        puVar6 = puVar7 + g_101ae504 * 10;
        puVar8 = (unsigned int *)(iVar4 + (int)puVar7);
        for (iVar1 = 10; iVar3 = g_101ae504, puVar7 = g_101ae500, iVar1 != 0; iVar1 = iVar1 + -1
            ) {
          *puVar8 = *puVar6;
          puVar6 = puVar6 + 1;
          puVar8 = puVar8 + 1;
        }
      }
      else {
        iVar5 = iVar5 + 1;
        iVar4 = iVar4 + 0x28;
      }
    } while (iVar5 < iVar3);
  }
  if (puVar7 == (unsigned int *)0x0) {
    *(int *)(param_1 + 0x4c) = iVar3;
    return;
  }
  if (*(int *)(param_1 + 0x48) == 0) {
    uVar2 = (*(void *)RI_Z_MallocInternal)(DAT_101ae508 * 0x28);
    *(unsigned int *)(param_1 + 0x48) = uVar2;
    iVar3 = g_101ae504;
    puVar7 = g_101ae500;
  }
  puVar6 = *(unsigned int **)(param_1 + 0x48);
  for (iVar3 = (iVar3 * 5 & 0x1fffffffU) << 1; iVar3 != 0; iVar3 = iVar3 + -1) {
    *puVar6 = *puVar7;
    puVar7 = puVar7 + 1;
    puVar6 = puVar6 + 1;
  }
  for (iVar3 = 0; iVar3 != 0; iVar3 = iVar3 + -1) {
    *(unsigned char *)puVar6 = *(unsigned char *)puVar7;
    puVar7 = (unsigned int *)((int)puVar7 + 1);
    puVar6 = (unsigned int *)((int)puVar6 + 1);
  }
  *(int *)(param_1 + 0x4c) = g_101ae504;
  return;
}


