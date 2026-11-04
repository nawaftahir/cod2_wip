
void __thiscall FUN_004750c0(int param_1,CArchive *param_2)

{
  ulong uVar1;
  
  if ((~*(uint *)(param_2 + 0x18) & 1) != 0) {
    CArchive::WriteCount(param_2,*(ulong *)(param_1 + 8));
    FUN_00474fa0(param_2);
    return;
  }
  uVar1 = CArchive::ReadCount(param_2);
  FUN_00474d60(uVar1);
  FUN_00474fa0(param_2);
  return;
}

