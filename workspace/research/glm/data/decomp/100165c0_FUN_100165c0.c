// 100165c0 size=372 FUN_100165c0

undefined4 FUN_100165c0(byte *param_1,int param_2,int param_3)

{
  byte *pbVar1;
  byte bVar2;
  byte bVar3;
  int iVar4;
  ushort *puVar5;
  int iVar6;
  undefined4 local_808;
  ushort *local_804;
  ushort local_800 [2];
  byte local_7fc [2044];
  
  iVar6 = 0;
  local_808 = 0;
  if (param_2 != 0) {
    local_804 = (ushort *)&local_808;
    do {
      pbVar1 = (byte *)(param_3 + (uint)*param_1 * 3);
      if (*pbVar1 == 0xff) {
        return 0;
      }
      bVar2 = param_1[1];
      iVar4 = iVar6;
      for (puVar5 = local_804; (0 < iVar4 && ((ushort)*pbVar1 < *puVar5)); puVar5 = puVar5 + -4) {
        *(undefined4 *)(puVar5 + 4) = *(undefined4 *)puVar5;
        *(undefined4 *)(puVar5 + 6) = *(undefined4 *)(puVar5 + 2);
        iVar4 = iVar4 + -1;
      }
      local_800[iVar4 * 4] = (ushort)*pbVar1;
      *(ushort *)(local_7fc + iVar4 * 8 + -2) = (ushort)pbVar1[1];
      bVar3 = (&DAT_1018eb1c)[(uint)bVar2 * 2];
      local_7fc[iVar4 * 8] = pbVar1[2];
      bVar2 = (&DAT_1018eb1d)[(uint)bVar2 * 2];
      local_7fc[iVar4 * 8 + 2] = bVar3;
      local_7fc[iVar4 * 8 + 1] = 0;
      local_7fc[iVar4 * 8 + 3] = bVar2;
      local_804 = local_804 + 4;
      iVar6 = iVar6 + 1;
      param_1 = param_1 + 2;
      param_2 = param_2 + -1;
    } while (param_2 != 0);
  }
  (local_800 + iVar6 * 4)[0] = 0xff;
  (local_800 + iVar6 * 4)[1] = 0;
  pbVar1 = local_7fc + iVar6 * 8;
  pbVar1[0] = 0x11;
  pbVar1[1] = 0;
  pbVar1[2] = 0;
  pbVar1[3] = 0;
  do {
    if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
      _fprintf(DAT_10764584,"%s","dx.device->CreateVertexDeclaration( elemTable, &decl )\n");
      _fflush(DAT_10764584);
    }
    (**(code **)(*DAT_101d1bf8 + 0x158))(DAT_101d1bf8,local_800,&local_808);
  } while (DAT_1076a830 != 0);
  return local_808;
}


