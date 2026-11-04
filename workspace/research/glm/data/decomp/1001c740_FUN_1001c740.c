// 1001c740 size=171 FUN_1001c740

uint FUN_1001c740(undefined4 param_1)

{
  char cVar1;
  int iVar2;
  uint uVar3;
  char *unaff_EBX;
  undefined4 local_44;
  undefined1 local_40 [64];
  
  FUN_10060c10("materials/%s");
  iVar2 = (*(code *)RI_FS_FreeFile)(local_40,&local_44,1);
  if (iVar2 < 0) {
    if (*unaff_EBX != '$') {
      FUN_10061c80("^1ERROR: Couldn\'t find material \'%s\'\n");
    }
    return 0;
  }
  if (iVar2 == 0) {
    (*(code *)RI_FS_FOpenFileByMode)(local_44);
    FUN_10061c80("^1ERROR: material \'%s\' has zero length\n");
    return 0;
  }
  uVar3 = (*(code *)RI_Hunk_AllocInternal)(iVar2);
  (*(code *)RI_FS_FCloseFile)(uVar3,iVar2,local_44);
  (*(code *)RI_FS_FOpenFileByMode)(local_44);
  cVar1 = FUN_1001c4e0(uVar3,param_1);
  return -(uint)(cVar1 != '\0') & uVar3;
}


