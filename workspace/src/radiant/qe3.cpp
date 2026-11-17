#include <stdlib.h>
#include <string.h>
#include "../universal/assertive.h"

// 0x0046cb10 (111 B)
char *FUN_0046cb10(const char *str)
{
#line 23
	assert(str);
	size_t size = strlen(str) + 1;
	char *copy = new char[size];
	memcpy(copy, str, size);
	return copy;
}
