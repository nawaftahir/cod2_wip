#pragma once

#define FILE_HASH_SIZE 256

enum DvarType
{
	DVAR_TYPE_BOOL = 0x00,
	DVAR_TYPE_FLOAT = 0x01,
	DVAR_TYPE_VEC2 = 0x02,
	DVAR_TYPE_VEC3 = 0x03,
	DVAR_TYPE_VEC4 = 0x04,
	DVAR_TYPE_INT = 0x05,
	DVAR_TYPE_ENUM = 0x06,
	DVAR_TYPE_STRING = 0x07,
	DVAR_TYPE_COLOR = 0x08
};

union DvarLimits
{
	struct
	{
		int stringCount;
		const char **strings;
	} enumeration;
	struct
	{
		int min;
		int max;
	} integer;
	struct
	{
		float min;
		float max;
	} decimal;
};

typedef struct
{
	union
	{
		bool boolean;
		int integer;
		float decimal;
		float *vector;
		const char *string;
		unsigned char color[4];
	};
} DvarValue;

typedef struct dvar_s
{
	const char *name;
	unsigned short flags;
	unsigned char type;
	bool modified;
	DvarValue current;
	DvarValue latched;
	DvarValue reset;
	DvarLimits domain;
	dvar_s *next;
	dvar_s *hashNext;
} dvar_t;

#define DVAR_EXTERNAL (1 << 14)

extern "C" {
bool Dvar_GetBool(const char *dvarName);
int Dvar_GetInt(const char *dvarName);
float Dvar_GetFloat(const char *dvarName);
}
