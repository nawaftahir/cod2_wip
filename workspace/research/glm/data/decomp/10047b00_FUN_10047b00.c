// 10047b00 size=51 FUN_10047b00

void FUN_10047b00(void)

{
  int iVar1;
  int in_EAX;
  int in_ECX;
  int in_EDX;
  
  if (*(char *)(in_ECX + 0xc) != '\0') {
    iVar1 = *(int *)(in_ECX + 0x5c + in_EAX * 4);
    *(int *)(iVar1 + in_EDX * 4) = *(int *)(iVar1 + in_EDX * 4) + 1;
    return;
  }
  FUN_100479a0(*(undefined4 *)(*(int *)(in_ECX + 0x4c + in_EAX * 4) + in_EDX * 4));
  return;
}


