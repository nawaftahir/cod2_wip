// 10037ce0 size=1060 FUN_10037ce0

void FUN_10037ce0(uint param_1)

{
  undefined4 uVar1;
  char *pcVar2;
  uint unaff_EBX;
  uint uVar3;
  
  uVar1 = FUN_10060c70("---------- (%c)Blend         : ",(-((param_1 & 0x7ff) != 0) & 10U) + 0x20);
  if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
    _fprintf(DAT_10764584,"%s",uVar1);
    _fflush(DAT_10764584);
  }
  if ((unaff_EBX & 0x700) == 0) {
    if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
      _fprintf(DAT_10764584,"%s","Disabled\n");
      _fflush(DAT_10764584);
    }
  }
  else {
    FUN_10037b20();
    FUN_10037a60();
    FUN_10037a60();
  }
  uVar1 = FUN_10060c70("---------- (%c)SeparateAlpha : ",
                       (-((param_1 & 0x7ff0000) != 0) & 10U) + 0x20);
  if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
    _fprintf(DAT_10764584,"%s",uVar1);
    _fflush(DAT_10764584);
  }
  if ((unaff_EBX & 0x7000000) == 0) {
    if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
      _fprintf(DAT_10764584,"%s","Disabled\n");
      _fflush(DAT_10764584);
    }
  }
  else {
    FUN_10037b20();
    FUN_10037a60();
    FUN_10037a60();
  }
  FUN_10037c10("AlphaTest");
  uVar1 = FUN_10060c70("---------- (%c)Color Write   : ",
                       (-((param_1 & 0x18000000) != 0) & 10U) + 0x20);
  if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
    _fprintf(DAT_10764584,"%s",uVar1);
    _fflush(DAT_10764584);
  }
  uVar3 = unaff_EBX & 0x8000000;
  pcVar2 = "true";
  if (uVar3 == 0) {
    pcVar2 = "false";
  }
  uVar1 = FUN_10060c70(&DAT_10198460,pcVar2);
  if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
    _fprintf(DAT_10764584,"%s",uVar1);
    _fflush(DAT_10764584);
  }
  pcVar2 = "true";
  if (uVar3 == 0) {
    pcVar2 = "false";
  }
  uVar1 = FUN_10060c70(&DAT_10198460,pcVar2);
  if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
    _fprintf(DAT_10764584,"%s",uVar1);
    _fflush(DAT_10764584);
  }
  pcVar2 = "true";
  if (uVar3 == 0) {
    pcVar2 = "false";
  }
  uVar1 = FUN_10060c70(&DAT_10198460,pcVar2);
  if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
    _fprintf(DAT_10764584,"%s",uVar1);
    _fflush(DAT_10764584);
  }
  pcVar2 = "true";
  if ((unaff_EBX & 0x10000000) == 0) {
    pcVar2 = "false";
  }
  uVar1 = FUN_10060c70(&DAT_10194210,pcVar2);
  if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
    _fprintf(DAT_10764584,"%s",uVar1);
    _fflush(DAT_10764584);
  }
  FUN_10037ba0(&DAT_101983f0,"Enabled","Disabled");
  FUN_10037c10("Cull Face");
  return;
}


