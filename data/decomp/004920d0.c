
void __fastcall FUN_004920d0(undefined4 param_1,undefined2 param_2)

{
  undefined4 *in_EAX;
  
  *(undefined2 *)(in_EAX + 3) = param_2;
  *in_EAX = 0;
  in_EAX[1] = 0;
  in_EAX[2] = 0;
  in_EAX[4] = 0;
  in_EAX[5] = 0xbf800000;
  in_EAX[6] = 0xbf800000;
  in_EAX[7] = 0;
  in_EAX[8] = 0;
  in_EAX[9] = 0;
  in_EAX[10] = 0;
  in_EAX[0xb] = 0;
  in_EAX[0xc] = 0;
  in_EAX[0xd] = DAT_00592740;
  in_EAX[0xe] = DAT_00592744;
  in_EAX[0xf] = DAT_00592748;
  in_EAX[0x10] = 0;
  *(undefined2 *)(in_EAX + 0x11) = 0xffff;
  *(undefined2 *)((int)in_EAX + 0x46) = 0xffff;
  return;
}

