
void FUN_0040adf0(undefined4 param_1,undefined4 param_2,undefined4 param_3)

{
  undefined4 *unaff_ESI;
  undefined4 *unaff_EDI;
  undefined4 local_1c;
  undefined4 local_18;
  undefined4 local_14;
  undefined4 local_10;
  undefined4 local_c;
  undefined4 local_8;
  
  local_10 = *unaff_EDI;
  local_c = unaff_EDI[1];
  local_8 = unaff_EDI[2];
  local_1c = *unaff_ESI;
  local_18 = unaff_ESI[1];
  local_14 = unaff_ESI[2];
  FUN_0049b220(param_1,param_2,&local_10,&local_1c,param_3);
  *unaff_EDI = local_10;
  unaff_EDI[1] = local_c;
  unaff_EDI[2] = local_8;
  *unaff_ESI = local_1c;
  unaff_ESI[1] = local_18;
  unaff_ESI[2] = local_14;
  return;
}

