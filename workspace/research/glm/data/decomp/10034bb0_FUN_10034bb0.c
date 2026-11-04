// 10034bb0 size=172 FUN_10034bb0

void FUN_10034bb0(void)

{
  int in_EAX;
  undefined4 local_4;
  
  if (DAT_101d620c == 0) {
    return;
  }
  if (in_EAX == 0) {
    if (((byte)DAT_10766680 & 0xf0) == 0x20) {
LAB_10034c53:
      local_4 = 0;
      goto LAB_10034bdf;
    }
  }
  else if (in_EAX == 2) goto LAB_10034c53;
  local_4 = DAT_1072dec8;
LAB_10034bdf:
  local_4 = CONCAT13(0xff,(undefined3)local_4);
  if (DAT_107667d8 != local_4) {
    do {
      if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
        _fprintf(DAT_10764584,"%s","dx.device->SetRenderState( D3DRS_FOGCOLOR, fogColor.packed )\n")
        ;
        _fflush(DAT_10764584);
      }
      (**(code **)(*DAT_101d1bf8 + 0xe4))(DAT_101d1bf8,0x22,local_4);
    } while (DAT_1076a830 != 0);
    DAT_107667d8 = local_4;
  }
  return;
}


