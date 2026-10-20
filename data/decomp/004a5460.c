
undefined4 FUN_004a5460(int param_1,int param_2,int param_3,int param_4)

{
  int iVar1;
  
  if ((param_4 < 0) && (DAT_0124a651 == '\0')) {
    iVar1 = FUN_0047d980("lod >= 0","\\trees\\cod2src\\src\\xanim\\dobj.cpp",0x5e7,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a651 = '\x01';
    }
  }
  return *(undefined4 *)
          (**(int **)(*(int *)(param_1 + 0x1c + param_2 * 4) + (param_4 * 5 + 5) * 4) + param_3 * 4)
  ;
}

