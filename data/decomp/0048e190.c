
undefined1 FUN_0048e190(undefined4 param_1)

{
  char cVar1;
  undefined1 uVar2;
  int iVar3;
  undefined4 uVar4;
  undefined4 *puVar5;
  
  iVar3 = FUN_0048b7e0();
  puVar5 = (undefined4 *)(&DAT_01148e30)[iVar3];
  if (puVar5 != (undefined4 *)0x0) {
    while (iVar3 = FUN_004965d0(param_1,*puVar5), iVar3 != 0) {
      puVar5 = (undefined4 *)puVar5[8];
      if (puVar5 == (undefined4 *)0x0) {
        return 0;
      }
    }
    if (puVar5 != (undefined4 *)0x0) {
      cVar1 = *(char *)((int)puVar5 + 6);
      if ((cVar1 != '\0') &&
         (((cVar1 != '\a' || ((*(byte *)((int)puVar5 + 5) & 0x40) == 0)) && (DAT_0124a496 == '\0')))
         ) {
        uVar4 = FUN_004969e0("%s\n\t(dvar->type) = %i",
                             "(dvar->type == DVAR_TYPE_BOOL || (dvar->type == DVAR_TYPE_STRING && (dvar->flags & (1 << 14))))"
                             ,cVar1,"\\trees\\cod2src\\src\\universal\\dvar.cpp",0x462,0,1);
        iVar3 = FUN_0047d980(uVar4);
        if (iVar3 == 0) {
          DebugBreak();
        }
        else if (iVar3 == 2) {
          DAT_0124a496 = '\x01';
        }
      }
      if (*(char *)((int)puVar5 + 6) != '\0') {
        uVar2 = FUN_0048c470();
        return uVar2;
      }
      return *(undefined1 *)(puVar5 + 2);
    }
  }
  return 0;
}

