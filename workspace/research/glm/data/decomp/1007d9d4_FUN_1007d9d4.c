// 1007d9d4 size=163 FUN_1007d9d4

undefined4 FUN_1007d9d4(int *param_1)

{
  int iVar1;
  int *in_ECX;
  
  *param_1 = 0;
  param_1[1] = 0;
  param_1[2] = 0;
  if (in_ECX[1] == 0) {
    iVar1 = 0;
  }
  else {
    iVar1 = *(int *)(*in_ECX + 8) + in_ECX[1];
  }
  *param_1 = iVar1;
  param_1[1] = (uint)*(ushort *)(in_ECX + 2);
  param_1[2] = (uint)*(ushort *)((int)in_ECX + 10);
  param_1[3] = (uint)*(ushort *)(in_ECX + 3);
  param_1[4] = (uint)*(ushort *)in_ECX[6];
  param_1[5] = (uint)*(ushort *)(in_ECX[6] + 2);
  param_1[6] = (uint)*(ushort *)(in_ECX[6] + 4);
  param_1[7] = (uint)*(ushort *)(in_ECX[6] + 6);
  param_1[8] = (uint)*(ushort *)(in_ECX[6] + 8);
  param_1[9] = (uint)*(ushort *)(in_ECX[6] + 10);
  param_1[10] = param_1[8] * param_1[6] * param_1[7] * 4;
  if (in_ECX[5] == 0) {
    iVar1 = 0;
  }
  else {
    iVar1 = *(int *)(*in_ECX + 8) + in_ECX[5];
  }
  param_1[0xb] = iVar1;
  return 0;
}


