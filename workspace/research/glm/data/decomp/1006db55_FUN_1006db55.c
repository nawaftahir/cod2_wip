// 1006db55 size=218 FUN_1006db55

undefined4 FUN_1006db55(void)

{
  int iVar1;
  int *in_ECX;
  undefined8 *puVar2;
  undefined8 *puVar3;
  undefined1 local_18 [4];
  uint local_14;
  char *local_c;
  undefined8 *local_8;
  
  puVar3 = *(undefined8 **)(*in_ECX + 0x3c);
  do {
    if (puVar3 == (undefined8 *)0x0) {
      return 0;
    }
    local_c = *(char **)((int)puVar3 + 4);
    puVar2 = (undefined8 *)0x0;
    local_8 = (undefined8 *)0x0;
    do {
      iVar1 = __stricmp(local_c,*(char **)((int)puVar3 + 4));
      if (iVar1 != 0) break;
      iVar1 = FUN_10063776(*(undefined4 *)puVar3,0,local_18);
      if (-1 < iVar1) {
        if (in_ECX[4] == local_14) {
          if (puVar2 == (undefined8 *)0x0) {
            puVar2 = puVar3;
          }
        }
        else if (((in_ECX[4] & 0xffff0000U) == local_14) && (local_8 == (undefined8 *)0x0)) {
          local_8 = puVar3;
        }
      }
      puVar3 = *(undefined8 **)(puVar3 + 5);
    } while (puVar3 != (undefined8 *)0x0);
    if ((puVar2 != (undefined8 *)0x0) || (puVar2 = local_8, local_8 != (undefined8 *)0x0)) {
      local_c = (char *)FUN_100860e0(*(undefined4 *)((int)puVar2 + 4),0xb51,1,4);
      if (local_c == (char *)0xffffffff) {
        return 0x8007000e;
      }
      local_8 = (undefined8 *)0x0;
      do {
        puVar2 = puVar2 + 1;
        iVar1 = FUN_10086139(local_c,0,local_8,*puVar2);
        if (iVar1 == -1) {
          return 0x8007000e;
        }
        local_8 = (undefined8 *)((int)local_8 + 1);
      } while (local_8 < 4);
    }
  } while( true );
}


