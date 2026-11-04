// 10034500 size=215 FUN_10034500

void FUN_10034500(void)

{
  int in_EAX;
  undefined4 uVar1;
  int iVar2;
  int in_ECX;
  int iVar3;
  bool bVar4;
  bool bVar5;
  bool bVar6;
  int iStack_4;
  
  if (in_EAX != 0) {
    if (DAT_1072debd != '\0') {
      FUN_1002e380();
    }
    uVar1 = (*(code *)RI_Z_MallocInternal)(0xaa50);
    bVar5 = *(int *)(in_ECX + 0x28) != 0;
    iVar2 = 0;
    bVar4 = bVar5;
    if (0 < in_EAX) {
      iVar3 = in_ECX + 0x18;
      iStack_4 = in_EAX;
      do {
        bVar6 = *(int *)(iVar3 + 0x10) != 0;
        if (bVar5 != bVar6) {
          if (iVar2 / 2 != 0) {
            FUN_10031780(iVar2 / 2,1,uVar1,bVar4);
          }
          iVar2 = 0;
          bVar4 = bVar6;
          bVar5 = bVar6;
        }
        iVar2 = FUN_10034010(iVar3 + -0x18,iVar3 + -0xc,bVar4,iVar2);
        iVar3 = iVar3 + 0x2c;
        iStack_4 = iStack_4 + -1;
      } while (iStack_4 != 0);
    }
    if (iVar2 / 2 != 0) {
      FUN_10031780(iVar2 / 2,1,uVar1,bVar4);
    }
    (*(code *)RI_Z_FreeInternal)(uVar1);
  }
  return;
}


