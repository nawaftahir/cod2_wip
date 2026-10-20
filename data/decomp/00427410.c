
int FUN_00427410(void)

{
  int iVar1;
  int in_EAX;
  int iVar2;
  int iVar3;
  
  iVar1 = *(int *)(in_EAX + 0x3828);
  iVar2 = *(int *)(iVar1 + 0x38);
  DAT_012334c4 = DAT_012334c4 + 1;
  iVar3 = 6;
  if (iVar2 < 7) {
    iVar3 = iVar2;
  }
  if (DAT_012334c4 < iVar3) {
    if (-1 < DAT_012334c4) goto LAB_00427445;
  }
  else {
    DAT_012334c4 = 0;
LAB_00427445:
    if (DAT_012334c4 < iVar2) goto LAB_00427496;
  }
  if (DAT_0124a19e == '\0') {
    iVar2 = FUN_0047d980("g_nFaceCycle >= 0 && g_nFaceCycle < b->faceCount",".\\Pmesh.cpp",0x415,1,1
                        );
    if (iVar2 == 0) {
      DebugBreak();
    }
    else if (iVar2 == 2) {
      DAT_0124a19e = 1;
      return DAT_012334c4 * 0xa8 + *(int *)(iVar1 + 0x3c);
    }
  }
LAB_00427496:
  return DAT_012334c4 * 0xa8 + *(int *)(iVar1 + 0x3c);
}

