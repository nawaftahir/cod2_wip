
undefined1 * FUN_0048e640(undefined4 param_1)

{
  char cVar1;
  int iVar2;
  undefined4 uVar3;
  undefined1 *puVar4;
  undefined4 *puVar5;
  
  iVar2 = FUN_0048b7e0();
  puVar5 = (undefined4 *)(&DAT_01148e30)[iVar2];
  if (puVar5 != (undefined4 *)0x0) {
    while (iVar2 = FUN_004965d0(param_1,*puVar5), iVar2 != 0) {
      puVar5 = (undefined4 *)puVar5[8];
      if (puVar5 == (undefined4 *)0x0) {
        return &DAT_0053d753;
      }
    }
    if (puVar5 != (undefined4 *)0x0) {
      cVar1 = *(char *)((int)puVar5 + 6);
      if (((cVar1 != '\a') && (cVar1 != '\x06')) && (DAT_0124a490 == '\0')) {
        uVar3 = FUN_004969e0("%s\n\t(dvar->type) = %i",
                             "(dvar->type == DVAR_TYPE_STRING || dvar->type == DVAR_TYPE_ENUM)",
                             cVar1,"\\trees\\cod2src\\src\\universal\\dvar.cpp",0x4c2,0,1);
        iVar2 = FUN_0047d980(uVar3);
        if (iVar2 == 0) {
          DebugBreak();
        }
        else if (iVar2 == 2) {
          DAT_0124a490 = '\x01';
        }
      }
      if (*(char *)((int)puVar5 + 6) != '\x06') {
        return (undefined1 *)puVar5[2];
      }
      puVar4 = (undefined1 *)FUN_0048bdc0(puVar5);
      return puVar4;
    }
  }
  return &DAT_0053d753;
}

