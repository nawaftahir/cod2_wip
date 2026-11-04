// 1000d200 size=94 FUN_1000d200

int FUN_1000d200(void)

{
  char cVar1;
  int iVar2;
  char *unaff_ESI;
  
  iVar2 = FUN_1000d140();
  if (iVar2 != 0) {
    return iVar2;
  }
  if (*unaff_ESI == '$') {
    iVar2 = FUN_100108a0();
  }
  else {
    iVar2 = FUN_1000cc10();
    cVar1 = FUN_1000fa40();
    if (cVar1 == '\0') goto LAB_1000d227;
  }
  if (iVar2 != 0) {
    return iVar2;
  }
LAB_1000d227:
  FUN_100138c0(1,"failed to load image \'%s\'");
  return 0;
}


