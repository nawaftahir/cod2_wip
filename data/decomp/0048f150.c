
void FUN_0048f150(undefined4 param_1,undefined4 param_2,uint param_3,undefined4 param_4,
                 undefined4 param_5,undefined4 param_6)

{
  ushort uVar1;
  undefined4 *in_EAX;
  undefined4 uVar2;
  int iVar3;
  
  uVar1 = *(ushort *)(in_EAX + 1);
  if (((uVar1 & 0x4000) != 0) && ((param_3 & 0x4000) == 0)) {
    if (((uVar1 & 0x7000) != 0x4000) && (DAT_0124a481 == '\0')) {
      uVar2 = FUN_004969e0("%s\n\t(dvar->flags) = %i",
                           "((dvar->flags & ((1 << 12) | (1 << 13) | (1 << 14))) == (1 << 14))",
                           uVar1,"\\trees\\cod2src\\src\\universal\\dvar.cpp",0x5ed,0,1);
      iVar3 = FUN_0047d980(uVar2);
      if (iVar3 == 0) {
        DebugBreak();
      }
      else if (iVar3 == 2) {
        DAT_0124a481 = '\x01';
      }
    }
    if ((((short)*(ushort *)(in_EAX + 1) < 0) && ((param_3 & 0x400) != 0)) &&
       ((*(ushort *)(in_EAX + 1) & 0xd0) == 0)) {
      param_4 = FUN_0048ca50(param_2,param_5,param_6);
    }
    FUN_0048ea40();
    _free((void *)*in_EAX);
    *(byte *)((int)in_EAX + 5) = *(byte *)((int)in_EAX + 5) & 0xbf;
    *in_EAX = param_1;
    FUN_0048efc0(param_2,param_3,param_4,param_5,param_6);
  }
  return;
}

