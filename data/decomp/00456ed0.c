
void FUN_00456ed0(float param_1)

{
  int iVar1;
  int iVar2;
  int *unaff_ESI;
  
  iVar2 = FUN_00440840();
  *unaff_ESI = iVar2;
  iVar1 = *(int *)(iVar2 + 0x14);
  unaff_ESI[2] = (int)((float)*(int *)(iVar2 + 0x18) * param_1);
  unaff_ESI[1] = (int)((float)iVar1 * param_1);
  unaff_ESI[3] = 0;
  unaff_ESI[4] = 0;
  unaff_ESI[5] = 0;
  unaff_ESI[6] = 0;
  return;
}

