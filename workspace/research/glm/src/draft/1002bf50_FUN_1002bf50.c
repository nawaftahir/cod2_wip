extern unsigned int DAT_101d1bf8;
extern int FUN_1002bed0();


unsigned int FUN_1002bf50(void)

{
  unsigned int uVar1;
  unsigned int uVar2;
  
  uVar1 = FUN_1002bed0();
  uVar2 = (**(void **)(*g_101d1bf8 + 0x10))(g_101d1bf8);
  u
	int g_101d1bf8 = DAT_101d1bf8;Var2 = uVar2 >> 0x14;
  if (uVar1 == 0) {
    (*(void *)RI_Printf)
              (0,
               "DirectX reports %i MB of available texture memory, but wouldn\'t tell available video memory.\n"
              );
    return uVar2;
  }
  (*(void *)RI_Printf)
            (0,"DirectX reports %i MB of video memory and %i MB of available texture memory.\n",
             uVar1,uVar2);
  if (uVar1 < uVar2) {
    uVar2 = uVar1 - 0x10;
    (*(void *)RI_Printf)(0,"Using video memory size to cap used texture memory at %i MB.\n",uVar2);
  }
  return uVar2;
}


