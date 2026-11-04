void RB_ScaleWorldMatrix(const float *src, float *dst, float invScale)
{
	int i;
	for (i = 0; i < 3; ++i)
	{
		dst[i * 4 + 0] = src[i * 4 + 0] * invScale;
		dst[i * 4 + 1] = src[i * 4 + 1] * invScale;
		dst[i * 4 + 2] = src[i * 4 + 2] * invScale;
		dst[i * 4 + 3] = src[i * 4 + 3];
	}
	dst[12] = src[12];
	dst[13] = src[13];
	dst[14] = src[14];
	dst[15] = src[15];
}
