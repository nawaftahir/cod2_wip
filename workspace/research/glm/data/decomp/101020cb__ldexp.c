// 101020cb size=491 _ldexp

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* Library Function - Single Match
    _ldexp
   
   Library: Visual Studio 2003 Release */

double __cdecl _ldexp(double _X,int _Y)

{
  undefined4 uVar1;
  int iVar2;
  float10 fVar3;
  double dVar4;
  undefined4 uVar5;
  int local_8;
  
  uVar1 = __ctrlfp(0x133f,0xffff);
  if ((_X._6_2_ & 0x7ff0) == 0x7ff0) {
    iVar2 = __sptype(_X);
    if (0 < iVar2) {
      if (iVar2 < 3) goto LAB_10102176;
      if (iVar2 == 3) {
        fVar3 = (float10)__handle_qnan2();
        goto LAB_101022b2;
      }
    }
    dVar4 = _X + 1.0;
    uVar5 = 8;
  }
  else {
    if (_X == 0.0) {
LAB_10102176:
      __ctrlfp(uVar1,0xffff);
      fVar3 = (float10)_X;
      goto LAB_101022b2;
    }
    fVar3 = (float10)__decomp(_X,&local_8);
    dVar4 = (double)fVar3;
    local_8 = _Y + local_8;
    if (local_8 < 0xa01) {
      if (local_8 < 0x401) {
        if (local_8 < -0x9fd) {
          dVar4 = dVar4 * 0.0;
        }
        else {
          if (-0x3fe < local_8) {
            fVar3 = (float10)__set_exp(dVar4,local_8);
            __ctrlfp(uVar1,0xffff);
            fVar3 = (float10)(double)fVar3;
            goto LAB_101022b2;
          }
          fVar3 = (float10)__set_exp(dVar4,local_8 + 0x600);
          dVar4 = (double)fVar3;
        }
        uVar5 = 0x12;
        goto LAB_1010228d;
      }
      fVar3 = (float10)__set_exp(dVar4,local_8 + -0x600);
      dVar4 = (double)fVar3;
    }
    else {
      dVar4 = __copysign(_DAT_101a5100,dVar4);
    }
    uVar5 = 0x11;
  }
LAB_1010228d:
  fVar3 = (float10)__except2(uVar5,0x19,_X,(double)_Y,dVar4,uVar1);
LAB_101022b2:
  return (double)fVar3;
}


