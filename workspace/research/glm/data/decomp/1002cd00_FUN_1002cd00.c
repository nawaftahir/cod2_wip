// 1002cd00 size=117 FUN_1002cd00

void FUN_1002cd00(undefined4 *param_1,undefined4 param_2)

{
  int iVar1;
  int iVar2;
  undefined4 uVar3;
  int iVar4;
  undefined4 *unaff_EBX;
  undefined4 *puVar5;
  undefined4 *puVar6;
  
  iVar1 = param_1[3];
  iVar2 = param_1[4];
  puVar5 = param_1;
  puVar6 = unaff_EBX;
  for (iVar4 = 0x11; iVar4 != 0; iVar4 = iVar4 + -1) {
    *puVar6 = *puVar5;
    puVar5 = puVar5 + 1;
    puVar6 = puVar6 + 1;
  }
  uVar3 = (*(code *)RI_Hunk_AllocInternal)(iVar1 * iVar2 * 8);
  unaff_EBX[1] = uVar3;
  uVar3 = (*(code *)RI_Hunk_AllocInternal)(iVar1 * iVar2 * 4);
  unaff_EBX[2] = uVar3;
  FUN_1002cb40();
  FUN_10060c70("watersetup%i",param_2,*(undefined2 *)(param_1 + 3));
  uVar3 = FUN_10010b30();
  unaff_EBX[0x10] = uVar3;
  return;
}


