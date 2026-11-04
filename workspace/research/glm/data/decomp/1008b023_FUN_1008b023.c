// 1008b023 size=146 FUN_1008b023

void FUN_1008b023(int param_1,char *param_2,size_t param_3)

{
  int *piVar1;
  char *pcVar2;
  int iVar3;
  int in_ECX;
  char *_Format;
  
  piVar1 = (int *)(param_1 + 4);
  if (*(int *)(param_1 + 0x38) != -1) {
    param_1 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(param_1 + 0x38) * 4);
  }
  pcVar2 = (char *)**(undefined4 **)(*(int *)(in_ECX + 0x10) + *piVar1 * 4);
  if ((*pcVar2 == '\0') || (pcVar2[1] != '\0')) {
    _Format = "%s_";
  }
  else {
    _Format = "%s";
  }
  iVar3 = __snprintf(param_2,param_3,_Format,pcVar2);
  if (*(int *)(param_1 + 0xc) == -1) {
    __snprintf(param_2 + iVar3,param_3 - iVar3,"?");
  }
  else {
    __snprintf(param_2 + iVar3,param_3 - iVar3,"%u",*(int *)(param_1 + 0xc));
  }
  param_2[param_3 - 1] = '\0';
  return;
}


