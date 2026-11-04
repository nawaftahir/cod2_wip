// 10035cd0 size=670 FUN_10035cd0

void FUN_10035cd0(void)

{
  int iVar1;
  int iVar2;
  float *in_EAX;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  int iVar10;
  int local_48;
  int local_40;
  int local_34;
  float local_10;
  float local_c;
  float local_8;
  
  if ((DAT_10764578 != 0) && (iVar2 = *(int *)(DAT_101ce7cc + 8), 0 < iVar2)) {
    iVar5 = (int)ROUND((*in_EAX - -131072.0) + 9.313226e-10) >> 5;
    iVar6 = (int)ROUND((in_EAX[1] - -131072.0) + 9.313226e-10) >> 5;
    local_10 = (float)((iVar5 + -0x1000) * 0x20);
    iVar9 = (int)ROUND((in_EAX[2] - -131072.0) - 0.5) >> 6;
    local_c = (float)((iVar6 + -0x1000) * 0x20);
    local_8 = (float)((iVar9 + -0x800) * 0x40);
    local_40 = -1;
    do {
      iVar1 = iVar9 + local_40;
      if (((-1 < iVar1) && (iVar1 * 0x40 < 0x80001)) &&
         (iVar8 = -iVar2, -iVar2 == iVar2 || iVar8 < iVar2)) {
        iVar10 = iVar8 + iVar6;
        iVar3 = iVar2 * 2 + 1;
        do {
          if (((-1 < iVar10) && (iVar10 * 0x20 < 0x80001)) && (iVar8 <= iVar2)) {
            iVar7 = iVar8 + iVar5;
            local_48 = (iVar7 + -0x1000) * 0x20;
            local_34 = iVar2 * 2 + 1;
            do {
              if (((-1 < iVar7) && (iVar7 * 0x20 < 0x80001)) &&
                 (iVar4 = FUN_10035c40(iVar10,iVar1,0), iVar4 < 0)) {
                local_10 = (float)local_48;
                local_c = (float)((iVar10 + -0x1000) * 0x20);
                local_8 = (float)((iVar1 + -0x800) * 0x40);
                iVar4 = FUN_1002c060(0);
                if (iVar4 != 2) {
                  FUN_10005680(&local_10,0x3f800000,&DAT_10195640);
                }
              }
              local_48 = local_48 + 0x20;
              iVar7 = iVar7 + 1;
              local_34 = local_34 + -1;
            } while (local_34 != 0);
          }
          iVar10 = iVar10 + 1;
          iVar3 = iVar3 + -1;
        } while (iVar3 != 0);
      }
      local_40 = local_40 + 1;
    } while (local_40 < 2);
  }
  return;
}


