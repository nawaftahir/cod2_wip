// 10067fa7 size=297 FUN_10067fa7

undefined4 FUN_10067fa7(void)

{
  char cVar1;
  char *pcVar2;
  char *pcVar3;
  uint *in_ECX;
  undefined4 local_8;
  
  local_8 = 0;
  if (*in_ECX < in_ECX[1]) {
    do {
      pcVar3 = (char *)*in_ECX;
      cVar1 = *pcVar3;
      if (cVar1 == '\n') {
        pcVar3 = pcVar3 + 1;
        in_ECX[7] = in_ECX[7] + 1;
        local_8 = 1;
LAB_100680bc:
        *in_ECX = (uint)pcVar3;
      }
      else {
        if ((cVar1 == ' ') || (('\b' < cVar1 && (cVar1 < '\x0e')))) {
          pcVar3 = pcVar3 + 1;
          goto LAB_100680bc;
        }
        if (cVar1 == '/') {
          if ((pcVar3 + 1 < (char *)in_ECX[1]) && (pcVar3[1] == '/')) goto LAB_10068005;
          pcVar2 = (char *)in_ECX[1];
          if ((pcVar2 <= pcVar3 + 1) || (pcVar3[1] != '*')) goto LAB_10068079;
          *in_ECX = (uint)(pcVar3 + 2);
          if (pcVar3 + 2 < pcVar2) {
            do {
              pcVar3 = (char *)*in_ECX;
              if (((*pcVar3 == '*') && (pcVar3 + 1 < pcVar2)) && (pcVar3[1] == '/')) break;
              if (*pcVar3 == '\n') {
                in_ECX[7] = in_ECX[7] + 1;
              }
              *in_ECX = (uint)(pcVar3 + 1);
            } while (pcVar3 + 1 < (char *)in_ECX[1]);
          }
          if ((char *)*in_ECX < pcVar2) {
            pcVar3 = (char *)*in_ECX + 2;
            goto LAB_100680bc;
          }
          FUN_10067c3e(in_ECX[0xc],in_ECX + 2,0x3e9,"comment continues past end of file");
        }
        else {
LAB_10068079:
          if (((in_ECX[10] & 2) == 0) || (cVar1 != ';')) {
            if (cVar1 != '\\') {
              return local_8;
            }
            if ((pcVar3 + 1 < (char *)in_ECX[1]) && (pcVar3[1] == '\n')) {
              pcVar3 = pcVar3 + 2;
            }
            else {
              if ((char *)in_ECX[1] <= pcVar3 + 2) {
                return local_8;
              }
              if (pcVar3[1] != '\r') {
                return local_8;
              }
              if (pcVar3[2] != '\n') {
                return local_8;
              }
              pcVar3 = pcVar3 + 3;
            }
            in_ECX[7] = in_ECX[7] + 1;
            goto LAB_100680bc;
          }
LAB_10068005:
          FUN_10067789();
        }
      }
    } while (*in_ECX < in_ECX[1]);
  }
  return local_8;
}


