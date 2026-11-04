// 1004db80 size=205 FUN_1004db80

void FUN_1004db80(char param_1)

{
  int *in_EAX;
  undefined4 *puVar1;
  undefined4 uVar2;
  int iVar3;
  
  puVar1 = (undefined4 *)(**(code **)in_EAX[1])();
  in_EAX[99] = (int)puVar1;
  *puVar1 = &LAB_1004d920;
  if (param_1 != '\0') {
    *(undefined4 *)(*in_EAX + 0x14) = 4;
    (**(code **)*in_EAX)();
  }
  if (*(char *)(in_EAX[0x6a] + 8) != '\0') {
    if (in_EAX[0x48] < 2) {
      *(undefined4 *)(*in_EAX + 0x14) = 0x2f;
      (**(code **)*in_EAX)();
    }
    FUN_1004d5a0();
  }
  iVar3 = 0;
  if (0 < in_EAX[0xb]) {
    puVar1 = puVar1 + 2;
    do {
      uVar2 = (**(code **)(in_EAX[1] + 8))();
      *puVar1 = uVar2;
      iVar3 = iVar3 + 1;
      puVar1 = puVar1 + 1;
    } while (iVar3 < in_EAX[0xb]);
  }
  return;
}


