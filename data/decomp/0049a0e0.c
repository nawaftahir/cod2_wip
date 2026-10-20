
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 FUN_0049a0e0(undefined4 param_1,undefined4 param_2)

{
  char cVar1;
  int in_EAX;
  undefined4 *unaff_ESI;
  float *unaff_EDI;
  float10 fVar2;
  float local_20;
  float local_1c;
  float local_18;
  undefined4 local_14;
  undefined4 local_10;
  undefined4 local_c;
  float local_8;
  
  if ((-1 < in_EAX) && (in_EAX < 0x40)) {
    local_14 = *unaff_ESI;
    local_10 = unaff_ESI[1];
    local_c = unaff_ESI[2];
    cVar1 = FUN_0049b220(&DAT_01248698 + in_EAX * 0x68,param_1,&local_14,&local_20,param_2);
    if (cVar1 != '\0') {
      *unaff_ESI = local_14;
      unaff_ESI[1] = local_10;
      unaff_ESI[2] = local_c;
      fVar2 = (float10)FUN_004d8070((double)local_1c,(double)local_20);
      local_8 = (float)fVar2;
      unaff_EDI[1] = (local_8 * _DAT_00556a90) / _DAT_00556b74;
      fVar2 = (float10)FUN_004d8dd4((double)local_18);
      *unaff_EDI = ((float)fVar2 * _DAT_00556a90) / _DAT_00556b74;
      return 1;
    }
  }
  return 0;
}

