// 10038610 size=143 FUN_10038610

void FUN_10038610(void)

{
  undefined4 *unaff_ESI;
  
  if ((DAT_1072debd != '\0') ||
     ((*(int *)(DAT_101ce764 + 8) <= (int)unaff_ESI[2] &&
      ((*(int *)(DAT_101ce6b8 + 8) == 0 || ((int)unaff_ESI[2] <= *(int *)(DAT_101ce6b8 + 8))))))) {
    do {
      if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
        _fprintf(DAT_10764584,"%s",
                 "dx.device->DrawIndexedPrimitive( D3DPT_TRIANGLELIST, args->u.buf.baseVertex, args->firstVertexFromBase, args->vertexCount, args->u.buf.baseIndex, args->primCount )\n"
                );
        _fflush(DAT_10764584);
      }
      (**(code **)(*DAT_101d1bf8 + 0x148))
                (DAT_101d1bf8,4,unaff_ESI[3],*unaff_ESI,unaff_ESI[1],unaff_ESI[4],unaff_ESI[2]);
    } while (DAT_1076a830 != 0);
  }
  return;
}


