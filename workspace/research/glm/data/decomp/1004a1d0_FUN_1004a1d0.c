// 1004a1d0 size=149 FUN_1004a1d0

int FUN_1004a1d0(void)

{
  int *in_EAX;
  int iVar1;
  
  iVar1 = 0;
  switch(in_EAX[5]) {
  case 200:
    (**(code **)(in_EAX[0x66] + 4))();
    (**(code **)(in_EAX[8] + 8))();
    in_EAX[5] = 0xc9;
  case 0xc9:
    iVar1 = (**(code **)in_EAX[0x66])();
    if (iVar1 == 1) {
      FUN_10049fa0();
      in_EAX[5] = 0xca;
      return 1;
    }
    break;
  case 0xca:
    return 1;
  case 0xcb:
  case 0xcc:
  case 0xcd:
  case 0xce:
  case 0xcf:
  case 0xd0:
  case 0xd2:
    iVar1 = (**(code **)in_EAX[0x66])();
    return iVar1;
  default:
    *(undefined4 *)(*in_EAX + 0x14) = 0x14;
    *(int *)(*in_EAX + 0x18) = in_EAX[5];
    (**(code **)*in_EAX)();
  }
  return iVar1;
}


