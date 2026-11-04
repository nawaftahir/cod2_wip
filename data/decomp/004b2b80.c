
int __fastcall FUN_004b2b80(undefined4 param_1,undefined4 param_2)

{
  int iVar1;
  int iVar2;
  undefined4 *unaff_ESI;
  undefined1 local_38 [12];
  undefined4 local_2c;
  undefined4 local_28;
  undefined4 local_24;
  undefined4 local_18;
  undefined4 local_14;
  
  local_28 = *unaff_ESI;
  local_18 = 0;
  local_14 = 0;
  local_2c = param_2;
  iVar1 = FUN_004b01d0(local_38,0xf,"1.1.4",0x38);
  if (iVar1 == 0) {
    iVar2 = FUN_004b02e0(local_38,4);
    if (iVar2 == 1) {
      *unaff_ESI = local_24;
      iVar1 = FUN_004b0180(local_38);
    }
    else {
      FUN_004b0180(local_38);
      iVar1 = -5;
      if (iVar2 != 0) {
        return iVar2;
      }
    }
  }
  return iVar1;
}

