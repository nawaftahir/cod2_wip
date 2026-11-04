// 1003ed20 size=144 FUN_1003ed20

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_1003ed20(undefined4 param_1)

{
  undefined4 unaff_EBX;
  int unaff_ESI;
  undefined4 unaff_EDI;
  
  _DAT_10766760 = (&DAT_10766750)[unaff_ESI * 3];
  (&DAT_10766750)[unaff_ESI * 3] = param_1;
  (&DAT_10766754)[unaff_ESI * 3] = unaff_EBX;
  (&DAT_10766758)[unaff_ESI * 3] = unaff_EDI;
  do {
    if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
      _fprintf(DAT_10764584,"%s",
               "dx.device->SetStreamSource( streamIndex, vb, vertexOffset, vertexStride )\n");
      _fflush(DAT_10764584);
    }
    (**(code **)(*DAT_101d1bf8 + 400))(DAT_101d1bf8);
  } while (DAT_1076a830 != 0);
  _DAT_10766760 = 0;
  return;
}


