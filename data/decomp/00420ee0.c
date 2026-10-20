
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __fastcall FUN_00420ee0(float *param_1)

{
  float *in_EAX;
  float *unaff_ESI;
  
  *in_EAX = (*unaff_ESI + *param_1) * _DAT_00556b30;
  in_EAX[1] = (unaff_ESI[1] + param_1[1]) * _DAT_00556b30;
  in_EAX[2] = (unaff_ESI[2] + param_1[2]) * _DAT_00556b30;
  in_EAX[3] = (unaff_ESI[3] + param_1[3]) * _DAT_00556b30;
  in_EAX[4] = (unaff_ESI[4] + param_1[4]) * _DAT_00556b30;
  in_EAX[5] = (unaff_ESI[5] + param_1[5]) * _DAT_00556b30;
  in_EAX[6] = (unaff_ESI[6] + param_1[6]) * _DAT_00556b30;
  *(char *)(in_EAX + 10) =
       (char)((int)((uint)*(byte *)(unaff_ESI + 10) + (uint)*(byte *)(param_1 + 10)) >> 1);
  *(char *)((int)in_EAX + 0x29) =
       (char)((int)((uint)*(byte *)((int)unaff_ESI + 0x29) + (uint)*(byte *)((int)param_1 + 0x29))
             >> 1);
  *(char *)((int)in_EAX + 0x2a) =
       (char)((int)((uint)*(byte *)((int)unaff_ESI + 0x2a) + (uint)*(byte *)((int)param_1 + 0x2a))
             >> 1);
  *(char *)((int)in_EAX + 0x2b) =
       (char)((int)((uint)*(byte *)((int)unaff_ESI + 0x2b) + (uint)*(byte *)((int)param_1 + 0x2b))
             >> 1);
  return;
}

