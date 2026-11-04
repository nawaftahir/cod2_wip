
void __fastcall FUN_00499020(undefined4 *param_1)

{
  undefined4 *in_EAX;
  int iVar1;
  int iVar2;
  undefined4 *puVar3;
  int local_8;
  
  iVar2 = 0;
  do {
    local_8 = 3;
    puVar3 = in_EAX;
    do {
      if (((iVar2 < 0) || (2 < iVar2)) && (DAT_0124a610 == '\0')) {
        iVar1 = FUN_0047d980("(index >= 0) && (index < 3)",
                             "e:\\trees\\cod2src\\src\\universal\\splines\\math_matrix.h",0x6e,0,1);
        if (iVar1 == 0) {
          DebugBreak();
        }
        else if (iVar1 == 2) {
          DAT_0124a610 = '\x01';
        }
      }
      *param_1 = *puVar3;
      param_1 = param_1 + 1;
      puVar3 = puVar3 + 3;
      local_8 = local_8 + -1;
    } while (local_8 != 0);
    iVar2 = iVar2 + 1;
    in_EAX = in_EAX + 1;
  } while (iVar2 < 3);
  return;
}

