// 10065377 size=167 FUN_10065377

undefined4 FUN_10065377(char *param_1)

{
  int in_ECX;
  int iVar1;
  char *pcVar2;
  char *pcVar3;
  bool bVar4;
  int local_8;
  
  iVar1 = 9;
  bVar4 = true;
  pcVar2 = "__LINE__";
  pcVar3 = param_1;
  do {
    if (iVar1 == 0) break;
    iVar1 = iVar1 + -1;
    bVar4 = *pcVar2 == *pcVar3;
    pcVar2 = pcVar2 + 1;
    pcVar3 = pcVar3 + 1;
  } while (bVar4);
  if (bVar4) {
    return *(undefined4 *)(in_ECX + 0x28c);
  }
  local_8 = in_ECX;
  iVar1 = FUN_10064fd0(param_1,&param_1,&local_8);
  if (iVar1 != 0) {
    if (param_1 != (char *)0x0) {
      FUN_10067c3e(in_ECX + 0x18,in_ECX + 0x278,0x5ed,
                   "functional defines in preprocessor expressions not yet implemented");
      return 1;
    }
    if ((((local_8 != 0) && (*(int *)(local_8 + 0xc) == 0)) && (1 < *(int *)(local_8 + 0x10))) &&
       (*(int *)(local_8 + 0x10) < 5)) {
      return *(undefined4 *)(local_8 + 0x18);
    }
    FUN_10067c3e(in_ECX + 0x18,in_ECX + 0x278,0x5ee,
                 "invalid or unsupported integer constant expression");
  }
  return 0;
}


