// 1009bee5 size=132 FUN_1009bee5

void FUN_1009bee5(int param_1)

{
  int iVar1;
  undefined8 uVar2;
  undefined8 uVar3;
  int *piVar4;
  int in_ECX;
  uint uVar5;
  uint uVar6;
  
  uVar3 = 0;
  uVar5 = 0;
  piVar4 = (int *)(in_ECX + 0x20);
  uVar6 = 5;
  uVar2 = 0;
  if ((param_1 != 0) && (*(int *)(param_1 + 4) == 3)) {
    piVar4 = (int *)(param_1 + 0x10);
    iVar1 = *piVar4;
    uVar2 = uVar3;
    if (iVar1 == 2) {
      uVar5 = *(uint *)(param_1 + 0x18);
      uVar6 = (uVar5 & 0xbfffffff | 0x20000000) >> 0x1d;
    }
    else {
      if (iVar1 == 3) {
        uVar6 = 4;
      }
      else {
        if (iVar1 != 4) {
          if (iVar1 == 5) {
            uVar6 = 9;
          }
          else if (iVar1 == 6) {
            uVar6 = 10;
          }
          else if (iVar1 == 7) {
            uVar6 = 0xb;
          }
          else {
            if (iVar1 != 8) goto LAB_1009bf56;
            uVar6 = 0xc;
          }
          uVar2 = *(undefined8 *)(param_1 + 0x18);
          goto LAB_1009bf56;
        }
        uVar6 = 8;
      }
      uVar5 = *(uint *)(param_1 + 0x18);
    }
  }
LAB_1009bf56:
  FUN_1009bdcd(uVar6,uVar5,uVar2,piVar4);
  return;
}


