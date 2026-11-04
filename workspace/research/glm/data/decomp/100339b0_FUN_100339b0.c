// 100339b0 size=214 FUN_100339b0

void FUN_100339b0(void)

{
  float10 fVar1;
  float fVar2;
  
  fVar1 = (float10)FUN_100330c0(0,0,0x552);
  fVar2 = (float)(fVar1 * (float10)0.016666668);
  (*(code *)RI_Printf)(0,"-----------------------------------------------\n",fVar2);
  (*(code *)RI_Printf)(0,"static vertex data    %8.0f verts/sec @ 60Hz\n",0);
  (*(code *)RI_Printf)(0,"static vertex data    %8.0f tris/sec @ 60Hz\n",0);
  (*(code *)RI_Printf)(0,"skinned vertex data   %8.0f verts/sec @ 60Hz\n",0);
  (*(code *)RI_Printf)(0,"skinned vertex data   %8.0f tris/sec @ 60Hz\n",0);
  (*(code *)RI_Printf)(0,"dynamic vertex data   %8.0f verts/sec @ 60Hz\n",(double)(fVar2 * 4.0));
  (*(code *)RI_Printf)(0,"dynamic vertex data   %8.0f tris/sec @ 60Hz\n",(double)(fVar2 + fVar2));
  (*(code *)RI_Printf)(0,"-----------------------------------------------\n");
  return;
}


