// 10031cc0 size=91 FUN_10031cc0

void FUN_10031cc0(int *param_1)

{
  int iVar1;
  
  iVar1 = *param_1;
  if (DAT_1072debd != '\0') {
    FUN_10031470((int)*(short *)(iVar1 + 4),iVar1 + 8);
    *param_1 = (uint)*(ushort *)(*param_1 + 2) + *param_1;
    return;
  }
  FUN_10031780((int)*(short *)(iVar1 + 4),(int)*(short *)(iVar1 + 6),iVar1 + 8,1);
  *param_1 = (uint)*(ushort *)(*param_1 + 2) + *param_1;
  return;
}


