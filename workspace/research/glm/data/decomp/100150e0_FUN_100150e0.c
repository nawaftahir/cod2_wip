// 100150e0 size=172 FUN_100150e0

uint * FUN_100150e0(void)

{
  char cVar1;
  undefined4 uVar2;
  int iVar3;
  uint *puVar4;
  char *pcVar5;
  uint uVar6;
  char *unaff_EDI;
  byte *local_4;
  
  uVar2 = FUN_10060c70("lights/%s");
  iVar3 = (*(code *)RI_StatMon_Warning)(uVar2,&local_4);
  if (-1 < iVar3) {
    if (iVar3 != 0) {
      puVar4 = (uint *)(*(code *)RI_Hunk_AllocInternal)(0x18);
      pcVar5 = unaff_EDI;
      do {
        cVar1 = *pcVar5;
        pcVar5 = pcVar5 + 1;
      } while (cVar1 != '\0');
      uVar6 = (*(code *)RI_Hunk_AllocInternal)(pcVar5 + (1 - (int)(unaff_EDI + 1)));
      puVar4[5] = uVar6;
      *puVar4 = (uint)*local_4;
      FUN_10015090();
      FUN_10015090();
      pcVar5 = (char *)puVar4[5];
      do {
        cVar1 = *unaff_EDI;
        unaff_EDI = unaff_EDI + 1;
        *pcVar5 = cVar1;
        pcVar5 = pcVar5 + 1;
      } while (cVar1 != '\0');
      FUN_10060ad0();
      (*(code *)RI_FS_ReadFile)(local_4);
      return puVar4;
    }
    (*(code *)RI_FS_ReadFile)(local_4);
  }
  return (uint *)0x0;
}


