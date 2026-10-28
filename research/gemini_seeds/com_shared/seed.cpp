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

