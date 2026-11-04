// 100396d0 size=680 FUN_100396d0

void FUN_100396d0(int param_1)

{
  uint uVar1;
  uint *in_EAX;
  uint uVar2;
  undefined4 uVar3;
  uint uVar4;
  undefined4 *unaff_EDI;
  uint local_8;
  uint local_4;
  
  if (*(int *)(unaff_EDI[1] + 8 + param_1 * 4) == 0) {
    FUN_100138c0(0,"Vertex type %i doesn\'t have the information used by shader %s in material %s\n"
                 ,param_1,*(undefined4 *)unaff_EDI[2],*DAT_1072d9bc);
  }
  FUN_10039670(*unaff_EDI,&local_8);
  uVar4 = local_8;
  if (in_EAX != (uint *)0x0) {
    local_4 = local_4 & in_EAX[1] | in_EAX[3];
    uVar4 = local_8 & *in_EAX | in_EAX[2];
  }
  if (DAT_1072debd != '\0') {
    local_4 = local_4 & 0xffffffcf;
  }
  uVar1 = local_4;
  if (*(int *)(DAT_101ce7ec + 8) != 0) {
    if (DAT_10764584 != (FILE *)0x0) {
      _fprintf(DAT_10764584,"%s","---------- RB_SetupPass\n");
      _fflush(DAT_10764584);
    }
    uVar2 = (uint)*(byte *)((int)unaff_EDI[2] + 0xb);
    uVar3 = FUN_10060c70("---------- vertex shader: %s version %i.%i\n",*(undefined4 *)unaff_EDI[2],
                         uVar2 / 10,uVar2 % 10);
    if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
      _fprintf(DAT_10764584,"%s",uVar3);
      _fflush(DAT_10764584);
    }
    uVar2 = (uint)*(byte *)((int)unaff_EDI[3] + 0xb);
    uVar3 = FUN_10060c70("---------- pixel shader: %s version %i.%i\n",*(undefined4 *)unaff_EDI[3],
                         uVar2 / 10,uVar2 % 10);
    if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
      _fprintf(DAT_10764584,"%s",uVar3);
      _fflush(DAT_10764584);
    }
    uVar3 = FUN_10060c70("---------- state map: %s\n",*(undefined4 *)*unaff_EDI);
    if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
      _fprintf(DAT_10764584,"%s",uVar3);
      _fflush(DAT_10764584);
    }
    uVar3 = FUN_10060c70("---------- state bits: 0x%08x, 0x%08x --> 0x%08x, 0x%08x\n",
                         DAT_1072d9bc[0xb],DAT_1072d9bc[0xc],uVar4,local_4);
    if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
      _fprintf(DAT_10764584,"%s",uVar3);
      _fflush(DAT_10764584);
    }
  }
  if (uVar4 != DAT_10766680) {
    FUN_1003c430(uVar4);
    DAT_10766680 = uVar4;
  }
  if (uVar1 != DAT_10766684) {
    FUN_1003cc60(uVar1);
    DAT_10766684 = uVar1;
  }
  FUN_10034bb0();
  FUN_10038430();
  FUN_100384a0();
  FUN_10038510();
  FUN_100393b0();
  FUN_100394a0(unaff_EDI[6]);
  return;
}


