// 100641d1 size=228 FUN_100641d1

undefined4 FUN_100641d1(void)

{
  char cVar1;
  char *pcVar2;
  char *pcVar3;
  int in_ECX;
  char *pcVar4;
  char *pcVar5;
  char local_108 [256];
  uint local_8;
  
  pcVar5 = (char *)**(undefined4 **)(in_ECX + 0x26c);
  FUN_10067789();
  if (*(int *)(in_ECX + 0x50) != 0) {
    for (; (pcVar5 < (char *)**(uint **)(in_ECX + 0x26c) && ((*pcVar5 == ' ' || (*pcVar5 == '\t'))))
        ; pcVar5 = pcVar5 + 1) {
    }
    local_8 = 0;
    pcVar4 = pcVar5 + 2;
    pcVar3 = pcVar5 + 1;
    do {
      pcVar2 = (char *)**(undefined4 **)(in_ECX + 0x26c);
      if (pcVar2 <= pcVar5) break;
      cVar1 = *pcVar5;
      if (cVar1 == '\\') {
        if ((pcVar3 < pcVar2) && (*pcVar3 == '\n')) {
          pcVar5 = pcVar5 + 2;
          pcVar3 = pcVar3 + 2;
          pcVar4 = pcVar4 + 2;
        }
        else {
          if ((pcVar2 <= pcVar4) || ((*pcVar3 != '\r' || (*pcVar4 != '\n')))) goto LAB_1006425b;
          pcVar5 = pcVar5 + 3;
          pcVar3 = pcVar3 + 3;
          pcVar4 = pcVar4 + 3;
        }
      }
      else {
LAB_1006425b:
        if (cVar1 != '\r') {
          local_108[local_8] = cVar1;
          local_8 = local_8 + 1;
        }
        pcVar5 = pcVar5 + 1;
        pcVar3 = pcVar3 + 1;
        pcVar4 = pcVar4 + 1;
      }
    } while (local_8 < 0xff);
    local_108[local_8] = '\0';
    FUN_10067c3e(in_ECX + 0x18,in_ECX + 0x278,0,"error: %s",local_108);
    *(undefined4 *)(in_ECX + 0x48) = 1;
    *(undefined4 *)(in_ECX + 0x44) = 1;
  }
  return 0;
}


