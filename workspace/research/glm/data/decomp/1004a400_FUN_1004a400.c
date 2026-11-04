// 1004a400 size=241 FUN_1004a400

undefined4 FUN_1004a400(void)

{
  int *piVar1;
  int *in_EAX;
  undefined4 *puVar2;
  int iVar3;
  undefined4 uVar4;
  
  if (in_EAX[5] == 0xca) {
    puVar2 = (undefined4 *)(**(code **)in_EAX[1])();
    in_EAX[0x62] = (int)puVar2;
    *puVar2 = FUN_1004fe50;
    puVar2[1] = &LAB_1004ffb0;
    *(undefined1 *)(puVar2 + 2) = 0;
    FUN_1004fc90();
    if ((char)in_EAX[0x12] != '\0') {
      in_EAX[5] = 0xcf;
      return 1;
    }
    in_EAX[5] = 0xcb;
  }
  if (in_EAX[5] == 0xcb) {
    if (*(char *)(in_EAX[0x66] + 0x10) != '\0') {
      while( true ) {
        if ((undefined4 *)in_EAX[2] != (undefined4 *)0x0) {
          (**(code **)in_EAX[2])();
        }
        iVar3 = (**(code **)in_EAX[0x66])();
        if (iVar3 == 0) {
          return 0;
        }
        if (iVar3 == 2) break;
        if ((in_EAX[2] != 0) && ((iVar3 == 3 || (iVar3 == 1)))) {
          piVar1 = (int *)(in_EAX[2] + 4);
          *piVar1 = *piVar1 + 1;
          iVar3 = in_EAX[2];
          if (*(int *)(iVar3 + 8) <= *(int *)(iVar3 + 4)) {
            *(int *)(iVar3 + 8) = *(int *)(iVar3 + 8) + in_EAX[0x49];
          }
        }
      }
    }
    in_EAX[0x23] = in_EAX[0x21];
    uVar4 = FUN_1004a500();
    return uVar4;
  }
  if (in_EAX[5] != 0xcc) {
    *(undefined4 *)(*in_EAX + 0x14) = 0x14;
    *(int *)(*in_EAX + 0x18) = in_EAX[5];
    (**(code **)*in_EAX)();
  }
  uVar4 = FUN_1004a500();
  return uVar4;
}


