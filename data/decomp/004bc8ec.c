
void __thiscall FUN_004bc8ec(int param_1)

{
  int *piVar1;
  uint uVar2;
  undefined4 *unaff_EBP;
  byte bStack00000008;
  byte bStack00000009;
  byte bStack0000000a;
  byte bStack0000000b;
  byte bStack0000000c;
  int *in_stack_00000018;
  
  piVar1 = in_stack_00000018;
  bStack00000009 = (byte)param_1;
  uVar2 = param_1 >> 0x1f;
  bStack0000000a = (byte)(param_1 + (uVar2 & 0xff) >> 8);
  bStack0000000b = (byte)(param_1 + (uVar2 & 0xffff) >> 0x10);
  bStack0000000c = (byte)(param_1 + (uVar2 & 0xffffff) >> 0x18);
  bStack00000008 = bStack0000000c ^ bStack0000000b ^ bStack0000000a ^ bStack00000009;
  FUN_004bc380(&stack0x00000008,5,in_stack_00000018);
  if (*piVar1 < 2) {
    FUN_004bc380(*unaff_EBP,unaff_EBP[1],piVar1);
  }
  return;
}

