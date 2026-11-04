// 1001d9f0 size=98 FUN_1001d9f0

void FUN_1001d9f0(undefined4 param_1,undefined4 param_2,int param_3)

{
  undefined1 uVar1;
  int in_EAX;
  int iVar2;
  int iVar3;
  
  iVar2 = (*(code *)RI_InitWorker)();
  FUN_1001d960(*(undefined4 *)(in_EAX + 0x38));
  iVar3 = 0;
  if (0 < iVar2) {
    do {
      uVar1 = (*(code *)RI_DObjGetRotTransArray)();
      *(undefined1 *)(iVar3 + param_3) = uVar1;
      iVar3 = iVar3 + 1;
    } while (iVar3 < iVar2);
  }
  (*(code *)RI_RI_unk118)();
  return;
}


