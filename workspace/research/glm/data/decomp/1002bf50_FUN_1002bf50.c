// 1002bf50 size=96 FUN_1002bf50

uint FUN_1002bf50(void)

{
  uint uVar1;
  uint uVar2;
  
  uVar1 = FUN_1002bed0();
  uVar2 = (**(code **)(*DAT_101d1bf8 + 0x10))(DAT_101d1bf8);
  uVar2 = uVar2 >> 0x14;
  if (uVar1 == 0) {
    (*(code *)RI_Printf)
              (0,
               "DirectX reports %i MB of available texture memory, but wouldn\'t tell available video memory.\n"
              );
    return uVar2;
  }
  (*(code *)RI_Printf)
            (0,"DirectX reports %i MB of video memory and %i MB of available texture memory.\n",
             uVar1,uVar2);
  if (uVar1 < uVar2) {
    uVar2 = uVar1 - 0x10;
    (*(code *)RI_Printf)(0,"Using video memory size to cap used texture memory at %i MB.\n",uVar2);
  }
  return uVar2;
}


