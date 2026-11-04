extern int FUN_10065ae3();
extern int FUN_10065bd0();
extern int FUN_10066f3d();
extern int FUN_1006768e();
extern int FUN_100676fc();
extern int FUN_10068c26();
extern int FUN_1006b285();
extern int FUN_1006be48();


int FUN_10062301(unsigned int param_1,unsigned int param_2,unsigned int param_3,unsigned int param_4,
                unsigned int *param_5,int param_6)

{
  int iVar1;
  int iVar2;
  unsigned char local_338 [816];
  int *local_8;
  
  local_8 = (int *)0x0;
  FUN_10065ae3();
  if (param_5 != (unsigned int *)0x0) {
    *param_5 = 0;
  }
  if ((param_4 & 0xfffffffc) == 0) {
    iVar2 = FUN_10066f3d(param_1,1,param_2,param_3);
    if (iVar2 >= 0) {
      FUN_10068c26();
      iVar2 = FUN_1006be48(local_338,param_4,0,&local_8);
      FUN_1006b285();
      if (iVar2 >= 0) {
        iVar1 = FUN_100676fc();
        if (iVar1 == 0) {
          if (param_5 != (unsigned int *)0x0) {
            *param_5 = local_8;
            local_8 = (int *)0x0;
          }
        }
        else {
          iVar2 = -0x7789f4a7;
        }
      }
    }
  }
  else {
    iVar2 = -0x7789f794;
  }
  if (param_6 != 0) {
    FUN_1006768e(param_6);
  }
  if (local_8 != (int *)0x0) {
    (**(void **)(*local_8 + 8))(local_8);
    local_8 = (int *)0x0;
  }
  FUN_10065bd0();
  return iVar2;
}


