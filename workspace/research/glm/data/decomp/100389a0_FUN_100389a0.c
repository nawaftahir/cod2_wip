// 100389a0 size=512 FUN_100389a0

void FUN_100389a0(void)

{
  int iVar1;
  int unaff_EBX;
  undefined4 *unaff_ESI;
  undefined1 *unaff_EDI;
  
  switch(unaff_EBX) {
  case 0:
    *unaff_ESI = DAT_101d1b0c;
    *unaff_EDI = 1;
    return;
  case 1:
    *unaff_ESI = DAT_101d1b08;
    *unaff_EDI = 1;
    return;
  case 2:
    *unaff_ESI = DAT_101d1b10;
    *unaff_EDI = 1;
    return;
  case 3:
    *unaff_ESI = DAT_101d1b14;
    *unaff_EDI = 0x32;
    return;
  case 4:
    if ((DAT_101d1b9c == 0) || (*(int *)(DAT_101d1b9c + 0x10c) == 0)) {
      FUN_10061cd0(1,"Sampler \'smodelLighting\' is only valid in a map.\n");
    }
    *unaff_ESI = *(undefined4 *)(DAT_101d1b9c + 0x10c);
    *unaff_EDI = 0x72;
    return;
  case 5:
  case 6:
    *unaff_ESI = (&DAT_101d1b08)[unaff_EBX];
    *unaff_EDI = 0x32;
    return;
  case 7:
    *unaff_ESI = DAT_101d1b18;
    *unaff_EDI = 0x32;
    return;
  case 8:
  case 9:
  case 10:
  case 0xb:
    if (DAT_1072d9c4 == 0x1f) {
      FUN_100138c0(0,
                   "Material \'%s\' tried to use a lightmap but doesn\'t have one set.\n\nThis is usually because a model skin uses a world material type.\nSometimes it is caused by a material switching after a map was\ncompiled to a surface type that uses a lightmap.\n"
                   ,*DAT_1072d9bc);
    }
    *unaff_ESI = *(undefined4 *)
                  (*(int *)(DAT_101d1b9c + 0x108) + (unaff_EBX + -8 + DAT_1072d9c4 * 4) * 4);
    *unaff_EDI = 0x32;
    FUN_100388f0();
    return;
  case 0xc:
    *unaff_ESI = DAT_101d4870;
    *unaff_EDI = 0x32;
    return;
  case 0xd:
    *unaff_ESI = DAT_1073055c;
    *unaff_EDI = 0x32;
    return;
  case 0xe:
    *unaff_ESI = (&DAT_101d4820)[DAT_10730554 * 5];
    *unaff_EDI = 0x32;
    return;
  case 0xf:
    *unaff_ESI = (&DAT_101d4820)[DAT_10730558 * 5];
    *unaff_EDI = 0x32;
    return;
  case 0x10:
    if ((DAT_101d1b9c == 0) || (*(int *)(DAT_101d1b9c + 0x20) == 0)) {
      FUN_100138c0(1,"Tried to use \'sampler.sky\' when it isn\'t valid\n");
    }
    *unaff_ESI = *(undefined4 *)(DAT_101d1b9c + 0x20);
    *unaff_EDI = *(undefined1 *)(DAT_101d1b9c + 0x24);
    return;
  case 0x11:
  case 0x12:
    iVar1 = (unaff_EBX + -0x11) * 0x44;
    *unaff_ESI = *(undefined4 *)(*(int *)(&DAT_107305a0 + iVar1) + 0xc);
    *unaff_EDI = *(undefined1 *)(*(int *)(&DAT_107305a0 + iVar1) + 0x10);
    return;
  case 0x13:
    break;
  case 0x14:
    if ((DAT_101d1b9c == 0) || (*(int *)(DAT_101d1b9c + 0x200) == 0)) {
      FUN_100138c0(1,"Tried to use \'sampler.outdoor\' when it isn\'t valid\n");
    }
    *unaff_ESI = *(undefined4 *)(DAT_101d1b9c + 0x200);
    *unaff_EDI = 0x32;
    return;
  case 0x15:
    *unaff_ESI = DAT_101d4898;
    *unaff_EDI = 0x31;
    return;
  case 0x16:
    *unaff_ESI = DAT_101d1ba0;
    *unaff_EDI = 0x32;
    return;
  case 0x17:
    *unaff_ESI = DAT_101d1ba4;
    *unaff_EDI = 0x32;
    return;
  default:
    *unaff_EDI = 0;
    *unaff_ESI = 0;
    return;
  }
  if ((*(char *)(DAT_101ce7c4 + 8) != '\0') &&
     ((2 < *DAT_1072de40 || ((DAT_1072de40[1] & 0x100U) != 0)))) {
    *unaff_ESI = DAT_101d485c;
    *unaff_EDI = 0x32;
    return;
  }
  *unaff_ESI = DAT_101d1b08;
  *unaff_EDI = 0x32;
  return;
}


