// 10049930 size=220 FUN_10049930

void FUN_10049930(undefined4 param_1)

{
  int *in_EAX;
  undefined4 *puVar1;
  
  in_EAX[0xb] = 1;
  FUN_100468d0(1);
  if (*(char *)((int)in_EAX + 0xb9) == '\0') {
    if ((char)in_EAX[0x37] == '\0') {
      FUN_10044b20();
    }
    else {
      puVar1 = (undefined4 *)(**(code **)in_EAX[1])();
      in_EAX[0x59] = (int)puVar1;
      *puVar1 = FUN_100477e0;
      puVar1[0x13] = 0;
      puVar1[0x17] = 0;
      puVar1[0x14] = 0;
      puVar1[0x18] = 0;
      puVar1[0x15] = 0;
      puVar1[0x19] = 0;
      puVar1[0x16] = 0;
      puVar1[0x1a] = 0;
      puVar1[0x10] = 0;
    }
  }
  else {
    *(undefined4 *)(*in_EAX + 0x14) = 1;
    (**(code **)*in_EAX)();
  }
  FUN_10049d60(param_1);
  puVar1 = (undefined4 *)(**(code **)in_EAX[1])();
  in_EAX[0x55] = (int)puVar1;
  *puVar1 = FUN_10045ac0;
  puVar1[1] = FUN_10045b10;
  puVar1[2] = &LAB_10045bf0;
  puVar1[3] = FUN_10045ce0;
  puVar1[4] = &LAB_10045d00;
  puVar1[5] = &LAB_10045a40;
  puVar1[6] = &LAB_10045a80;
  puVar1[7] = 0;
  (**(code **)(in_EAX[1] + 0x18))();
  (**(code **)in_EAX[0x55])();
  return;
}


