
void __fastcall
FUN_00426420(undefined4 param_1,undefined4 *param_2,undefined4 *param_3,undefined4 param_4,
            undefined4 param_5,undefined4 *param_6)

{
  undefined4 *in_EAX;
  int iVar1;
  undefined4 *unaff_EBX;
  undefined4 *puVar2;
  
  puVar2 = in_EAX + 9;
  for (iVar1 = 0xe; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar2 = *param_3;
    param_3 = param_3 + 1;
    puVar2 = puVar2 + 1;
  }
  in_EAX[0x1e] = param_4;
  in_EAX[0x1f] = param_5;
  *in_EAX = *param_6;
  in_EAX[1] = param_6[1];
  in_EAX[2] = param_6[2];
  in_EAX[3] = *unaff_EBX;
  in_EAX[4] = unaff_EBX[1];
  in_EAX[5] = unaff_EBX[2];
  in_EAX[6] = *param_2;
  in_EAX[7] = param_2[1];
  in_EAX[8] = param_2[2];
  return;
}

