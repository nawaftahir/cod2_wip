// 10107297 size=553 __ValidateEH3RN

/* Library Function - Single Match
    __ValidateEH3RN
   
   Library: Visual Studio 2003 Release */

undefined4 __ValidateEH3RN(void *param_1)

{
  uint *puVar1;
  void *pvVar2;
  uint uVar3;
  void *pvVar4;
  uint *puVar5;
  SIZE_T SVar6;
  int *piVar7;
  LONG LVar8;
  uint *puVar9;
  uint uVar10;
  uint uVar11;
  int iVar12;
  int iVar13;
  int iVar14;
  _MEMORY_BASIC_INFORMATION local_24;
  void *local_8;
  
  pvVar4 = param_1;
  puVar9 = *(uint **)((int)param_1 + 8);
  if ((((uint)puVar9 & 3) != 0) ||
     ((local_8 = StackLimit, StackLimit <= puVar9 && (puVar9 < StackBase)))) {
    return 0;
  }
  puVar1 = (uint *)((int)param_1 + 0xc);
  if (*puVar1 == 0xffffffff) {
    return 1;
  }
  uVar11 = 0;
  param_1 = (void *)0x0;
  puVar5 = puVar9;
  do {
    if ((*puVar5 != 0xffffffff) && (uVar11 <= *puVar5)) {
      return 0;
    }
    if (puVar5[1] != 0) {
      param_1 = (void *)((int)param_1 + 1);
    }
    uVar11 = uVar11 + 1;
    puVar5 = puVar5 + 3;
  } while (uVar11 <= *puVar1);
  if ((param_1 != (void *)0x0) &&
     ((pvVar2 = *(void **)((int)pvVar4 + -8), pvVar2 < StackLimit || (pvVar4 <= pvVar2)))) {
    return 0;
  }
  uVar11 = (uint)puVar9 & 0xfffff000;
  iVar14 = 0;
  if (0 < DAT_101ae1e0) {
    do {
      if ((&DAT_101ae1e8)[iVar14] == uVar11) {
        if (iVar14 < 1) {
          return 1;
        }
        LVar8 = InterlockedExchange((LONG *)&DAT_101ae228,1);
        if (LVar8 != 0) {
          return 1;
        }
        if ((&DAT_101ae1e8)[iVar14] == uVar11) goto LAB_10107492;
        iVar14 = DAT_101ae1e0 + -1;
        if (iVar14 < 0) goto LAB_10107480;
        goto LAB_10107470;
      }
      iVar14 = iVar14 + 1;
    } while (iVar14 < DAT_101ae1e0);
  }
  SVar6 = VirtualQuery(puVar9,&local_24,0x1c);
  if (SVar6 == 0) {
    return 0xffffffff;
  }
  if (local_24.Type != 0x1000000) {
    return 0xffffffff;
  }
  if (((byte)local_24.Protect & 0xcc) != 0) {
    if (((*(short *)local_24.AllocationBase != 0x5a4d) ||
        (piVar7 = (int *)(*(int *)((int)local_24.AllocationBase + 0x3c) +
                         (int)local_24.AllocationBase), *piVar7 != 0x4550)) ||
       ((short)piVar7[6] != 0x10b)) {
      return 0xffffffff;
    }
    uVar10 = (uint)*(ushort *)(piVar7 + 5);
    if (*(short *)((int)piVar7 + 6) == 0) {
      return 0xffffffff;
    }
    uVar3 = *(uint *)((int)piVar7 + uVar10 + 0x24);
    if (((uVar3 <= (uint)((int)puVar9 - (int)local_24.AllocationBase)) &&
        ((uint)((int)puVar9 - (int)local_24.AllocationBase) <
         *(int *)((int)piVar7 + uVar10 + 0x20) + uVar3)) &&
       ((*(byte *)((int)piVar7 + uVar10 + 0x3f) & 0x80) != 0)) {
      return 0;
    }
  }
  LVar8 = InterlockedExchange((LONG *)&DAT_101ae228,1);
  iVar14 = DAT_101ae1e0;
  if (LVar8 != 0) {
    return 1;
  }
  iVar12 = DAT_101ae1e0;
  if (0 < DAT_101ae1e0) {
    puVar9 = (uint *)(&DAT_101ae1e4 + DAT_101ae1e0 * 4);
    do {
      if (*puVar9 == uVar11) break;
      iVar12 = iVar12 + -1;
      puVar9 = puVar9 + -1;
    } while (0 < iVar12);
  }
  if (iVar12 == 0) {
    iVar12 = 0xf;
    if (DAT_101ae1e0 < 0x10) {
      iVar12 = DAT_101ae1e0;
    }
    iVar13 = 0;
    if (-1 < iVar12) {
      do {
        puVar9 = &DAT_101ae1e8 + iVar13;
        uVar10 = *puVar9;
        iVar13 = iVar13 + 1;
        *puVar9 = uVar11;
        uVar11 = uVar10;
      } while (iVar13 <= iVar12);
    }
    if (iVar14 < 0x10) {
      DAT_101ae1e0 = iVar14 + 1;
    }
  }
  InterlockedExchange((LONG *)&DAT_101ae228,0);
  return 1;
  while (iVar14 = iVar14 + -1, -1 < iVar14) {
LAB_10107470:
    if ((&DAT_101ae1e8)[iVar14] == uVar11) break;
  }
  if (iVar14 < 0) {
LAB_10107480:
    if (DAT_101ae1e0 < 0x10) {
      DAT_101ae1e0 = DAT_101ae1e0 + 1;
    }
    iVar14 = DAT_101ae1e0 + -1;
  }
  else if (iVar14 == 0) goto LAB_101074aa;
LAB_10107492:
  iVar12 = 0;
  if (-1 < iVar14) {
    do {
      puVar9 = &DAT_101ae1e8 + iVar12;
      uVar10 = *puVar9;
      iVar12 = iVar12 + 1;
      *puVar9 = uVar11;
      uVar11 = uVar10;
    } while (iVar12 <= iVar14);
  }
LAB_101074aa:
  InterlockedExchange((LONG *)&DAT_101ae228,0);
  return 1;
}


