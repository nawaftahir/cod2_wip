// cmdlib.cpp: Q3Radiant common/cmdlib.c
#include <time.h>

double I_FloatTime (void)
{
	time_t	t;

	time (&t);

	return t;
}
