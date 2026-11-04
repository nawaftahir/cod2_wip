// 100080d0 size=130 FUN_100080d0

void FUN_100080d0(undefined4 param_1,undefined4 param_2)

{
  char cVar1;
  int unaff_EDI;
  
  if ((*(int *)(DAT_101d7e98 + unaff_EDI * 4) != DAT_10678500) &&
     ((*(char *)(DAT_101ce800 + 8) == '\0' || (cVar1 = FUN_10006300(param_2), cVar1 == '\0')))) {
    *(int *)(DAT_101d7e98 + unaff_EDI * 4) = DAT_10678500;
    FUN_10024380(*(undefined4 *)(*(int *)(DAT_101d1b9c + 0x14) + 8 + unaff_EDI * 0xc));
  }
  return;
}


