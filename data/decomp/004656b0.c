
void __fastcall FUN_004656b0(int param_1)

{
  short *psVar1;
  int iVar2;
  char *in_EAX;
  int iVar3;
  
  iVar3 = __stricmp(in_EAX,"classname");
  if ((((iVar3 == 0) && (*(int *)(param_1 + 0x50) != 0)) &&
      (*(int *)(*(int *)(param_1 + 0x50) + 8) != 0)) &&
     (iVar3 = FUN_00464770(0), *(int *)(iVar3 + 8) != 0)) {
    *(int *)(param_1 + 0x50) = iVar3;
    FUN_00467510(param_1);
    iVar2 = *(int *)(param_1 + 0xc);
    FUN_00457dd0(iVar2,iVar3);
    FUN_0045a220(1);
    if ((DAT_011298b0 == 1) || (DAT_011298b0 == 2)) {
      FUN_00475350();
    }
    FUN_0047a3c0();
    psVar1 = (short *)(iVar2 + 0x42);
    *psVar1 = *psVar1 + 1;
  }
  return;
}

