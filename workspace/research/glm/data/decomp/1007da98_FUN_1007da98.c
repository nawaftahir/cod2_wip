// 1007da98 size=76 FUN_1007da98

int FUN_1007da98(undefined4 param_1,int param_2)

{
  int iVar1;
  int *in_ECX;
  
  if ((in_ECX[5] != 0) &&
     (iVar1 = (*(code *)in_ECX[7])
                        (param_1,(uint)*(ushort *)((int)in_ECX + 10) + param_2,
                         *(int *)(*in_ECX + 8) + in_ECX[5] +
                         ((-(uint)((short)in_ECX[2] != 0) & 3) + 1) * param_2 * 4,in_ECX[8],
                         (short)in_ECX[3]), iVar1 < 0)) {
    return iVar1;
  }
  return 0;
}


