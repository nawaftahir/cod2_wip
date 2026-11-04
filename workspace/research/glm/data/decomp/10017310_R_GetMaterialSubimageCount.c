// 10017310 size=16 R_GetMaterialSubimageCount

int R_GetMaterialSubimageCount(int param_1)

{
  return (uint)*(byte *)(param_1 + 0xf) * (uint)*(byte *)(param_1 + 0xe);
}


