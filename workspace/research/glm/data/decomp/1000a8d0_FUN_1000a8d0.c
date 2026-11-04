// 1000a8d0 size=399 FUN_1000a8d0

void FUN_1000a8d0(void)

{
  undefined4 uVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  int unaff_EDI;
  undefined1 auStack_78 [120];
  
  uVar1 = (*(code *)RI_HiAlloc)(0x1000);
  uVar2 = (*(code *)RI_HiOffToPtr)(uVar1);
  uVar3 = (*(code *)RI_HiAlloc)(0x1e000);
  DAT_101ce5cc = (*(code *)RI_HiOffToPtr)(uVar3);
  DAT_101ce5ec = *(undefined1 *)(DAT_101ce6a4 + 8);
  DAT_101ce5ed = *(char *)(DAT_101ce64c + 8);
  if ((*(char *)(DAT_101ce654 + 8) == '\0') || (DAT_101ce5f0 = 1, DAT_101ce5ed == '\0')) {
    DAT_101ce5f0 = 0;
  }
  if ((*(char *)(DAT_101ce760 + 8) == '\0') || (DAT_101ce5ee = 1, DAT_101ce5ed == '\0')) {
    DAT_101ce5ee = 0;
  }
  if ((*(char *)(DAT_101ce65c + 8) == '\0') || (DAT_101ce5ef = 1, DAT_101ce5ed == '\0')) {
    DAT_101ce5ef = 0;
  }
  DAT_101ce5c0 = 0;
  DAT_101ce5b8 = unaff_EDI + 200;
  DAT_101ce5bc = unaff_EDI + 0x108;
  DAT_101ce5c4 = uVar2;
  FUN_10006be0(&DAT_10182948,4);
  if (*(float *)(unaff_EDI + 0xc4) == 0.0) {
    FUN_1000a3c0();
  }
  else {
    FUN_1000a550();
  }
  uVar2 = FUN_100062a0();
  DAT_101d7e90 = unaff_EDI;
  FUN_1000a680(auStack_78);
  FUN_1000a780(auStack_78,uVar2);
  FUN_1000a840(auStack_78);
  if (*(int *)(DAT_101ce6d4 + 8) != 0) {
    FUN_10035cd0(auStack_78,uVar2);
  }
  (*(code *)RI_HiSetOffset)(uVar3);
  (*(code *)RI_HiSetOffset)(uVar1);
  return;
}


