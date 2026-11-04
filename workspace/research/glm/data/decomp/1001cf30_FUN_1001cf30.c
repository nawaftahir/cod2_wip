// 1001cf30 size=154 FUN_1001cf30

void FUN_1001cf30(undefined4 param_1)

{
  undefined4 *puVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  undefined4 *in_EAX;
  int in_ECX;
  int iVar5;
  
  for (iVar5 = in_ECX - (int)in_EAX; 1 < iVar5 / 0xc; iVar5 = iVar5 + -0xc) {
    puVar1 = (undefined4 *)((int)in_EAX + iVar5 + -0xc);
    uVar2 = *puVar1;
    uVar3 = puVar1[1];
    uVar4 = puVar1[2];
    *puVar1 = *in_EAX;
    puVar1[1] = in_EAX[1];
    puVar1[2] = in_EAX[2];
    FUN_1001d320((iVar5 + -0xc) / 0xc,uVar2,uVar3,uVar4,param_1);
  }
  return;
}


