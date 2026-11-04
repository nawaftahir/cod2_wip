// 1001c7f0 size=173 FUN_1001c7f0

void FUN_1001c7f0(char *param_1,char *param_2)

{
  char cVar1;
  int iVar2;
  char *pcVar3;
  char *pcVar4;
  int iVar5;
  undefined4 *unaff_EBX;
  undefined4 local_44;
  undefined1 local_40 [64];
  
  FUN_10060c10("materials/shaders/%s%s",param_2,param_1);
  iVar2 = (*(code *)RI_FS_FreeFile)(local_40,&local_44,1);
  pcVar3 = param_2;
  do {
    cVar1 = *pcVar3;
    pcVar3 = pcVar3 + 1;
  } while (cVar1 != '\0');
  pcVar4 = param_1;
  do {
    cVar1 = *pcVar4;
    pcVar4 = pcVar4 + 1;
  } while (cVar1 != '\0');
  pcVar3 = (char *)(*(code *)RI_Hunk_AllocAlignInternal)
                             (pcVar3 + (int)(pcVar4 + iVar2 + (-(int)(param_1 + 1) -
                                                              (int)(param_2 + 1)) + 2),1);
  *unaff_EBX = pcVar3;
  iVar5 = _sprintf(pcVar3,"%s%s",param_2,param_1);
  pcVar3 = pcVar3 + iVar5 + 1;
  unaff_EBX[1] = pcVar3;
  (*(code *)RI_FS_FCloseFile)(pcVar3,iVar2,local_44);
  (*(code *)RI_FS_FOpenFileByMode)(local_44);
  pcVar3[iVar2] = '\0';
  unaff_EBX[2] = iVar2;
  return;
}


