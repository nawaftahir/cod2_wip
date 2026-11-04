// 10055d80 size=102 FUN_10055d80

int * FUN_10055d80(void)

{
  byte *pbVar1;
  int in_EAX;
  int *piVar2;
  int in_ECX;
  int iVar3;
  int *piVar4;
  int *piVar5;
  undefined1 *puVar6;
  
  piVar2 = (int *)(*(code *)**(undefined4 **)(in_EAX + 4))();
  puVar6 = &DAT_101910f0;
  piVar4 = piVar2;
  do {
    iVar3 = 0;
    piVar5 = piVar4;
    do {
      pbVar1 = puVar6 + iVar3;
      iVar3 = iVar3 + 1;
      piVar4 = piVar5 + 1;
      *piVar5 = (int)((uint)*pbVar1 * -0x1fe + 0xfe01) / (in_ECX * 0x200 + -0x200);
      piVar5 = piVar4;
    } while (iVar3 < 0x10);
    puVar6 = puVar6 + 0x10;
  } while ((int)puVar6 < 0x101911f0);
  return piVar2;
}


