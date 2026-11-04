// 1005f0e0 size=213 FUN_1005f0e0

void FUN_1005f0e0(char *param_1)

{
  int iVar1;
  int iVar2;
  undefined *puVar3;
  
  if (DAT_101aac70 == 0xf) {
    FUN_10061c80("Already parsing:\n");
    iVar2 = 0;
    if (0 < DAT_101aac70) {
      puVar3 = &DAT_101a6acc;
      do {
        FUN_10061c80("%i. %s\n",iVar2,puVar3);
        iVar2 = iVar2 + 1;
        puVar3 = puVar3 + 0x45c;
      } while (iVar2 < DAT_101aac70);
    }
    FUN_10061cd0(0,&DAT_1019b980,param_1);
  }
  iVar2 = DAT_101aac70 + 1;
  iVar1 = iVar2 * 0x45c;
  DAT_101aac70 = iVar2;
  *(undefined4 *)(&DAT_101a6ab0 + iVar1) = 1;
  (&DAT_101a6ab5)[iVar1] = 1;
  (&DAT_101a6ab4)[iVar1] = 0;
  (&DAT_101a6ab6)[iVar1] = 0;
  (&DAT_101a6ab7)[iVar1] = 0;
  (&DAT_101a6ab8)[iVar1] = 0;
  (&PTR_DAT_101a6abc)[iVar2 * 0x117] = &DAT_1019166e;
  (&PTR_DAT_101a6ac0)[iVar2 * 0x117] = &DAT_1019166e;
  *(undefined4 *)(&DAT_101a6ac4 + iVar1) = 0;
  *(undefined4 *)(&DAT_101a6ac8 + iVar1) = 0;
  _strncpy(&DAT_101a6acc + iVar1,param_1,0x3f);
  (&DAT_101a6b0b)[iVar1] = 0;
  return;
}


