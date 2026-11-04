// 100c9a7f size=505 FUN_100c9a7f

int FUN_100c9a7f(int param_1,int *param_2,undefined4 param_3,int *param_4,int *param_5,int *param_6,
                undefined4 param_7,uint param_8,uint param_9,uint param_10,int param_11)

{
  int *piVar1;
  undefined4 uVar2;
  int iVar3;
  int iVar4;
  int *in_ECX;
  undefined4 local_18;
  undefined4 local_14;
  undefined4 local_10;
  undefined4 local_c;
  uint local_8;
  
  iVar4 = param_1;
  uVar2 = (**(code **)(*in_ECX + 0x5c))(param_1);
  iVar3 = FUN_100c98b1(uVar2);
  piVar1 = param_2;
  if (iVar3 < 0) {
    return iVar3;
  }
  iVar3 = (**(code **)(*in_ECX + 0x6c))
                    (*(undefined4 *)(in_ECX[5] + *param_2 * 4),&local_8,&local_18,&local_14);
  if (iVar3 < 0) {
    return iVar3;
  }
  iVar3 = (**(code **)(*in_ECX + 0x70))(piVar1,param_3,&param_1,local_14);
  if (iVar3 < 0) {
    return iVar3;
  }
  iVar3 = (**(code **)(*in_ECX + 100))(-(uint)(param_11 != 0) & 0x400000 | local_8,param_1,local_18)
  ;
  piVar1 = param_4;
  if (iVar3 < 0) {
    return iVar3;
  }
  if (iVar4 == 8) {
    param_1 = 0x70000;
    goto LAB_100c9b55;
  }
  if (iVar4 != 9) {
    if (iVar4 == 0x5a) {
      param_1 = 0x30000;
      goto LAB_100c9b55;
    }
    if ((((iVar4 == 6) || (iVar4 == 0xe)) || (iVar4 == 0xf)) || (iVar4 == 7)) {
      param_1 = 0x10000;
      goto LAB_100c9b55;
    }
    if (iVar4 != 0x25) goto LAB_100c9b55;
  }
  param_1 = 0xf0000;
LAB_100c9b55:
  if (((param_4 == (int *)0x0) ||
      (((iVar4 = (**(code **)(*in_ECX + 0x74))
                           (*(undefined4 *)(in_ECX[5] + *param_4 * 4),&local_8,&local_c), -1 < iVar4
        && (iVar4 = (**(code **)(*in_ECX + 0x78))(piVar1,param_7,param_1,&local_10), -1 < iVar4)) &&
       (iVar4 = (**(code **)(*in_ECX + 0x68))(local_8 ^ param_8,local_10,local_c), -1 < iVar4)))) &&
     (((piVar1 = param_5, param_5 == (int *)0x0 ||
       (((iVar4 = (**(code **)(*in_ECX + 0x74))
                            (*(undefined4 *)(in_ECX[5] + *param_5 * 4),&local_8,&local_c),
         -1 < iVar4 &&
         (iVar4 = (**(code **)(*in_ECX + 0x78))(piVar1,param_7,param_1,&local_10), -1 < iVar4)) &&
        (iVar4 = (**(code **)(*in_ECX + 0x68))(local_8 ^ param_9,local_10,local_c), -1 < iVar4))))
      && (((piVar1 = param_6, param_6 == (int *)0x0 ||
           (((iVar4 = (**(code **)(*in_ECX + 0x74))
                                (*(undefined4 *)(in_ECX[5] + *param_6 * 4),&local_8,&local_c),
             -1 < iVar4 &&
             (iVar4 = (**(code **)(*in_ECX + 0x78))(piVar1,param_7,param_1,&local_10), -1 < iVar4))
            && (iVar4 = (**(code **)(*in_ECX + 0x68))(local_8 ^ param_10,local_10,local_c),
               -1 < iVar4)))) &&
          ((iVar4 = (**(code **)(*in_ECX + 0x60))(), -1 < iVar4 &&
           (iVar4 = FUN_100c4cc4(), -1 < iVar4)))))))) {
    iVar4 = 0;
  }
  return iVar4;
}


