
undefined4 __thiscall FUN_00407990(int *param_1,HMODULE param_2,uint param_3)

{
  HRSRC pHVar1;
  ushort *puVar2;
  uint uVar3;
  UINT UVar4;
  DWORD DVar5;
  LPCWSTR lpWideCharStr;
  LPCWSTR lpWideCharStr_00;
  LPSTR pCVar6;
  int iVar7;
  int cbMultiByte;
  LPCSTR pCVar8;
  LPBOOL pBVar9;
  
  pHVar1 = FindResourceA(param_2,(LPCSTR)((param_3 >> 4) + 1 & 0xffff),(LPCSTR)0x6);
  if (pHVar1 != (HRSRC)0x0) {
    puVar2 = (ushort *)FUN_00407aa0(param_2,pHVar1,param_3);
    if (puVar2 != (ushort *)0x0) {
      uVar3 = (uint)*puVar2;
      pBVar9 = (LPBOOL)0x0;
      pCVar8 = (LPCSTR)0x0;
      iVar7 = 0;
      pCVar6 = (LPSTR)0x0;
      lpWideCharStr_00 = (LPCWSTR)(puVar2 + 1);
      DVar5 = 0;
      lpWideCharStr = lpWideCharStr_00;
      UVar4 = (*(code *)PTR_FUN_005984fc)();
      iVar7 = WideCharToMultiByte(UVar4,DVar5,lpWideCharStr,uVar3,pCVar6,iVar7,pCVar8,pBVar9);
      if ((int)(1U - *(int *)(*param_1 + -4) | *(int *)(*param_1 + -8) - iVar7) < 0) {
        FUN_00402d30(iVar7);
      }
      uVar3 = (uint)*puVar2;
      pCVar6 = (LPSTR)*param_1;
      pBVar9 = (LPBOOL)0x0;
      pCVar8 = (LPCSTR)0x0;
      DVar5 = 0;
      cbMultiByte = iVar7;
      UVar4 = (*(code *)PTR_FUN_005984fc)();
      WideCharToMultiByte(UVar4,DVar5,lpWideCharStr_00,uVar3,pCVar6,cbMultiByte,pCVar8,pBVar9);
      if ((-1 < iVar7) && (iVar7 <= *(int *)(*param_1 + -8))) {
        *(int *)(*param_1 + -0xc) = iVar7;
        *(undefined1 *)(iVar7 + *param_1) = 0;
        return 1;
      }
                    /* WARNING: Subroutine does not return */
      FUN_00402c90(0x80070057);
    }
  }
  return 0;
}

