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

extern char com_token[];
extern int com_eof;

// 0x0046e280 (229 B)
char *COM_Parse(char *data)
{
	int c;
	int len = 0;
	com_token[0] = 0;

	if (!data)
		return 0;

skipwhite:
	while ((c = *data) <= ' ')
	{
		if (c == 0)
		{
			com_eof = 1;
			return 0;
		}
		data++;
	}

	if (c == '/' && data[1] == '/')
	{
		while (*data && *data != '\n')
			data++;
		goto skipwhite;
	}

	if (c == '\"')
	{
		data++;
		do
		{
			c = *data++;
			if (c == '\"')
			{
				com_token[len] = 0;
				return data;
			}
			com_token[len] = c;
			len++;
		} while (1);
	}

	if (c == '{' || c == '}' || c == ')' || c == '(' || c == '\'' || c == ':')
	{
		com_token[len] = c;
		len++;
		com_token[len] = 0;
		return data + 1;
	}

	do
	{
		com_token[len] = c;
		data++;
		len++;
		c = *data;
		if (c == '{' || c == '}' || c == ')' || c == '(' || c == '\'' || c == ':')
			break;
	} while (c > 32);

	com_token[len] = 0;
	return data;
}
