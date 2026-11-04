#include "../qcommon/qcommon.h"

// Water FFT over 4..256 complex samples.

struct complex_s
{
	float real;
	float imag;
};

void FFT_Init(int *fftBitswap, complex_s *fftTrigTable)
{
	int fftIndex;
	int bit;

	for (fftIndex = 0; fftIndex < 256; fftIndex++)
	{
		fftBitswap[fftIndex] = 0;
		for (bit = 0; bit < 8; bit++)
		{
			if (fftIndex & (1 << bit))
				fftBitswap[fftIndex] |= 0x80 >> bit;
		}
		FastSinCos(fftIndex * 0.024543693f, &fftTrigTable[fftIndex].imag, &fftTrigTable[fftIndex].real);
	}
}

void FFT(complex_s *data, unsigned long log2_count, unsigned long stride, int *bitSwap, complex_s *trigTable)
{
	int count;
	int shift;
	int i;
	int j;
	unsigned int blockCount;
	unsigned int totalStride;
	int mmax;
	int iStep;
	int bitshave;
	int m;
	unsigned int k;
	unsigned int idx;
	float tempr;
	float tempi;
	complex_s temp;
	float savedRealA, savedImagA, savedRealC, savedImagC;
	complex_s *pa;
	complex_s *pb;
	float t1r;
	float t2r;
	float t1i;
	float t2i;
	float dr;
	float di;
	float cr;
	float ai;

	count = 1 << log2_count;
	shift = 8 - log2_count;
	for (i = 0; i < count; i++)
	{
		j = bitSwap[i] >> shift;
		if (j < i)
		{
			temp = data[i * stride];
			data[i * stride] = data[j * stride];
			data[j * stride] = temp;
		}
	}

	// first two passes fused into radix-4 butterflies
	pa = data;
	pb = data + stride;
	blockCount = (unsigned int)count >> 2;
	do
	{
		savedImagA = pa->imag;
		savedRealC = pa[2 * stride].real;
		savedImagC = pa[2 * stride].imag;
		savedRealA = pa->real;
		t1r = pa->real + pb->real;
		t2r = pa[2 * stride].real + pb[2 * stride].real;
		pa->real = t1r + t2r;
		pa[2 * stride].real = t1r - t2r;
		t1i = pa->imag + pb->imag;
		t2i = pa[2 * stride].imag + pb[2 * stride].imag;
		pa->imag = t1i + t2i;
		pa[2 * stride].imag = t1i - t2i;
		dr = pb->real - savedRealA;
		di = pb[2 * stride].imag - savedImagC;
		pb->real = dr - di;
		cr = pb[2 * stride].real - savedRealC;
		pb[2 * stride].real = dr + di;
		ai = pb->imag - savedImagA;
		pb->imag = cr + ai;
		pb[2 * stride].imag = ai - cr;
		pa += 4 * stride;
		pb += 4 * stride;
	} while (--blockCount);

	bitshave = 5;
	for (mmax = 4; mmax < count; mmax = iStep)
	{
		iStep = mmax * 2;
		totalStride = count * stride;
		for (m = 0; m < mmax; m++)
		{
			temp = trigTable[m << bitshave];
			for (k = m * stride; k < totalStride; k += iStep * stride)
			{
				idx = k + mmax * stride;
				tempr = temp.real * data[idx].real - temp.imag * data[idx].imag;
				tempi = temp.imag * data[idx].real + temp.real * data[idx].imag;
				data[idx].real = data[k].real - tempr;
				data[idx].imag = data[k].imag - tempi;
				data[k].real += tempr;
				data[k].imag += tempi;
			}
		}
		bitshave--;
	}
}
