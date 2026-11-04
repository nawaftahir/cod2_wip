extern unsigned int DAT_101d616c;
extern unsigned int DAT_101d620c;


void R_SwitchFog(int param_1)

{
  (**(void **)(param_1 + 0x10))(param_1,0xa0,&DAT_101d616c);
  (**(void **)(param_1 + 0x10))(param_1,4,&DAT_101d620c);
  return;
}


