
void FUN_004991a0(void)

{
  undefined4 *in_EAX;
  int iVar1;
  undefined4 *unaff_EBX;
  undefined4 *puVar2;
  undefined4 local_28 [9];
  
  puVar2 = local_28;
  for (iVar1 = 9; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar2 = *in_EAX;
    in_EAX = in_EAX + 1;
    puVar2 = puVar2 + 1;
  }
  FUN_004990b0(local_28);
  puVar2 = local_28;
  for (iVar1 = 9; iVar1 != 0; iVar1 = iVar1 + -1) {
    *unaff_EBX = *puVar2;
    puVar2 = puVar2 + 1;
    unaff_EBX = unaff_EBX + 1;
  }
  return;
}

