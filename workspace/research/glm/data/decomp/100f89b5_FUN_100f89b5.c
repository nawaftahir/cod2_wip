// 100f89b5 size=675 FUN_100f89b5

float10 FUN_100f89b5(int param_1,uint param_2,int param_3,uint param_4)

{
  int iVar1;
  float10 fVar2;
  undefined4 uVar3;
  undefined8 uVar4;
  undefined8 uVar5;
  double dVar6;
  undefined8 local_20;
  int local_c;
  undefined4 local_8;
  
  local_8 = __ctrlfp();
  if (((param_2._2_2_ & 0x7ff0) == 0x7ff0) || ((param_4._2_2_ & 0x7ff0) == 0x7ff0)) {
    if ((((param_2._2_2_ & 0x7ff8) == 0x7ff0) && (((param_2 & 0x7ffff) != 0 || (param_1 != 0)))) ||
       (((param_4._2_2_ & 0x7ff8) == 0x7ff0 && (((param_4 & 0x7ffff) != 0 || (param_3 != 0)))))) {
      dVar6 = (double)CONCAT26(param_2._2_2_,CONCAT24((undefined2)param_2,param_1)) +
              (double)CONCAT26(param_4._2_2_,CONCAT24((undefined2)param_4,param_3));
      uVar5 = CONCAT26(param_4._2_2_,CONCAT24((undefined2)param_4,param_3));
      uVar4 = CONCAT26(param_2._2_2_,CONCAT24((undefined2)param_2,param_1));
      uVar3 = 8;
      goto LAB_100f8c1c;
    }
    if (((param_2._2_2_ & 0x7ff8) == 0x7ff8) || ((param_4._2_2_ & 0x7ff8) == 0x7ff8)) {
      fVar2 = (float10)__handle_qnan2();
      return fVar2;
    }
  }
  dVar6 = (double)CONCAT26(param_2._2_2_,CONCAT24((undefined2)param_2,param_1));
  if ((double)CONCAT26(param_4._2_2_,CONCAT24((undefined2)param_4,param_3)) == dVar6) {
    __ctrlfp();
    return (float10)(double)CONCAT26(param_2._2_2_,CONCAT24((undefined2)param_2,param_1));
  }
  if (dVar6 == 0.0) {
    if ((double)CONCAT26(param_4._2_2_,CONCAT24((undefined2)param_4,param_3)) <= dVar6) {
      local_20 = -4.94065645841247e-324;
    }
    else {
      local_20 = 4.94065645841247e-324;
    }
  }
  if (((0.0 < dVar6) &&
      ((double)CONCAT26(param_4._2_2_,CONCAT24((undefined2)param_4,param_3)) < dVar6)) ||
     ((dVar6 < 0.0 &&
      (dVar6 < (double)CONCAT26(param_4._2_2_,CONCAT24((undefined2)param_4,param_3)))))) {
    local_20 = (double)CONCAT44(param_2,param_1 + -1);
    if (param_1 == 0) {
      iVar1 = param_2 - 1;
      goto LAB_100f8b3e;
    }
  }
  else if ((((0.0 < dVar6) &&
            (dVar6 < (double)CONCAT26(param_4._2_2_,CONCAT24((undefined2)param_4,param_3)))) ||
           ((dVar6 < 0.0 &&
            ((double)CONCAT26(param_4._2_2_,CONCAT24((undefined2)param_4,param_3)) < dVar6)))) &&
          (local_20 = (double)CONCAT44(param_2,param_1 + 1), param_1 + 1 == 0)) {
    iVar1 = param_2 + 1;
LAB_100f8b3e:
    local_20 = (double)CONCAT44(iVar1,(int)local_20);
  }
  if ((((ulonglong)local_20 & 0x7ff0000000000000) == 0) &&
     ((((ulonglong)local_20 & 0xfffff00000000) != 0 || ((int)local_20 != 0)))) {
    fVar2 = (float10)__decomp(local_20,&local_c);
    fVar2 = (float10)__set_exp((double)fVar2,local_c + 0x600);
    dVar6 = (double)fVar2;
    uVar5 = CONCAT26(param_4._2_2_,CONCAT24((undefined2)param_4,param_3));
    uVar4 = CONCAT26(param_2._2_2_,CONCAT24((undefined2)param_2,param_1));
    uVar3 = 0x12;
  }
  else {
    if (((local_20._4_4_ != 0x7ff00000) || ((int)local_20 != 0)) &&
       ((local_20._4_4_ != -0x100000 || ((int)local_20 != 0)))) {
      __ctrlfp();
      return (float10)local_20;
    }
    fVar2 = (float10)__decomp(local_20,&local_c);
    fVar2 = (float10)__set_exp((double)fVar2,local_c + -0x600);
    dVar6 = (double)fVar2;
    uVar5 = CONCAT26(param_4._2_2_,CONCAT24((undefined2)param_4,param_3));
    uVar4 = CONCAT26(param_2._2_2_,CONCAT24((undefined2)param_2,param_1));
    uVar3 = 0x11;
  }
LAB_100f8c1c:
  fVar2 = (float10)__except2(uVar3,0x26,uVar4,uVar5,dVar6,local_8);
  return fVar2;
}


