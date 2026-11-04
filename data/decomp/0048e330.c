
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

float10 FUN_0048e330(undefined4 param_1)

{
  char cVar1;
  int iVar2;
  undefined4 uVar3;
  undefined4 *puVar4;
  float10 fVar5;
  
  iVar2 = FUN_0048b7e0();
  puVar4 = (undefined4 *)(&DAT_01148e30)[iVar2];
  if (puVar4 != (undefined4 *)0x0) {
    while (iVar2 = FUN_004965d0(param_1,*puVar4), iVar2 != 0) {
      puVar4 = (undefined4 *)puVar4[8];
      if (puVar4 == (undefined4 *)0x0) {
        return (float10)_DAT_00556a70;
      }
    }
    if (puVar4 != (undefined4 *)0x0) {
      cVar1 = *(char *)((int)puVar4 + 6);
      if ((cVar1 != '\x01') &&
         (((cVar1 != '\a' || ((*(byte *)((int)puVar4 + 5) & 0x40) == 0)) && (DAT_0124a494 == '\0')))
         ) {
        uVar3 = FUN_004969e0("%s\n\t(dvar->type) = %i",
                             "(dvar->type == DVAR_TYPE_FLOAT || (dvar->type == DVAR_TYPE_STRING && (dvar->flags & (1 << 14))))"
                             ,cVar1,"\\trees\\cod2src\\src\\universal\\dvar.cpp",0x482,0,1);
        iVar2 = FUN_0047d980(uVar3);
        if (iVar2 == 0) {
          DebugBreak();
        }
        else if (iVar2 == 2) {
          DAT_0124a494 = '\x01';
        }
      }
      if (*(char *)((int)puVar4 + 6) != '\x01') {
        fVar5 = (float10)FUN_0048c530();
        return fVar5;
      }
      return (float10)(float)puVar4[2];
    }
  }
  return (float10)_DAT_00556a70;
}

