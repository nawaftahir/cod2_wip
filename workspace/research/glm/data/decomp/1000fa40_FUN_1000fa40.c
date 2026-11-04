// 1000fa40 size=240 FUN_1000fa40

undefined4 FUN_1000fa40(void)

{
  char cVar1;
  int iVar2;
  int unaff_EBX;
  int local_44;
  undefined1 local_40 [64];
  
  iVar2 = FUN_10060c10("%s%s%s","images/",*(undefined4 *)(unaff_EBX + 0x20),&DAT_1019396c);
  if (iVar2 < 0) {
    FUN_10061c80("^1ERROR: filename \'%s\' too long\n",local_40);
    return 0;
  }
  iVar2 = (*(code *)RI_StatMon_Warning)(local_40,&local_44);
  if (iVar2 < 0) {
    FUN_10061c80("^1ERROR: image \'%s\' is missing\n",local_40);
    return 0;
  }
  if (iVar2 == 0) {
    FUN_10061c80("^1ERROR: image \'%s\' has 0 length\n",local_40);
    (*(code *)RI_FS_ReadFile)(local_44);
    return 0;
  }
  if ((*(byte *)(local_44 + 5) & 3) != 0) {
    *(undefined1 *)(unaff_EBX + 0xb) = 1;
  }
  cVar1 = FUN_1000f2a0();
  if (cVar1 == '\0') {
    (*(code *)RI_FS_ReadFile)(local_44);
    return 0;
  }
  FUN_1000f900();
  (*(code *)RI_FS_ReadFile)(local_44);
  return 1;
}


