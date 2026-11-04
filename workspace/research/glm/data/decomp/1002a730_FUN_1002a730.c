// 1002a730 size=79 FUN_1002a730

void FUN_1002a730(undefined4 *param_1)

{
  int iVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  int iVar5;
  int in_ECX;
  undefined4 *puVar6;
  int in_EDX;
  
  iVar5 = 0;
  puVar6 = (undefined4 *)(in_ECX + 0x18);
  do {
    uVar2 = *(undefined4 *)(in_EDX + iVar5 * 4);
    iVar1 = iVar5 * 4;
    uVar3 = *(undefined4 *)(in_EDX + iVar5 * 4);
    iVar5 = iVar5 + 1;
    uVar4 = *(undefined4 *)(in_EDX + -4 + iVar5 * 4);
    puVar6[-6] = *(undefined4 *)(in_EDX + iVar1);
    puVar6[-5] = uVar4;
    puVar6[-4] = uVar3;
    puVar6[-3] = uVar2;
    uVar2 = *(undefined4 *)(in_EDX + -4 + iVar5 * 4);
    uVar3 = *(undefined4 *)(in_EDX + -4 + iVar5 * 4);
    uVar4 = *(undefined4 *)(in_EDX + -4 + iVar5 * 4);
    puVar6[-2] = *(undefined4 *)(in_EDX + -4 + iVar5 * 4);
    puVar6[-1] = uVar4;
    *puVar6 = uVar3;
    puVar6[1] = uVar2;
    puVar6 = puVar6 + 8;
  } while (iVar5 != 3);
  *param_1 = *(undefined4 *)(in_EDX + 0xc);
  return;
}


