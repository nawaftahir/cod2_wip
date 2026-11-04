// 10010ba0 size=87 FUN_10010ba0

void FUN_10010ba0(void)

{
  ushort uVar1;
  ushort *in_EAX;
  short unaff_DI;
  
  *in_EAX = *in_EAX >> ((byte)unaff_DI & 0x1f);
  uVar1 = in_EAX[1] + unaff_DI;
  *in_EAX = (ushort)((**(uint **)(in_EAX + 2) >> ((byte)in_EAX[1] & 0x1f)) <<
                    (0x10 - (byte)unaff_DI & 0x1f)) | *in_EAX;
  *(uint *)(in_EAX + 2) = (uint)(uVar1 >> 3) + (int)*(uint **)(in_EAX + 2);
  in_EAX[1] = uVar1 & 7;
  return;
}


