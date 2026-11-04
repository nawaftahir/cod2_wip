


int R_GetMaterialSubimageCount(int param_1)

{
  return (unsigned int)*(byte *)(param_1 + 0xf) * (unsigned int)*(byte *)(param_1 + 0xe);
}


