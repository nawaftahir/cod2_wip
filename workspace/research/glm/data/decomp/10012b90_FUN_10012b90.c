// 10012b90 size=133 FUN_10012b90

void FUN_10012b90(void)

{
  int iVar1;
  int iVar2;
  char *pcVar3;
  undefined4 uVar4;
  undefined4 *unaff_ESI;
  undefined4 uStack_4;
  
  pcVar3 = (char *)(*(code *)RI_Dvar_GetVariantString)(DAT_101ce688);
  _sscanf(pcVar3,"%ix%i",unaff_ESI + 5,unaff_ESI + 6);
  pcVar3 = (char *)(*(code *)RI_Dvar_GetVariantString)(DAT_101ce7fc);
  _sscanf(pcVar3,"%i Hz",&uStack_4);
  uVar4 = FUN_10012b00(unaff_ESI[6],uStack_4);
  iVar2 = DAT_101ce6cc;
  iVar1 = DAT_101ce66c;
  unaff_ESI[1] = uVar4;
  unaff_ESI[3] = *(undefined4 *)(iVar2 + 8);
  iVar2 = DAT_101ce6dc;
  unaff_ESI[4] = *(undefined4 *)(iVar1 + 8);
  *(undefined1 *)(unaff_ESI + 2) = 1;
  *unaff_ESI = 0;
  unaff_ESI[8] = *(undefined4 *)(iVar2 + 8);
  return;
}


