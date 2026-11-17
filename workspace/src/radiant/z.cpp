#include "stdafx.h"

struct z_t
{
	int cursorx;
	int cursory;
	int width;
	int height;
	int timing;
	float origin[3];
	float scale;
};
extern z_t z;

// 0x0047aea0 (41 B)
void Z_Init(void)
{
	z.origin[0] = 0;
	z.origin[1] = 20;
	z.origin[2] = 46;
	z.scale = 1.0f;
}
