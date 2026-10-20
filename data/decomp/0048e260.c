
undefined4 FUN_0048e260(undefined4 param_1)

{
  char cVar1;
  int iVar2;
  undefined4 uVar3;
  undefined4 *puVar4;
  
  iVar2 = FUN_0048b7e0();
  puVar4 = (undefined4 *)(&DAT_01148e30)[iVar2];
  if (puVar4 != (undefined4 *)0x0) {
    while (iVar2 = FUN_004965d0(param_1,*puVar4), iVar2 != 0) {
      puVar4 = (undefined4 *)puVar4[8];
      if (puVar4 == (undefined4 *)0x0) {
        return 0;
      }
    }
    if (puVar4 != (undefined4 *)0x0) {
      cVar1 = *(char *)((int)puVar4 + 6);
      if ((((cVar1 != '\x05') && (cVar1 != '\x06')) &&
          ((cVar1 != '\a' || ((*(byte *)((int)puVar4 + 5) & 0x40) == 0)))) && (DAT_0124a495 == '\0')
         ) {
        uVar3 = FUN_004969e0("%s\n\t(dvar->type) = %i",
                             "(dvar->type == DVAR_TYPE_INT || dvar->type == DVAR_TYPE_ENUM || (dvar->type == DVAR_TYPE_STRING && (dvar->flags & (1 << 14))))"
                             ,cVar1,"\\trees\\cod2src\\src\\universal\\dvar.cpp",0x472,0,1);
        iVar2 = FUN_0047d980(uVar3);
        if (iVar2 == 0) {
          DebugBreak();
        }
        else if (iVar2 == 2) {
          DAT_0124a495 = '\x01';
        }
      }
      if ((*(char *)((int)puVar4 + 6) != '\x05') && (*(char *)((int)puVar4 + 6) != '\x06')) {
        uVar3 = FUN_0048c4d0();
        return uVar3;
      }
      return puVar4[2];
    }
  }
  return 0;
}

