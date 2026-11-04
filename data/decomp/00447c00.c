
int __thiscall FUN_00447c00(int param_1,float param_2)

{
  float fVar1;
  float *in_EAX;
  undefined2 extraout_var;
  uint3 uVar2;
  int iVar3;
  double dVar4;
  
  iVar3 = 0;
  param_1 = param_1 - (int)in_EAX;
  do {
    dVar4 = _fabs((double)(*(float *)(param_1 + (int)in_EAX) - *in_EAX));
    fVar1 = (float)dVar4;
    uVar2 = (uint3)(CONCAT22(extraout_var,
                             (ushort)(fVar1 < param_2) << 8 |
                             (ushort)(NAN(fVar1) || NAN(param_2)) << 10 |
                             (ushort)(fVar1 == param_2) << 0xe) >> 8);
    if (fVar1 >= param_2 && (fVar1 == param_2) == 0) {
      return (uint)uVar2 << 8;
    }
    iVar3 = iVar3 + 1;
    in_EAX = in_EAX + 1;
  } while (iVar3 < 3);
  return CONCAT31(uVar2,1);
}

