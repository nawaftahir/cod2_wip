// 100335d0 size=918 FUN_100335d0

void FUN_100335d0(void)

{
  float10 fVar1;
  
  if (*(char *)(DAT_101ce79c + 8) == '\0') {
    (*(code *)RI_Printf)
              (0,"Fill testing uses extra textures and materials, so it is usually unavailable.\n");
    (*(code *)RI_Printf)
              (0,"You must set \'r_testFillEnable\' to 1 and vid_restart to test fill rates.\n");
    return;
  }
  (*(code *)RI_Printf)(0,"-----------------------------------------------\n");
  fVar1 = (float10)FUN_100330c0((float)DAT_1076671c,(float)DAT_10766720,
                                *(undefined4 *)(DAT_101ce75c + 8));
  (*(code *)RI_Printf)
            (0,"normal fill                 %4.1f overdraw @ 60Hz\n",
             (double)(fVar1 * (float10)0.016666668));
  fVar1 = (float10)FUN_100330c0((float)DAT_1076671c,(float)DAT_10766720,
                                *(undefined4 *)(DAT_101ce75c + 8));
  (*(code *)RI_Printf)
            (0,"alpha blend fill            %4.1f overdraw @ 60Hz\n",
             (double)(fVar1 * (float10)0.016666668));
  fVar1 = (float10)FUN_100330c0((float)DAT_1076671c,(float)DAT_10766720,
                                *(undefined4 *)(DAT_101ce75c + 8));
  (*(code *)RI_Printf)
            (0,"alpha test pass fill        %4.1f overdraw @ 60Hz\n",
             (double)(fVar1 * (float10)0.016666668));
  fVar1 = (float10)FUN_100330c0((float)DAT_1076671c,(float)DAT_10766720,
                                *(undefined4 *)(DAT_101ce75c + 8));
  (*(code *)RI_Printf)
            (0,"alpha test fail fill        %4.1f overdraw @ 60Hz\n",
             (double)(fVar1 * (float10)0.016666668));
  fVar1 = (float10)FUN_100330c0((float)DAT_1076671c,(float)DAT_10766720,
                                *(undefined4 *)(DAT_101ce75c + 8));
  (*(code *)RI_Printf)
            (0,"additive fill               %4.1f overdraw @ 60Hz\n",
             (double)(fVar1 * (float10)0.016666668));
  FUN_100330c0((float)DAT_1076671c,(float)DAT_10766720,*(undefined4 *)(DAT_101ce75c + 8));
  (*(code *)RI_Printf)(0,"depth only fill             %4.1f overdraw @ 60Hz\n");
  FUN_100330c0((float)DAT_1076671c,(float)DAT_10766720,*(undefined4 *)(DAT_101ce75c + 8));
  (*(code *)RI_Printf)(0,"1-sided stencil keep fill   %4.1f overdraw @ 60Hz\n");
  fVar1 = (float10)FUN_100330c0((float)DAT_1076671c,(float)DAT_10766720,
                                *(undefined4 *)(DAT_101ce75c + 8));
  (*(code *)RI_Printf)
            (0,"1-sided stencil reject fill %4.1f overdraw @ 60Hz\n",
             (double)(fVar1 * (float10)0.016666668));
  if (DAT_101d4968 != '\0') {
    fVar1 = (float10)FUN_100330c0((float)DAT_1076671c,(float)DAT_10766720,
                                  *(undefined4 *)(DAT_101ce75c + 8));
    (*(code *)RI_Printf)
              (0,"2-sided stencil keep fill   %4.1f overdraw @ 60Hz\n",
               (double)(fVar1 * (float10)0.016666668));
    fVar1 = (float10)FUN_100330c0((float)DAT_1076671c,(float)DAT_10766720,
                                  *(undefined4 *)(DAT_101ce75c + 8));
    (*(code *)RI_Printf)
              (0,"2-sided stencil reject fill %4.1f overdraw @ 60Hz\n",
               (double)(fVar1 * (float10)0.016666668));
  }
  fVar1 = (float10)FUN_100331d0(DAT_101d1b84,0x12);
  (*(code *)RI_Printf)(0,"phong point bump fill       %4.1f overdraw @ 60Hz\n",(double)fVar1);
  fVar1 = (float10)FUN_100331d0(DAT_101d1b88,0x12);
  (*(code *)RI_Printf)(0,"phong point bump+spec fill  %4.1f overdraw @ 60Hz\n",(double)fVar1);
  fVar1 = (float10)FUN_100331d0(DAT_101d1b84,9);
  (*(code *)RI_Printf)(0,"phong dir bump fill         %4.1f overdraw @ 60Hz\n",(double)fVar1);
  fVar1 = (float10)FUN_100331d0(DAT_101d1b88,9);
  (*(code *)RI_Printf)(0,"phong dir bump+spec fill    %4.1f overdraw @ 60Hz\n",(double)fVar1);
  (*(code *)RI_Printf)(0,"-----------------------------------------------\n");
  return;
}


