
void FUN_00408290(FILE *param_1,void *param_2)

{
  undefined4 uVar1;
  int iVar2;
  size_t sVar3;
  size_t unaff_ESI;
  char *pcVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  undefined4 uVar7;
  
  if (((int)unaff_ESI < 0) && (DAT_0124a0ac == '\0')) {
    uVar7 = 1;
    uVar6 = 0;
    uVar5 = 0xb6;
    pcVar4 = "\\trees\\cod2src\\libs\\cmdlib\\cmdlib.cpp";
    uVar1 = FUN_004969e0("%s\n\t(count) = %i","(count >= 0)");
    iVar2 = FUN_0047d980(uVar1,pcVar4,uVar5,uVar6,uVar7);
    if (iVar2 == 0) {
      DebugBreak();
    }
    else if (iVar2 == 2) {
      DAT_0124a0ac = '\x01';
    }
  }
  sVar3 = _fwrite(param_2,1,unaff_ESI,param_1);
  if (sVar3 != unaff_ESI) {
    FUN_00408020("File write failure - wrote %i of %i bytes",sVar3);
  }
  return;
}

