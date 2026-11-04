// 1006be48 size=1208 FUN_1006be48

int FUN_1006be48(int param_1,uint param_2,int param_3,undefined4 *param_4)

{
  int iVar1;
  void *pvVar2;
  uint uVar3;
  HMODULE hModule;
  FARPROC pFVar4;
  int *piVar5;
  int *in_ECX;
  undefined4 uVar6;
  char *pcVar7;
  undefined1 local_14 [4];
  int local_10;
  int local_8;
  
  if ((param_2 & 0xffffff3c) != 0) {
    return -0x7789f794;
  }
  if (param_4 == (undefined4 *)0x0) {
    return -0x7789f794;
  }
  *param_4 = 0;
  _free((void *)in_ECX[0x16]);
  if (in_ECX[0x1e] != 0) {
    FUN_1006ac35(1);
  }
  DAT_101ac958 = in_ECX;
  in_ECX[0xe] = -1;
  *in_ECX = param_1 + 0x18;
  in_ECX[0xf] = param_2;
  in_ECX[1] = param_1;
  in_ECX[2] = 0;
  in_ECX[0xc] = 0;
  in_ECX[0xd] = 0;
  in_ECX[0x16] = 0;
  in_ECX[0x17] = 0;
  in_ECX[0x18] = 0;
  in_ECX[0x19] = 0;
  in_ECX[0x1a] = 0;
  in_ECX[0x13] = 0;
  in_ECX[0x14] = 0;
  in_ECX[0x15] = 0;
  in_ECX[0x1b] = 0;
  in_ECX[0x1c] = 0;
  in_ECX[0x1d] = 0;
  FUN_10063e76(&local_8,0);
  if (local_8 == 0) {
    FUN_10063ea5(in_ECX + 0x1b,in_ECX + 0x1c);
  }
  iVar1 = FUN_10063e32(2);
  if (iVar1 < 0) {
    return iVar1;
  }
  FUN_1006ac56();
  if ((in_ECX[4] == 9) && (iVar1 = FUN_10063776(in_ECX[6],1,local_14), -1 < iVar1)) {
    in_ECX[4] = 0;
    in_ECX[6] = local_10;
  }
  if (in_ECX[4] != 0) {
    pcVar7 = "shader version expected";
    uVar6 = 0x7d1;
LAB_1006bf40:
    FUN_10067c3e(*in_ECX,in_ECX + 4,uVar6,pcVar7);
    goto LAB_1006bf4e;
  }
  if (in_ECX[6] == -0x1ff00) {
    FUN_10067d05(*in_ECX,in_ECX + 4,0x7df,"vs_1_0 is no longer supported; using vs_1_1");
    in_ECX[6] = -0x1feff;
  }
  if (in_ECX[6] == -0xff00) {
    FUN_10067d05(*in_ECX,in_ECX + 4,0x7df,"ps_1_0 is no longer supported; using ps_1_1");
    in_ECX[6] = -0xfeff;
  }
  if (in_ECX[6] == -0xfdfe) {
    in_ECX[6] = -0xfdff;
  }
  if ((((param_2 & 0x40) != 0) && ((in_ECX[6] & 0xffff0000U) == 0xfffe0000)) ||
     (((param_2 & 0x80) != 0 && ((in_ECX[6] & 0xffff0000U) == 0xffff0000)))) {
    in_ECX[0xf] = in_ECX[0xf] | 1;
  }
  uVar3 = in_ECX[6];
  if (uVar3 < 0xffff0103) {
    if (uVar3 == 0xffff0102) {
      in_ECX[0xe] = 7;
    }
    else if (uVar3 == 0xfffe0101) {
      in_ECX[0xe] = 0;
    }
    else if (uVar3 == 0xfffe0200) {
      in_ECX[0xe] = 1;
    }
    else if (uVar3 == 0xfffe0201) {
      in_ECX[0xe] = 2;
    }
    else if (uVar3 == 0xfffe02ff) {
      in_ECX[0xe] = 3;
    }
    else if (uVar3 == 0xfffe0300) {
      in_ECX[0xe] = 4;
    }
    else if (uVar3 == 0xfffe03ff) {
      in_ECX[0xe] = 5;
    }
    else {
      if (uVar3 != 0xffff0101) goto LAB_1006c0b3;
      in_ECX[0xe] = 6;
    }
  }
  else if (uVar3 == 0xffff0103) {
    in_ECX[0xe] = 8;
  }
  else if (uVar3 == 0xffff0104) {
    in_ECX[0xe] = 9;
  }
  else if (uVar3 == 0xffff0200) {
    in_ECX[0xe] = 10;
  }
  else if (uVar3 == 0xffff0201) {
    in_ECX[0xe] = 0xb;
  }
  else if (uVar3 == 0xffff02ff) {
    in_ECX[0xe] = 0xc;
  }
  else if (uVar3 == 0xffff0300) {
    in_ECX[0xe] = 0xd;
  }
  else {
    if (uVar3 != 0xffff03ff) {
LAB_1006c0b3:
      pcVar7 = "unrecognized shader version";
      uVar6 = 0x7d2;
      goto LAB_1006bf40;
    }
    in_ECX[0xe] = 0xe;
  }
  if (param_3 != 0) {
    in_ECX[0xf] = in_ECX[0xf] | 2;
    in_ECX[0x1f] = param_3;
    pvVar2 = operator_new(0xb8);
    if (pvVar2 == (void *)0x0) {
      iVar1 = 0;
    }
    else {
      iVar1 = FUN_1006a807(in_ECX[0xe]);
    }
    in_ECX[0x1e] = iVar1;
    if (iVar1 == 0) {
      return -0x7ff8fff2;
    }
    iVar1 = in_ECX[0xe];
    if ((iVar1 < 0) || (5 < iVar1)) {
      if ((iVar1 < 10) || (0xe < iVar1)) {
        FUN_10067c3e(*in_ECX,in_ECX + 4,0x7d1,
                     "only vs_1_1, vs_2_0, vs_2_x, vs_2_sw, ps_2_0, ps_2_x, and ps_2_sw are supported for assembly fragments"
                    );
        goto LAB_1006c194;
      }
      uVar3 = *(byte *)((int)in_ECX + 0x19) | 0x7fff00;
    }
    else {
      uVar3 = *(byte *)((int)in_ECX + 0x19) | 0x7ffe00;
    }
    in_ECX[6] = uVar3 << 8 | in_ECX[6] & 0xffU;
  }
LAB_1006c194:
  if (((*(byte *)(in_ECX + 0xf) & 2) == 0) &&
     (((hModule = GetModuleHandleA("d3d9.dll"), hModule != (HMODULE)0x0 ||
       (hModule = LoadLibraryA("d3d9.dll"), hModule != (HMODULE)0x0)) &&
      (pFVar4 = GetProcAddress(hModule,"Direct3DShaderValidatorCreate9"), pFVar4 != (FARPROC)0x0))))
  {
    piVar5 = (int *)(*pFVar4)();
    in_ECX[2] = (int)piVar5;
    if ((piVar5 == (int *)0x0) ||
       (iVar1 = (**(code **)(*piVar5 + 0xc))(piVar5,FUN_10068d02), -1 < iVar1)) goto LAB_1006c1e5;
  }
  else {
LAB_1006c1e5:
    iVar1 = FUN_100698e2(in_ECX[6]);
    if ((-1 < iVar1) && (iVar1 = FUN_100697fc(in_ECX + 4), -1 < iVar1)) {
      if (in_ECX[0x13] == 0) {
        iVar1 = FUN_1006b861();
        if (iVar1 != 0) {
          in_ECX[0x13] = 1;
        }
        if (in_ECX[0x13] == 0) {
          if (in_ECX[0x1b] != 0) {
            FUN_10063ea5(&param_2,0);
            uVar3 = in_ECX[0x1b];
            if ((uVar3 < param_2) && (param_2 < in_ECX[0x1c] + uVar3)) {
              in_ECX[0x1c] = param_2 - uVar3;
            }
          }
          if (((((in_ECX[0x1e] == 0) || (iVar1 = FUN_1006a14e(), -1 < iVar1)) &&
               (((*(byte *)(in_ECX + 0xf) & 1) == 0 || (iVar1 = FUN_1006a3e6(), -1 < iVar1)))) &&
              ((iVar1 = FUN_100698e2(0xffff), -1 < iVar1 &&
               (iVar1 = FUN_100697fc(in_ECX + 4), -1 < iVar1)))) &&
             ((piVar5 = (int *)in_ECX[2], piVar5 == (int *)0x0 ||
              (iVar1 = (**(code **)(*piVar5 + 0x14))(piVar5), -1 < iVar1)))) {
            iVar1 = FUN_100676fc();
            if (iVar1 != 0) goto LAB_1006bf4e;
            iVar1 = FUN_1006a71e(param_4);
            if (-1 < iVar1) {
              iVar1 = 0;
              goto LAB_1006c2df;
            }
          }
          goto LAB_1006c2d4;
        }
      }
LAB_1006bf4e:
      iVar1 = -0x7789f4a7;
    }
  }
LAB_1006c2d4:
  in_ECX[0x13] = 1;
LAB_1006c2df:
  piVar5 = (int *)in_ECX[2];
  if (piVar5 != (int *)0x0) {
    (**(code **)(*piVar5 + 8))(piVar5);
    in_ECX[2] = 0;
  }
  FUN_100673e4();
  return iVar1;
}


