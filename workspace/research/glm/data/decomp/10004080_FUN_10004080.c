// 10004080 size=240 FUN_10004080

void FUN_10004080(void)

{
  int *in_EAX;
  int iVar1;
  int iVar2;
  undefined4 *puVar3;
  undefined4 *puVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  
  iVar1 = FUN_10001940();
  iVar5 = *(int *)(*in_EAX + 0x94) + in_EAX[1];
  iVar2 = (*(code *)RI_Hunk_AllocInternal)(iVar1 * 0xc);
  iVar6 = 0;
  DAT_101ae49c = iVar2;
  if (3 < iVar1) {
    iVar7 = (iVar1 - 4U >> 2) + 1;
    iVar6 = iVar7 * 4;
    puVar4 = (undefined4 *)(iVar5 + 0xc);
    puVar3 = (undefined4 *)(iVar2 + 4);
    do {
      puVar3[-1] = puVar4[-3];
      *puVar3 = *(undefined4 *)((int)puVar3 + (iVar5 - iVar2));
      puVar3[1] = puVar4[-1];
      puVar3[2] = *puVar4;
      puVar3[3] = puVar4[1];
      puVar3[4] = puVar4[2];
      puVar3[5] = puVar4[3];
      puVar3[6] = puVar4[4];
      puVar3[7] = puVar4[5];
      puVar3[8] = puVar4[6];
      puVar3[9] = puVar4[7];
      puVar3[10] = puVar4[8];
      puVar4 = puVar4 + 0xc;
      puVar3 = puVar3 + 0xc;
      iVar7 = iVar7 + -1;
    } while (iVar7 != 0);
  }
  if (iVar6 < iVar1) {
    puVar4 = (undefined4 *)(iVar6 * 0xc + iVar5);
    puVar3 = (undefined4 *)(iVar6 * 0xc + 4 + iVar2);
    iVar1 = iVar1 - iVar6;
    do {
      puVar3[-1] = *puVar4;
      *puVar3 = *(undefined4 *)((iVar5 - iVar2) + (int)puVar3);
      puVar3[1] = puVar4[2];
      puVar4 = puVar4 + 3;
      puVar3 = puVar3 + 3;
      iVar1 = iVar1 + -1;
    } while (iVar1 != 0);
  }
  return;
}


