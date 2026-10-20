
undefined4 FUN_004ad4a0(void)

{
  int iVar1;
  int in_EAX;
  
  if ((((in_EAX != 0) && (iVar1 = *(int *)(in_EAX + 0x1c), iVar1 != 0)) &&
      (*(int *)(in_EAX + 0x20) != 0)) && (*(int *)(in_EAX + 0x24) != 0)) {
    *(undefined4 *)(in_EAX + 0x14) = 0;
    *(undefined4 *)(in_EAX + 8) = 0;
    *(undefined4 *)(in_EAX + 0x18) = 0;
    *(undefined4 *)(in_EAX + 0x2c) = 2;
    *(undefined4 *)(iVar1 + 0x10) = *(undefined4 *)(iVar1 + 8);
    *(undefined4 *)(iVar1 + 0x14) = 0;
    if (*(int *)(iVar1 + 0x18) < 0) {
      *(undefined4 *)(iVar1 + 0x18) = 0;
    }
    *(uint *)(iVar1 + 4) = (-(uint)(*(int *)(iVar1 + 0x18) != 0) & 0x47) + 0x2a;
    *(undefined4 *)(in_EAX + 0x30) = 1;
    *(undefined4 *)(iVar1 + 0x20) = 0;
    FUN_004b10e0();
    FUN_004adda0();
    return 0;
  }
  return 0xfffffffe;
}

