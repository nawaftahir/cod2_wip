// 100062a0 size=95 FUN_100062a0

void FUN_100062a0(void)

{
  undefined4 *puVar1;
  undefined4 *puVar2;
  int in_EAX;
  int in_EDX;
  
  puVar2 = DAT_101ce5b0;
  if (DAT_101ce5b0 != (undefined4 *)0x0) {
    puVar1 = (undefined4 *)(in_EDX + in_EAX * 0x14);
    *puVar1 = *DAT_101ce5b0;
    puVar1[1] = puVar2[1];
    puVar1[2] = puVar2[2];
    puVar1[3] = puVar2[3];
    puVar1[4] = puVar2[4];
    in_EAX = in_EAX + 1;
  }
  puVar2 = DAT_101ce5b4;
  if (DAT_101ce5b4 != (undefined4 *)0x0) {
    puVar1 = (undefined4 *)(in_EDX + in_EAX * 0x14);
    *puVar1 = *DAT_101ce5b4;
    puVar1[1] = puVar2[1];
    puVar1[2] = puVar2[2];
    puVar1[3] = puVar2[3];
    puVar1[4] = puVar2[4];
  }
  return;
}


