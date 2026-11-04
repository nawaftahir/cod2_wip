// 100468d0 size=172 FUN_100468d0

void FUN_100468d0(char param_1)

{
  int in_EAX;
  undefined4 *puVar1;
  
  puVar1 = (undefined4 *)(*(code *)**(undefined4 **)(in_EAX + 4))();
  *(undefined4 **)(in_EAX + 0x144) = puVar1;
  *puVar1 = FUN_10046690;
  puVar1[1] = FUN_10046820;
  puVar1[2] = &LAB_10046850;
  *(undefined1 *)((int)puVar1 + 0xd) = 0;
  FUN_10045e30();
  if (*(int *)(in_EAX + 0xb4) == 0) {
    *(undefined1 *)(in_EAX + 0xdc) = 0;
    *(undefined4 *)(in_EAX + 0xb0) = 1;
  }
  else {
    FUN_10046000();
  }
  if (*(char *)(in_EAX + 0xdc) != '\0') {
    *(undefined1 *)(in_EAX + 0xba) = 1;
  }
  if (param_1 == '\0') {
    puVar1[4] = 0;
  }
  else {
    puVar1[4] = (*(char *)(in_EAX + 0xba) == '\0') + 1;
  }
  puVar1[7] = 0;
  puVar1[5] = 0;
  if (*(char *)(in_EAX + 0xba) != '\0') {
    puVar1[6] = *(int *)(in_EAX + 0xb0) << 1;
    return;
  }
  puVar1[6] = *(undefined4 *)(in_EAX + 0xb0);
  return;
}


