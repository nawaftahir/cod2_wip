// 10063b46 size=433 FUN_10063b46

uint FUN_10063b46(WCHAR *param_1,LPSTR param_2,undefined4 param_3,undefined4 param_4,
                 undefined4 param_5,uint param_6,undefined4 param_7,undefined4 param_8)

{
  char *pcVar1;
  WCHAR WVar2;
  WCHAR *pWVar3;
  undefined4 *puVar4;
  DWORD nBufferLength;
  int iVar5;
  int in_ECX;
  uint uVar6;
  undefined4 *puVar7;
  WCHAR local_108 [130];
  
  iVar5 = param_6;
  *(uint *)(in_ECX + 0x58) = param_6;
  if (param_2 != (LPSTR)0x0) {
    WideCharToMultiByte(0xfde9,0,param_1,-1,(LPSTR)local_108,0x104,(LPCSTR)0x0,(LPBOOL)0x0);
    param_1 = local_108;
  }
  if (iVar5 == 0) {
    nBufferLength = GetFullPathNameA((LPCSTR)param_1,0,(LPSTR)0x0,(LPSTR *)0x0);
    param_6 = nBufferLength + 1;
    iVar5 = FUN_100826bd(param_6,1);
    *(int *)(in_ECX + 0x60) = iVar5;
    if (iVar5 != 0) {
      iVar5 = FUN_100826bd(param_6,1);
      *(int *)(in_ECX + 0x5c) = iVar5;
      if (iVar5 != 0) {
        GetFullPathNameA((LPCSTR)param_1,nBufferLength,*(LPSTR *)(in_ECX + 0x60),&param_2);
        *(undefined1 *)(nBufferLength + *(int *)(in_ECX + 0x60)) = 0;
        puVar4 = *(undefined4 **)(in_ECX + 0x60);
        puVar7 = *(undefined4 **)(in_ECX + 0x5c);
        for (uVar6 = param_6 >> 2; uVar6 != 0; uVar6 = uVar6 - 1) {
          *puVar7 = *puVar4;
          puVar4 = puVar4 + 1;
          puVar7 = puVar7 + 1;
        }
        for (uVar6 = param_6 & 3; uVar6 != 0; uVar6 = uVar6 - 1) {
          *(undefined1 *)puVar7 = *(undefined1 *)puVar4;
          puVar4 = (undefined4 *)((int)puVar4 + 1);
          puVar7 = (undefined4 *)((int)puVar7 + 1);
        }
        if (param_2 != (LPSTR)0x0) {
          *param_2 = '\0';
        }
        uVar6 = FUN_100823c7(*(undefined4 *)(in_ECX + 0x5c),0);
        if ((int)uVar6 < 0) {
          FUN_10067c3e(param_5,param_4,0x5e3,"failed to open source file: \'%s\'",param_1);
          return uVar6;
        }
        *(undefined4 *)(in_ECX + 100) = *(undefined4 *)(in_ECX + 0x44);
        *(undefined4 *)(in_ECX + 0x68) = *(undefined4 *)(in_ECX + 0x48);
        goto LAB_10063cd4;
      }
    }
  }
  else {
    pWVar3 = param_1;
    do {
      WVar2 = *pWVar3;
      pWVar3 = (WCHAR *)((int)pWVar3 + 1);
    } while ((char)WVar2 != '\0');
    pcVar1 = (char *)((int)pWVar3 + (1 - ((int)param_1 + 1)));
    puVar4 = (undefined4 *)FUN_100826bd(pcVar1,1);
    *(undefined4 **)(in_ECX + 0x5c) = puVar4;
    if (puVar4 != (undefined4 *)0x0) {
      pWVar3 = param_1;
      for (uVar6 = (uint)pcVar1 >> 2; uVar6 != 0; uVar6 = uVar6 - 1) {
        *puVar4 = *(undefined4 *)pWVar3;
        pWVar3 = pWVar3 + 2;
        puVar4 = puVar4 + 1;
      }
      for (uVar6 = (uint)pcVar1 & 3; uVar6 != 0; uVar6 = uVar6 - 1) {
        *(char *)puVar4 = (char)*pWVar3;
        pWVar3 = (WCHAR *)((int)pWVar3 + 1);
        puVar4 = (undefined4 *)((int)puVar4 + 1);
      }
      param_6 = (**(code **)**(undefined4 **)(in_ECX + 0x58))
                          (*(undefined4 **)(in_ECX + 0x58),param_7,*(undefined4 *)(in_ECX + 0x5c),
                           param_8,in_ECX + 100,in_ECX + 0x68);
      if ((int)param_6 < 0) {
        FUN_10067c3e(param_5,param_4,0x5e3,"failed to open source file: \'%s\'",param_1);
        return param_6;
      }
LAB_10063cd4:
      uVar6 = FUN_1006771f(*(undefined4 *)(in_ECX + 100),*(undefined4 *)(in_ECX + 0x68),
                           *(undefined4 *)(in_ECX + 0x5c),1,param_3,param_5);
      if ((int)uVar6 < 0) {
        return uVar6;
      }
      return 0;
    }
  }
  return 0x8007000e;
}


