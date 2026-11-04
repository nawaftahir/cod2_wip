// 10026a50 size=136 R_FreeImageAllocations

void R_FreeImageAllocations(undefined2 param_1,undefined2 param_2)

{
  DAT_101d4928 = param_1;
  DAT_101d492a = param_2;
  FUN_1003ea30();
  do {
    if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
      _fprintf(DAT_10764584,"%s",
               "dx.device->Clear( 0, 0, 0x00000001l | 0x00000002l | 0x00000004l, ((D3DCOLOR)((((255)&0xff)<<24)|(((255)&0xff)<<16)|(((0)&0xff)<<8)|((255)&0xff))), 1, 0 )\n"
              );
      _fflush(DAT_10764584);
    }
    (**(code **)(*DAT_101d1bf8 + 0xac))(DAT_101d1bf8,0,0,7,0xffff00ff,0x3f800000,0);
  } while (DAT_1076a830 != 0);
  return;
}


