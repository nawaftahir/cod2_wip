// 10043bd0 size=132 FUN_10043bd0

void FUN_10043bd0(void)

{
  int iVar1;
  undefined4 *puVar2;
  int *unaff_EDI;
  
  puVar2 = (undefined4 *)(**(code **)unaff_EDI[1])();
  unaff_EDI[0x58] = (int)puVar2;
  *puVar2 = &LAB_10042e10;
  iVar1 = unaff_EDI[0x30];
  if (iVar1 == 0) {
    puVar2[2] = FUN_100534d0;
  }
  else {
    if (iVar1 != 1) {
      if (iVar1 == 2) {
        puVar2[1] = &LAB_100434e0;
        puVar2[7] = FUN_10052180;
      }
      else {
        *(undefined4 *)(*unaff_EDI + 0x14) = 0x30;
        (**(code **)*unaff_EDI)();
      }
      goto LAB_10043c39;
    }
    puVar2[2] = FUN_100532c0;
  }
  puVar2[1] = &LAB_10043110;
LAB_10043c39:
  puVar2[3] = 0;
  puVar2[8] = 0;
  puVar2[4] = 0;
  puVar2[9] = 0;
  puVar2[5] = 0;
  puVar2[10] = 0;
  puVar2[6] = 0;
  puVar2[0xb] = 0;
  return;
}


