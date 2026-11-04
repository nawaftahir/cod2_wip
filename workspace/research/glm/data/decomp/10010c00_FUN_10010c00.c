// 10010c00 size=168 FUN_10010c00

int FUN_10010c00(int param_1,byte param_2,int param_3)

{
  ushort uVar1;
  ushort uVar2;
  short sVar3;
  ushort *in_EAX;
  byte bVar4;
  int iVar5;
  ushort uVar6;
  
  uVar2 = *in_EAX;
  sVar3 = *(short *)(param_1 + 2 + (uVar2 & 0xfff) * 4);
  bVar4 = (byte)sVar3;
  *in_EAX = *in_EAX >> (bVar4 & 0x1f);
  uVar6 = (ushort)((**(uint **)(in_EAX + 2) >> ((byte)in_EAX[1] & 0x1f)) << (0x10 - bVar4 & 0x1f)) |
          *in_EAX;
  uVar1 = in_EAX[1] + sVar3;
  in_EAX[1] = uVar1 & 7;
  *in_EAX = uVar6;
  *(uint *)(in_EAX + 2) = (uint)(uVar1 >> 3) + (int)*(uint **)(in_EAX + 2);
  iVar5 = (int)*(short *)(param_1 + (uVar2 & 0xfff) * 4);
  if (iVar5 == -0x8000) {
    FUN_10010ba0();
    return ((1 << (param_2 & 0x1f)) - 1U & (uint)uVar6) - param_3;
  }
  return iVar5;
}


