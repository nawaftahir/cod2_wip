
void FUN_00494830(undefined4 param_1)

{
  int iVar1;
  int iVar2;
  undefined *puVar3;
  
  if (DAT_00596d48 == 0xf) {
    FUN_00408f20("Already parsing:\n");
    iVar2 = 0;
    if (0 < DAT_00596d48) {
      puVar3 = &DAT_00592ba4;
      do {
        FUN_00408f20("%i. %s\n",iVar2,puVar3);
        iVar2 = iVar2 + 1;
        puVar3 = puVar3 + 0x45c;
      } while (iVar2 < DAT_00596d48);
    }
    FUN_0047ae50(0,"Com_BeginParseSession: session overflow trying to parse %s\n",param_1);
  }
  iVar2 = DAT_00596d48 + 1;
  iVar1 = iVar2 * 0x45c;
  DAT_00596d48 = iVar2;
  *(undefined4 *)(&DAT_00592b88 + iVar1) = 1;
  (&DAT_00592b8d)[iVar1] = 1;
  (&DAT_00592b8c)[iVar1] = 0;
  (&DAT_00592b8e)[iVar1] = 0;
  (&DAT_00592b8f)[iVar1] = 0;
  (&DAT_00592b90)[iVar1] = 0;
  *(undefined4 *)(&DAT_00592b9c + iVar1) = 0;
  *(undefined4 *)(&DAT_00592ba0 + iVar1) = 0;
  (&PTR_DAT_00592b94)[iVar2 * 0x117] = &DAT_0053d753;
  (&PTR_DAT_00592b98)[iVar2 * 0x117] = &DAT_0053d753;
  FUN_00496430();
  return;
}

