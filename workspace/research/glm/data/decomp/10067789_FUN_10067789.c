// 10067789 size=91 FUN_10067789

undefined4 FUN_10067789(void)

{
  char *pcVar1;
  char *pcVar2;
  undefined4 *in_ECX;
  
  pcVar1 = (char *)in_ECX[1];
  if ((char *)*in_ECX < pcVar1) {
    do {
      pcVar2 = (char *)*in_ECX;
      if (*pcVar2 == '\n') {
        return 1;
      }
      if (*pcVar2 == '\\') {
        if ((pcVar2 + 1 < pcVar1) && (pcVar2[1] == '\n')) {
          pcVar2 = pcVar2 + 2;
        }
        else {
          if ((pcVar1 <= pcVar2 + 2) || ((pcVar2[1] != '\r' || (pcVar2[2] != '\n'))))
          goto LAB_100677d2;
          pcVar2 = pcVar2 + 3;
        }
        in_ECX[7] = in_ECX[7] + 1;
      }
      else {
LAB_100677d2:
        pcVar2 = pcVar2 + 1;
      }
      *in_ECX = pcVar2;
    } while (pcVar2 < (char *)in_ECX[1]);
  }
  return 0;
}


