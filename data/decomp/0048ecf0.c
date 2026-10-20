
void FUN_0048ecf0(undefined4 *param_1)

{
  undefined4 *puVar1;
  int in_EAX;
  int iVar2;
  
  if ((in_EAX == 0) && (DAT_0124a486 == '\0')) {
    iVar2 = FUN_0047d980(&DAT_005536a4,"\\trees\\cod2src\\src\\universal\\dvar.cpp",0x562);
    if (iVar2 == 0) {
      DebugBreak();
    }
    else if (iVar2 == 2) {
      DAT_0124a486 = '\x01';
    }
  }
  switch(*(undefined1 *)(in_EAX + 6)) {
  case 2:
    puVar1 = *(undefined4 **)(in_EAX + 0x10);
    *puVar1 = *param_1;
    puVar1[1] = param_1[1];
    return;
  case 3:
    puVar1 = *(undefined4 **)(in_EAX + 0x10);
    *puVar1 = *param_1;
    puVar1[1] = param_1[1];
    puVar1[2] = param_1[2];
    return;
  case 4:
    puVar1 = *(undefined4 **)(in_EAX + 0x10);
    *puVar1 = *param_1;
    puVar1[1] = param_1[1];
    puVar1[2] = param_1[2];
    puVar1[3] = param_1[3];
    return;
  default:
    *(undefined4 **)(in_EAX + 0x10) = param_1;
    return;
  case 7:
    FUN_0048bb50();
    FUN_0048bce0();
    return;
  }
}

