// 10014230 size=187 FUN_10014230

void FUN_10014230(int param_1)

{
  char cVar1;
  int in_EAX;
  int iVar2;
  undefined4 *puVar3;
  int unaff_EBX;
  int iVar4;
  undefined4 *puVar5;
  code *in_stack_00000018;
  
  while( true ) {
    iVar4 = in_EAX * 2 + 2;
    if (param_1 <= iVar4) break;
    iVar2 = iVar4 * 0x10 + unaff_EBX;
    cVar1 = (*in_stack_00000018)(iVar2,iVar2 + -0x10);
    if (cVar1 != '\0') {
      iVar4 = in_EAX * 2 + 1;
    }
    puVar3 = (undefined4 *)(iVar4 * 0x10 + unaff_EBX);
    puVar5 = (undefined4 *)(in_EAX * 0x10 + unaff_EBX);
    *puVar5 = *puVar3;
    puVar5[1] = puVar3[1];
    puVar5[2] = puVar3[2];
    puVar5[3] = puVar3[3];
    in_EAX = iVar4;
  }
  if (iVar4 == param_1) {
    puVar3 = (undefined4 *)(param_1 * 0x10 + -0x10 + unaff_EBX);
    puVar5 = (undefined4 *)(in_EAX * 0x10 + unaff_EBX);
    *puVar5 = *puVar3;
    puVar5[1] = puVar3[1];
    puVar5[2] = puVar3[2];
    puVar5[3] = puVar3[3];
  }
  FUN_10014390();
  return;
}


