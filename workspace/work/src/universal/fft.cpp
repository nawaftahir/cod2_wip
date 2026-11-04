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

#pragma optimize("y", off)
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
	float wr;
	float wi;
	float tempr;
	float tempi;
	complex_s temp;
	float savedRealA, savedImagA, savedRealC, savedImagC;
	complex_s *pa;
	complex_s *pb;
	complex_s *pc;
	complex_s *pd;
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
		pc = pa + 2 * stride;
		pd = pb + 2 * stride;
		savedRealA = pa->real;
		savedImagA = pa->imag;
		savedRealC = pc->real;
		savedImagC = pc->imag;
		t1r = pa->real + pb->real;
		t2r = pc->real + pd->real;
		pa->real = t1r + t2r;
		pc->real = t1r - t2r;
		t1i = pa->imag + pb->imag;
		t2i = pc->imag + pd->imag;
		pa->imag = t1i + t2i;
		pc->imag = t1i - t2i;
		dr = pb->real - savedRealA;
		di = pd->imag - savedImagC;
		pb->real = dr - di;
		cr = pd->real - savedRealC;
		pd->real = dr + di;
		ai = pb->imag - savedImagA;
		pb->imag = cr + ai;
		pd->imag = ai - cr;
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
			wr = trigTable[m << bitshave].real;
			wi = trigTable[m << bitshave].imag;
			for (k = m * stride; k < totalStride; k += iStep * stride)
			{
				idx = k + mmax * stride;
				tempr = wr * data[idx].real - wi * data[idx].imag;
				tempi = wi * data[idx].real + wr * data[idx].imag;
				data[idx].real = data[k].real - tempr;
				data[idx].imag = data[k].imag - tempi;
				data[k].real += tempr;
				data[k].imag += tempi;
			}
		}
		bitshave--;
	}
}
#pragma optimize("", on)
