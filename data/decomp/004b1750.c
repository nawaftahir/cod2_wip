
void __thiscall FUN_004b1750(int param_1,int param_2)

{
  short *psVar1;
  ushort uVar2;
  int in_EAX;
  int iVar3;
  int iVar4;
  uint uVar5;
  int iVar6;
  uint uVar7;
  uint uVar8;
  ushort *local_4;
  
  uVar2 = *(ushort *)(in_EAX + 2);
  uVar5 = 0xffffffff;
  iVar6 = 0;
  iVar3 = 7;
  iVar4 = 4;
  if (uVar2 == 0) {
    iVar3 = 0x8a;
    iVar4 = 3;
  }
  *(undefined2 *)(in_EAX + 6 + param_1 * 4) = 0xffff;
  if (-1 < param_1) {
    local_4 = (ushort *)(in_EAX + 6);
    param_1 = param_1 + 1;
    uVar7 = (uint)uVar2;
    do {
      uVar8 = (uint)*local_4;
      iVar6 = iVar6 + 1;
      if ((iVar3 <= iVar6) || (uVar7 != uVar8)) {
        if (iVar6 < iVar4) {
          psVar1 = (short *)(param_2 + 0xa74 + uVar7 * 4);
          *psVar1 = *psVar1 + (short)iVar6;
        }
        else if (uVar7 == 0) {
          if (iVar6 < 0xb) {
            *(short *)(param_2 + 0xab8) = *(short *)(param_2 + 0xab8) + 1;
          }
          else {
            *(short *)(param_2 + 0xabc) = *(short *)(param_2 + 0xabc) + 1;
          }
        }
        else {
          if (uVar7 != uVar5) {
            psVar1 = (short *)(param_2 + 0xa74 + uVar7 * 4);
            *psVar1 = *psVar1 + 1;
          }
          *(short *)(param_2 + 0xab4) = *(short *)(param_2 + 0xab4) + 1;
        }
        iVar6 = 0;
        uVar5 = uVar7;
        if (uVar8 == 0) {
          iVar3 = 0x8a;
          iVar4 = 3;
        }
        else if (uVar7 == uVar8) {
          iVar3 = 6;
          iVar4 = 3;
        }
        else {
          iVar3 = 7;
          iVar4 = 4;
        }
      }
      local_4 = local_4 + 2;
      param_1 = param_1 + -1;
      uVar7 = uVar8;
    } while (param_1 != 0);
  }
  return;
}

