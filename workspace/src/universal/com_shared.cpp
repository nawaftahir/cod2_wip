#include "../qcommon/qcommon.h"
#include <time.h>

typedef struct qtime_s
{
	int tm_sec;
	int tm_min;
	int tm_hour;
	int tm_mday;
	int tm_mon;
	int tm_year;
	int tm_wday;
	int tm_yday;
	int tm_isdst;
} qtime_t;

const char *Com_StringContains( const char *str1, const char *str2, int ( *cmpFunc )( const char *, const char * ) )
{
	int len, i;

	len = strlen(str1) - strlen(str2);
	for (i = 0; i <= len; i++, str1++)
	{
		if (!cmpFunc(str1, str2))
		{
			return str1;
		}
	}
	return NULL;
}

bool Com_Filter( const char *filter, const char *name, int casesensitive )
{
	char buf[MAX_TOKEN_CHARS];
	const char *ptr;
	int i, found;

	while ( *filter )
	{
		if ( *filter == '*' )
		{
			filter++;
			for ( i = 0; *filter; i++ )
			{
				if ( *filter == '*' || *filter == '?' )
					break;
				buf[i] = *filter;
				filter++;
			}
			buf[i] = '\0';
			if ( strlen( buf ) )
			{
				ptr = Com_StringContains( name, buf, casesensitive ? I_strcmp : I_stricmp );
				if ( !ptr )
					return false;
				name = ptr + strlen( buf );
			}
		}
		else if ( *filter == '?' )
		{
			filter++;
			name++;
		}
		else if ( *filter == '[' && *(filter + 1) == '[' )
		{
			filter++;
		}
		else if ( *filter == '[' )
		{
			filter++;
			found = qfalse;
			while ( *filter && !found )
			{
				if ( *filter == ']' && *(filter + 1) != ']' )
					break;
				if ( *(filter + 1) == '-' && *(filter + 2) && ( *(filter + 2) != ']' || *(filter + 3) == ']' ) )
				{
					if ( casesensitive )
					{
						if ( *name >= *filter && *name <= *(filter + 2) )
							found = qtrue;
					}
					else
					{
						if ( toupper( *name ) >= toupper( *filter ) &&
							toupper( *name ) <= toupper( *(filter + 2) ) )
							found = qtrue;
					}
					filter += 3;
				}
				else
				{
					if ( casesensitive )
					{
						if ( *filter == *name )
							found = qtrue;
					}
					else
					{
						if ( toupper( *filter ) == toupper( *name ) )
							found = qtrue;
					}
					filter++;
				}
			}
			if ( !found )
				return false;
			while ( *filter )
			{
				if ( *filter == ']' && *(filter + 1) != ']' )
					break;
				filter++;
			}
			filter++;
			name++;
		}
		else
		{
			if ( casesensitive )
			{
				if ( *filter != *name )
					return false;
			}
			else
			{
				if ( toupper( *filter ) != toupper( *name ) )
					return false;
			}
			filter++;
			name++;
		}
	}
	return true;
}

bool Com_FilterPath( const char *filter, const char *name, int casesensitive )
{
	int i;
	char new_filter[MAX_QPATH];
	char new_name[MAX_QPATH];

	for ( i = 0; i < MAX_QPATH - 1 && filter[i]; i++ )
	{
		if ( filter[i] == '\\' || filter[i] == ':' )
		{
			new_filter[i] = '/';
		}
		else
		{
			new_filter[i] = filter[i];
		}
	}
	new_filter[i] = '\0';
	for ( i = 0; i < MAX_QPATH - 1 && name[i]; i++ )
	{
		if ( name[i] == '\\' || name[i] == ':' )
		{
			new_name[i] = '/';
		}
		else
		{
			new_name[i] = name[i];
		}
	}
	new_name[i] = '\0';
	return Com_Filter( new_filter, new_name, casesensitive );
}

int Com_HashKey( const char *string, int maxlen )
{
	register int hash, i;

	hash = 0;
	for (i = 0; i < maxlen && string[i] != '\0'; i++)
	{
		hash += string[i] * (119 + i);
	}
	hash = hash ^ (hash >> 10) ^ (hash >> 20);
	return hash;
}

int Com_RealTime( qtime_t *qtime )
{
	time_t t;
	struct tm *tms;

	t = time(NULL);
	if (!qtime)
	{
		return t;
	}
	tms = localtime(&t);
	if (tms)
	{
		qtime->tm_sec = tms->tm_sec;
		qtime->tm_min = tms->tm_min;
		qtime->tm_hour = tms->tm_hour;
		qtime->tm_mday = tms->tm_mday;
		qtime->tm_mon = tms->tm_mon;
		qtime->tm_year = tms->tm_year;
		qtime->tm_wday = tms->tm_wday;
		qtime->tm_yday = tms->tm_yday;
		qtime->tm_isdst = tms->tm_isdst;
	}
	return t;
}

qboolean Com_Memcmp(const void *src0, const void *src1, const unsigned int count)
{
	unsigned int i;

	if (count >= 16)
	{
		unsigned int *dw = (unsigned int*)(src0);
		unsigned int *sw = (unsigned int*)(src1);

		unsigned int nm2 = count/16;
		for (i = 0; i < nm2; i+=4)
		{
			unsigned int tmp = (dw[i+0]-sw[i+0])|(dw[i+1]-sw[i+1])|
						  (dw[i+2]-sw[i+2])|(dw[i+3]-sw[i+3]);
			if (tmp)
				return qfalse;
		}
	}
	if (count & 15)
	{
		byte *d = (byte*)src0;
		byte *s = (byte*)src1;
		for (i = count & 0xfffffff0; i < count; i++)
		if (d[i]!=s[i])
			return qfalse;
	}

	return qtrue;
}

float FUN_0048b730( float x, float y )
{
	return y - x >= 0.0f ? x : y;
}

int FUN_0048b760(const float *v1, const float *v2)
{
	if (v1[0] == v2[0] && v1[1] == v2[1])
		return 1;
	return 0;
}

void FUN_0048b790(const float *in, float *out)
{
	out[0] = in[0];
	out[1] = in[1];
	out[2] = in[2];
	out[3] = in[3];
}

int FUN_0048b7b0(const int *a, const int *b)
{
	return *a == *b;
}
