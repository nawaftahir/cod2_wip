
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void FUN_0046c540(void)

{
  char cVar1;
  char *pcVar2;
  undefined4 *puVar3;
  int iVar4;
  char *pcVar5;
  undefined4 *puVar6;
  char local_408 [4];
  undefined1 local_404 [1020];
  undefined4 local_8;
  
  local_8 = DAT_0058ea68;
  iVar4 = 0;
  do {
    cVar1 = (&DAT_010a4508)[iVar4];
    local_408[iVar4] = cVar1;
    iVar4 = iVar4 + 1;
  } while (cVar1 != '\0');
  pcVar5 = local_408;
  do {
    cVar1 = *pcVar5;
    pcVar5 = pcVar5 + 1;
  } while (cVar1 != '\0');
  pcVar5 = pcVar5 + (-1 - (int)(local_408 + 1));
  while ((0 < (int)pcVar5 && (local_408[(int)pcVar5] != '.'))) {
    pcVar2 = pcVar5 + -5;
    pcVar5 = pcVar5 + -1;
    if (local_404[(int)pcVar2] == '/') {
LAB_0046c5b9:
      puVar3 = (undefined4 *)&stack0xfffffbf7;
      do {
        puVar6 = puVar3;
        puVar3 = (undefined4 *)((int)puVar6 + 1);
      } while (*(char *)((int)puVar6 + 1) != '\0');
      *(undefined4 *)((int)puVar6 + 1) = DAT_0054f314;
      *(undefined1 *)((int)puVar6 + 5) = DAT_0054f318;
      FUN_004dad56(local_408);
      return;
    }
  }
  if (pcVar5 != (char *)0x0) {
    local_408[(int)pcVar5] = '\0';
  }
  goto LAB_0046c5b9;
}

