#include "../qcommon/qcommon.h"

const vec4_t colorBlack    = { 0.0f, 0.0f, 0.0f, 1.0f };
const vec4_t colorRed      = { 1.0f, 0.0f, 0.0f, 1.0f };
const vec4_t colorGreen    = { 0.0f, 1.0f, 0.0f, 1.0f };
const vec4_t colorLtGreen  = { 0.0f, 0.7f, 0.0f, 1.0f };
const vec4_t colorBlue     = { 0.0f, 0.0f, 1.0f, 1.0f };
const vec4_t colorLtBlue   = { 0.0f, 0.0f, 0.75f, 1.0f };
const vec4_t colorYellow   = { 1.0f, 1.0f, 0.0f, 1.0f };
const vec4_t colorLtYellow = { 0.75f, 0.75f, 0.0f, 1.0f };
const vec4_t colorMdYellow = { 0.5f, 0.5f, 0.0f, 1.0f };
const vec4_t colorMagenta  = { 1.0f, 0.0f, 1.0f, 1.0f };
const vec4_t colorCyan     = { 0.0f, 1.0f, 1.0f, 1.0f };
const vec4_t colorLtCyan   = { 0.0f, 0.75f, 0.75f, 1.0f };
const vec4_t colorMdCyan   = { 0.0f, 0.5f, 0.5f, 1.0f };
const vec4_t colorDkCyan   = { 0.0f, 0.25f, 0.25f, 1.0f };
const vec4_t colorWhite    = { 1.0f, 1.0f, 1.0f, 1.0f };
const vec4_t colorLtGrey   = { 0.75f, 0.75f, 0.75f, 1.0f };
const vec4_t colorMdGrey   = { 0.5f, 0.5f, 0.5f, 1.0f };
const vec4_t colorDkGrey   = { 0.25f, 0.25f, 0.25f, 1.0f };
const vec4_t colorOrange   = { 1.0f, 0.7f, 0.0f, 1.0f };
const vec4_t colorLtOrange = { 0.75f, 0.525f, 0.0f, 1.0f };
int ColorIndex( unsigned char c )
{
	unsigned char index = (unsigned char)(c - '0');
	if ( index < 10 )
		return index;
	return 7;
}




const char *Com_GetFilenameSubString( const char *pathname )
{
	const char *last;

	last = pathname;

	while ( *pathname )
	{
		if ( *pathname == '/' )
		{
			last = pathname + 1;
		}

		pathname++;
	}

	return last;
}

void Com_AssembleFilepath( const char *folder, const char *name, const char *extension, char *path, int maxCharCount )
{
	int folderLen;
	int nameLen;
	int extensionLen;

#line 141
	assert( folder );
	assert( name );
	assert( extension );
	assert( path );
	assert( maxCharCount > 0 );
#line 67

	folderLen = strlen( folder );
	nameLen = strlen( name );
	extensionLen = strlen( extension );

	if ( folderLen + nameLen + extensionLen >= maxCharCount )
	{
		Com_Error( ERR_DROP, "filepath '%s%s%s' is longer than %i characters", folder, name, extension, maxCharCount - 1 );
	}

	memcpy( path, folder, folderLen );
	path += folderLen;
	memcpy( path, name, nameLen );
	path += nameLen;
	memcpy( path, extension, extensionLen + 1 );
}

#line 84















































































































#line 166
const char *Com_GetExtensionSubString( const char *filename )
{
	const char *substr;

	assert(filename);
	substr = NULL;
	while (*filename)
	{
		if (*filename == '.')
		{
			substr = filename;
		}
		else if (*filename == '/' || *filename == '\\')
		{
			substr = NULL;
		}
		++filename;
	}
	if (!substr)
	{
		substr = filename;
	}
	return substr;
}

void Com_StripExtension( const char *in, char *out )
{
	const char *extension;
	extension = Com_GetExtensionSubString(in);
	while (in != extension)
	{
		*out++ = *in++;
	}
	*out = 0;
}

void Com_StripFilename( const char *in, char *out )
{
	const char *filename;
	int len;

	filename = Com_GetFilenameSubString( in );
	len = filename - in;
	memcpy( out, in, len );
	out[len] = 0;
}

/* DEFERRED: calls I_strncpyz (0x00496430) which perturbs Dvar_SetFromString.
void Com_DefaultExtension( char *path, int maxSize, const char *extension )
{
	char oldPath[64];
	const char *src;

	src = path + strlen( path ) - 1;

	while ( *src != '/' && src != path )
	{
		if ( *src == '.' )
		{
			return;
		}
		src--;
	}

	I_strncpyz( oldPath, path, sizeof( oldPath ) );
	Com_sprintf( path, maxSize, "%s%s", oldPath, extension );
}
*/

#line 213
// byte order handlers, bound once by Swap_Init
static short ( *_BigShort )( short l );
static short ( *_LittleShort )( short l );
static int ( *_BigLong )( int l );
static int ( *_LittleLong )( int l );
static int64_t ( *_LittleLong64 )( int64_t l );
static float ( *_LittleFloat )( int l );
static int ( *_LittleFloatAsInt )( float l );


short BigShort( short l )
{
	return _BigShort( l );
}


int BigLong( int l )
{
	return _BigLong( l );
}


int64_t LittleLong64( int64_t l )
{
	return _LittleLong64( l );
}

// the header's inline LittleShort/LittleLong serve the engine; these go through the table
short LittleShortRuntime( short l )
{
	return _LittleShort( l );
}


int LittleLongRuntime( int l )
{
	return _LittleLong( l );
}


float LittleFloat( int l )
{
	return _LittleFloat( l );
}


int LittleFloatAsInt( float l )
{
	return _LittleFloatAsInt( l );
}


short ShortSwap( short l )
{
	byte b1, b2;

	b1 = l & 255;
	b2 = ( l >> 8 ) & 255;

	return ( b1 << 8 ) + b2;
}


short ShortNoSwap( short l )
{
	return l;
}


int LongSwap( int l )
{
	byte b1, b2, b3, b4;

	b1 = l & 255;
	b2 = ( l >> 8 ) & 255;
	b3 = ( l >> 16 ) & 255;
	b4 = ( l >> 24 ) & 255;

	return ( (int)b1 << 24 ) + ( (int)b2 << 16 ) + ( (int)b3 << 8 ) + b4;
}


int LongNoSwap( int l )
{
	return l;
}


int64_t Long64Swap( int64_t l )
{
	byte b1, b2, b3, b4, b5, b6, b7, b8;

	b1 = l;
	b2 = (uint64_t)l >> 8;
	b3 = (uint64_t)l >> 16;
	b4 = (uint64_t)l >> 24;
	b5 = (uint64_t)l >> 32;
	b6 = (uint64_t)l >> 40;
	b7 = (uint64_t)l >> 48;
	b8 = (uint64_t)l >> 56;

	return ( (uint64_t)b1 << 56 ) + ( (uint64_t)b2 << 48 ) + ( (uint64_t)b3 << 40 ) + ( (uint64_t)b4 << 32 )
	     + ( (uint64_t)b5 << 24 ) + ( (uint64_t)b6 << 16 ) + ( (uint64_t)b7 << 8 ) + b8;
}


int64_t Long64NoSwap( int64_t l )
{
	return l;
}


float FloatReadSwap( int n )
{
	union
	{
		int i;
		byte b[4];
	} dat1;
	union
	{
		float f;
		byte b[4];
	} dat2;

	dat1.i = n;
	dat2.b[0] = dat1.b[3];
	dat2.b[1] = dat1.b[2];
	dat2.b[2] = dat1.b[1];
	dat2.b[3] = dat1.b[0];
	return dat2.f;
}


float FloatReadNoSwap( int n )
{
	union
	{
		float f;
		int i;
	} u;

	u.i = n;
	return u.f;
}


int FloatWriteSwap( float f )
{
	union
	{
		float f;
		int i;
		byte b[4];
	} dat1, dat2;

	dat1.f = f;
	dat2.b[0] = dat1.b[3];
	dat2.b[1] = dat1.b[2];
	dat2.b[2] = dat1.b[1];
	dat2.b[3] = dat1.b[0];
	return dat2.i;
}


int FloatWriteNoSwap( float f )
{
	union
	{
		float f;
		int i;
	} u;

	u.f = f;
	return u.i;
}


void Swap_InitLittleEndian()
{
	_BigShort = ShortSwap;
	_LittleShort = ShortNoSwap;
	_BigLong = LongSwap;
	_LittleLong = LongNoSwap;
	_LittleLong64 = Long64NoSwap;
	_LittleFloat = FloatReadNoSwap;
	_LittleFloatAsInt = FloatWriteNoSwap;
}


void Swap_InitBigEndian()
{
	_BigShort = ShortNoSwap;
	_LittleShort = ShortSwap;
	_BigLong = LongNoSwap;
	_LittleLong = LongSwap;
	_LittleLong64 = Long64Swap;
	_LittleFloat = FloatReadSwap;
	_LittleFloatAsInt = FloatWriteSwap;
}


void Swap_Init()
{
	byte swaptest[2] = { 1, 0 };

	if ( *(short *)swaptest == 1 )
	{
		Swap_InitLittleEndian();
	}
	else
	{
		Swap_InitBigEndian();
	}
}


bool I_isprint( int c )
{
	return c >= ' ' && c <= '~';
}


bool I_islower( int c )
{
	return c >= 'a' && c <= 'z';
}


bool I_isupper( int c )
{
	return c >= 'A' && c <= 'Z';
}


bool I_isalpha( int c )
{
	return ( c >= 'a' && c <= 'z' ) || ( c >= 'A' && c <= 'Z' );
}


bool I_isdigit( int c )
{
	return c >= '0' && c <= '9';
}


bool I_isalnum( int c )
{
	return I_isalpha( c ) || I_isdigit( c );
}


bool I_isforfilename( int c )
{
	return I_isalnum( c ) || c == '_' || c == '-';
}

/*
 * I_strncpyz (0x00496430) deferred: exposing it perturbs Dvar_SetFromString (0x00490ba0).
 */

#line 478
int I_strnicmp( const char *s0, const char *s1, int n )
{
	int c0;
	int c1;

	do
	{
		c0 = *s0++;
		c1 = *s1++;

		if ( !n-- )
		{
			return 0; // strings are equal until end point
		}

		if ( c0 != c1 )
		{
			if ( I_islower( c0 ) )
			{
				c0 -= 'a' - 'A';
			}

			if ( I_islower( c1 ) )
			{
				c1 -= 'a' - 'A';
			}

			if ( c0 != c1 )
			{
				return c0 < c1 ? -1 : 1;
			}
		}
	}
	while ( c0 );

	return 0; // strings are equal
}


int I_strncmp( const char *s0, const char *s1, int n )
{
	int c0;
	int c1;

	do
	{
		c0 = *s0++;
		c1 = *s1++;

		if ( !n-- )
		{
			return 0; // strings are equal until end point
		}

		if ( c0 != c1 )
		{
			return c0 < c1 ? -1 : 1;
		}
	}
	while ( c0 );

	return 0; // strings are equal
}

































































#line 614
int I_strcmp( const char *s0, const char *s1 )
{
	assert( s0 );
	assert( s1 );
	return I_strncmp( s0, s1, 0x7FFFFFFF );
}
#line 606
int I_stricmp( const char *s0, const char *s1 )
{
	assert( s0 );
	assert( s1 );

	return I_strnicmp( s0, s1, 0x7FFFFFFF );
}

// '*' matches any run of characters, '?' any single character
int I_stricmpwild( const char *wild, const char *s )
{
	char c;
	int diff;

#line 628
	assert( wild );
	assert( s );
#line 631

	while ( 1 )
	{
		c = *wild++;
		if ( c == '*' )
		{
			if ( !*wild )
			{
				return 0;
			}
			if ( *s && !I_stricmpwild( wild - 1, s + 1 ) )
			{
				return 0;
			}
		}
		else
		{
			char cs = *s++;
			if ( c != cs && c != '?' )
			{
				diff = tolower( c ) - tolower( cs );
				if ( diff )
				{
					return ( diff < 0 ) ? -1 : 1;
				}
			}
			if ( !c )
			{
				return 0;
			}
		}
	}
}

#line 667
char *I_strlwr( char *s )
{
	char *iter;

	for ( iter = s; *iter; iter++ )
	{
		if ( I_isupper( *iter ) )
		{
			*iter += 'a' - 'A';
		}
	}

	return s;
}


char *I_strupr( char *s )
{
	char *iter;

	for ( iter = s; *iter; iter++ )
	{
		if ( I_islower( *iter ) )
		{
			*iter -= 'a' - 'A';
		}
	}

	return s;
}

/* DEFERRED: calls I_strncpyz (0x00496430) which perturbs Dvar_SetFromString.
void I_strncat( char *dest, int size, const char *src )
{
	int l1;

#line 695
	assertMsg( size != sizeof( char * ), "%s", "Chances are really high that you passed in a sizeof( pointer )" );
#line 706

	l1 = strlen( dest );
	if ( l1 >= size )
	{
		Com_Error( ERR_FATAL, "I_strncat: already overflowed" );
	}
	I_strncpyz( dest + l1, src, size - l1 );
}
*/

#line 698
// length without ^N color codes
int I_DrawStrlen( const char *str )
{
	const char *s;
	int count;

	s = str;
	count = 0;

	while ( *s )
	{
		if ( s && *s == '^' && s[1] && s[1] != '^' && s[1] >= '0' && s[1] <= '9' )
		{
			s += 2;
		}
		else
		{
			count++;
			s++;
		}
	}

	return count;
}

// maps the typographic right quote to an apostrophe












int Com_sprintf( char *dest, size_t size, const char *format, ... )
{
	int result;
	va_list argptr;

	va_start( argptr, format );
	result = _vsnprintf( dest, size, format, argptr );
	va_end( argptr );

	dest[size - 1] = 0;

	return result;
}

// false when the string lives on the current stack or in this thread's va() buffer
static char g_vaBuffer[32000];

qboolean CanKeepStringPointer( const char *string )
{
	int stackLocal;

	if ( string >= (const char *)&stackLocal && string < (const char *)&stackLocal + 0x2000 )
	{
		return qfalse;
	}
	if ( string >= g_vaBuffer && string < &g_vaBuffer[sizeof( g_vaBuffer )] )
	{
		return qfalse;
	}
	return qtrue;
}

char *va( const char *format, ... )
{
	static int index = 0;
	static char temp[32000];
	va_list argptr;
	int len;
	char *buf;

	va_start( argptr, format );
	len = _vsnprintf( temp, sizeof( temp ), format, argptr );
	va_end( argptr );
	temp[sizeof( temp ) - 1] = 0;

	if ( len < 0 || len >= (int)sizeof( temp ) )
	{
		Com_Error( ERR_DROP, "Attempted to overrun string in call to va()\n" );
	}

	if ( index + len >= (int)sizeof( g_vaBuffer ) - 1 )
	{
		index = 0;
	}

	buf = &g_vaBuffer[index];
	memcpy( buf, temp, len + 1 );
	index += len + 1;
	return buf;
}

#line 773
// narrows a little-endian UTF-16 string, keeping the high byte of each unit
void Com_WideToNarrow( const char *in, char *out, int len )
{
	int i;

	for ( i = 0; i < len; i++ )
	{
		out[i] = in[2 * i + 1];
	}

	out[len - 1] = 0;
}

// two buffers so compares work without stomping on each other
char infoValue[2][BIG_INFO_VALUE];

// searches a string of the form \key\value\key\value
const char *Info_ValueForKey( const char *s, const char *key )
{
	char pkey[BIG_INFO_KEY];
	static int valueindex = 0;
	char *dst;
	char *o;

	if ( !s || !key )
	{
		return "";
	}

	if ( strlen( s ) >= BIG_INFO_STRING )
	{
		Com_Error( ERR_DROP, "Info_ValueForKey: oversize infostring" );
	}

	valueindex ^= 1;

	if ( *s == '\\' )
	{
		s++;
	}

nextPair:
	o = pkey;

	while ( *s != '\\' )
	{
		if ( !*s )
		{
			return "";
		}

		*o++ = *s++;
	}

	*o = 0;
	s++;

	dst = infoValue[valueindex];
	o = dst;

	while ( *s != '\\' && *s )
	{
		*o++ = *s++;
	}

	*o = 0;

	if ( !I_stricmp( key, pkey ) )
	{
		return dst;
	}

	if ( !*s )
	{
		goto notFound;
	}

	s++;
	goto nextPair;

notFound:
	return "";
}

// used to iterate through all the key/value pairs in an info string
void Info_NextPair( const char **head, char *key, char *value )
{
	char *o;
	const char *s;

	s = *head;

	if ( *s == '\\' )
	{
		s++;
	}

	key[0] = 0;
	value[0] = 0;

	o = key;

	while ( *s != '\\' )
	{
		if ( !*s )
		{
			*o = 0;
			*head = s;
			return;
		}

		*o++ = *s++;
	}

	*o = 0;
	s++;

	o = value;

	while ( *s != '\\' && *s )
	{
		*o++ = *s++;
	}

	*o = 0;

	*head = s;
}

void Info_RemoveKey( char *s, const char *key )
{
	char *start;
	char pkey[MAX_INFO_KEY];
	char value[MAX_INFO_VALUE];
	char *o;

	if ( strlen( s ) >= MAX_INFO_STRING )
	{
		Com_Error( ERR_DROP, "Info_RemoveKey: oversize infostring" );
	}

	if ( strchr( key, '\\' ) )
	{
		return;
	}

nextPair:
	start = s;

	if ( *s == '\\' )
	{
		s++;
	}

	o = pkey;

	while ( *s != '\\' )
	{
		if ( !*s )
		{
			return;
		}

		*o++ = *s++;
	}

	*o = 0;
	s++;

	o = value;

	while ( *s != '\\' && *s )
	{
		if ( !*s )
		{
			return;
		}

		*o++ = *s++;
	}

	*o = 0;

	if ( !strcmp( key, pkey ) )
	{
		strcpy( start, s ); // remove this part
		return;
	}

	if ( !*s )
	{
		return;
	}

	goto nextPair;
}

void Info_RemoveKey_Big( char *s, const char *key )
{
	char *start;
	char pkey[BIG_INFO_KEY];
	char value[BIG_INFO_VALUE];
	char *o;

	if ( strlen( s ) >= BIG_INFO_STRING )
	{
		Com_Error( ERR_DROP, "Info_RemoveKey_Big: oversize infostring" );
	}

	if ( strchr( key, '\\' ) )
	{
		return;
	}

nextPair:
	start = s;

	if ( *s == '\\' )
	{
		s++;
	}

	o = pkey;

	while ( *s != '\\' )
	{
		if ( !*s )
		{
			return;
		}

		*o++ = *s++;
	}

	*o = 0;
	s++;

	o = value;

	while ( *s != '\\' && *s )
	{
		if ( !*s )
		{
			return;
		}

		*o++ = *s++;
	}

	*o = 0;

	if ( !strcmp( key, pkey ) )
	{
		strcpy( start, s ); // remove this part
		return;
	}

	if ( !*s )
	{
		return;
	}

	goto nextPair;
}

// some characters are illegal in info strings because they can mess up the server's parsing
qboolean Info_Validate( const char *s )
{
	if ( strchr( s, '\"' ) )
	{
		return qfalse;
	}

	if ( strchr( s, ';' ) )
	{
		return qfalse;
	}

	return qtrue;
}

// changes or adds a key/value pair
void Info_SetValueForKey( char *s, const char *key, const char *value )
{
	char newi[MAX_INFO_STRING];
	char cleanValue[MAX_INFO_STRING];
	int i;
	int j;
	int len;
	char c;

#line 1196
	assert( value );
#line 1067

	if ( strlen( s ) >= MAX_INFO_STRING )
	{
		Com_Printf( "Info_SetValueForKey: oversize infostring" );
		return;
	}

	j = 0;

	for ( i = 0; i < MAX_INFO_STRING - 1; i++ )
	{
		c = value[i];

		if ( !c )
		{
			break;
		}

		if ( c != '\\' && c != ';' && c != '\"' )
		{
#line 1212
			assert( j < MAX_INFO_STRING );
#line 1089
			cleanValue[j] = c;
			j++;
		}
	}

#line 1217
	assert( j < MAX_INFO_STRING );
#line 1096
	cleanValue[j] = 0;

	if ( strchr( key, '\\' ) )
	{
		Com_Printf( "Can't use keys with a \\\nkey: '%s'\nvalue: '%s'", key, value );
		return;
	}

	if ( strchr( key, ';' ) )
	{
		Com_Printf( "Can't use keys with a semicolon\nkey: '%s'\nvalue: '%s'", key, value );
		return;
	}

	if ( strchr( key, '\"' ) )
	{
		Com_Printf( "Can't use keys with a \"\nkey: '%s'\nvalue: '%s'", key, value );
		return;
	}

	Info_RemoveKey( s, key );

	if ( !cleanValue[0] )
	{
		return;
	}

	len = Com_sprintf( newi, sizeof( newi ), "\\%s\\%s", key, cleanValue );

	if ( len <= 0 )
	{
		Com_Printf( "Info buffer length exceeded, not including key/value pair in response\n" );
		return;
	}

	if ( strlen( newi ) + strlen( s ) > MAX_INFO_STRING )
	{
		Com_Printf( "Info string length exceeded\nkey: '%s'\nvalue: '%s'\nInfo string:\n%s\n", key, value, s );
		return;
	}

	strcat( s, newi );
}

void Info_SetValueForKey_Big( char *s, const char *key, const char *value )
{
	char newi[BIG_INFO_STRING];
	char cleanValue[BIG_INFO_STRING];
	int i;
	int j;
	int len;
	char c;

#line 1276
	assert( value );
#line 1150

	if ( strlen( s ) >= BIG_INFO_STRING )
	{
		Com_Printf( "Info_SetValueForKey: oversize infostring" );
		return;
	}

	j = 0;

	for ( i = 0; i < BIG_INFO_STRING - 1; i++ )
	{
		c = value[i];

		if ( !c )
		{
			break;
		}

		if ( c != '\\' && c != ';' && c != '\"' )
		{
#line 1292
			assert( j < BIG_INFO_STRING );
#line 1172
			cleanValue[j] = c;
			j++;
		}
	}

#line 1297
	assert( j < BIG_INFO_STRING );
#line 1179
	cleanValue[j] = 0;

	if ( strchr( key, '\\' ) )
	{
		Com_Printf( "Can't use keys with a \\\nkey: '%s'\nvalue: '%s'", key, value );
		return;
	}

	if ( strchr( key, ';' ) )
	{
		Com_Printf( "Can't use keys with a semicolon\nkey: '%s'\nvalue: '%s'", key, value );
		return;
	}

	if ( strchr( key, '\"' ) )
	{
		Com_Printf( "Can't use keys with a \"\nkey: '%s'\nvalue: '%s'", key, value );
		return;
	}

	Info_RemoveKey_Big( s, key );

	if ( !cleanValue[0] )
	{
		return;
	}

	len = Com_sprintf( newi, sizeof( newi ), "\\%s\\%s", key, cleanValue );

	if ( len <= 0 )
	{
		Com_Printf( "Info buffer length exceeded, not including key/value pair in response\n" );
		return;
	}

	if ( strlen( newi ) + strlen( s ) > MAX_INFO_STRING )
	{
		Com_Printf( "Info string length exceeded\nkey: '%s'\nvalue: '%s'\nInfo string:\n%s\n", key, value, s );
		return;
	}

	strcat( s, newi );
}

#line 1282



float GetLeanFraction( const float fFrac );

























struct orientation_t
{
	vec3_t origin;
	vec3_t axis[3];
};

void OrientationPosToWorld( const orientation_t *orient, const float *pos, float *out );






void OrientationDirToWorld( const orientation_t *orient, const float *dir, float *out );

























void OrientationDirToLocal( const orientation_t *orient, const float *dir, float *out );























































// Unreferenced storage; original declarations unknown (sized from the layout).
static int unusedStorage[2];

/* DEFERRED: calls I_strncpyz (0x00496430) which perturbs Dvar_SetFromString.
qboolean ParseConfigStringToStruct( unsigned char *pStruct, const cspField_t *pFieldList, int iNumFields, const char *pszBuffer, int iMaxFieldTypes,
                                    int ( *parseSpecialFieldType )( unsigned char *, const char *, const int ), void ( *parseStrCpy )( unsigned char *, const char * ) )
{
	int iField;
	const char *pszKeyValue;
	const cspField_t *pField;

	for ( iField = 0, pField = pFieldList; iField < iNumFields; iField++, pField++ )
	{
		pszKeyValue = Info_ValueForKey( pszBuffer, pField->szName );
		if ( !*pszKeyValue )
		{
			continue;
		}
		if ( pField->iFieldType < CSPFT_NUM_BASE_FIELD_TYPES )
		{
			switch ( pField->iFieldType )
			{
			case CSPFT_STRING:
				parseStrCpy( &pStruct[pField->iOffset], pszKeyValue );
				break;
			case CSPFT_STRING_MAX_STRING_CHARS:
				I_strncpyz( (char *)&pStruct[pField->iOffset], pszKeyValue, MAX_STRING_CHARS );
				break;
			case CSPFT_STRING_MAX_QPATH:
				I_strncpyz( (char *)&pStruct[pField->iOffset], pszKeyValue, MAX_QPATH );
				break;
			case CSPFT_STRING_MAX_OSPATH:
				I_strncpyz( (char *)&pStruct[pField->iOffset], pszKeyValue, MAX_OSPATH );
				break;
			case CSPFT_INT:
				*(int *)&pStruct[pField->iOffset] = atoi( pszKeyValue );
				break;
			case CSPFT_QBOOLEAN:
				*(qboolean *)&pStruct[pField->iOffset] = atoi( pszKeyValue ) != 0;
				break;
			case CSPFT_FLOAT:
				*(float *)&pStruct[pField->iOffset] = atof( pszKeyValue );
				break;
			case CSPFT_MILLISECONDS:
				*(int *)&pStruct[pField->iOffset] = (float)atof( pszKeyValue ) * 1000.0f;
				break;
			default:
				if ( pField->iFieldType < 0 )
				{
#line 1391
					assertFail( 0, "Negative field type %i given to ParseConfigStringToStruct\n", pField->iFieldType );
				}
				else
				{
#line 1393
					assertFailMsg( 0, "ParseConfigStringToStruct is out of sync with the csParseFieldType_t enum list\n" );
				}
				break;
			}
		}
		else if ( iMaxFieldTypes > 0 && pField->iFieldType < iMaxFieldTypes )
		{
#line 1398
			assert( parseSpecialFieldType != NULL );
			if ( !parseSpecialFieldType( pStruct, pszKeyValue, pField->iFieldType ) )
			{
				return qfalse;
			}
		}
		else
		{
#line 1404
			assertFail( 0, "Bad field type %i\n", pField->iFieldType );
#line 1465
			Com_Error( ERR_DROP, "Bad field type %i\n", pField->iFieldType );
		}
	}
	if ( iField != iNumFields )
	{
		return qfalse;
	}
	return qtrue;
}
*/

#line 1488



void OrientationPosToWorld( const orientation_t *orient, const float *pos, float *out )
{
	assert(pos != out);
	out[0] = orient->axis[0][0] * pos[0] + orient->axis[1][0] * pos[1] + orient->axis[2][0] * pos[2] + orient->origin[0];
	out[1] = orient->axis[0][1] * pos[0] + orient->axis[1][1] * pos[1] + orient->axis[2][1] * pos[2] + orient->origin[1];
	out[2] = orient->axis[0][2] * pos[0] + orient->axis[1][2] * pos[1] + orient->axis[2][2] * pos[2] + orient->origin[2];
}


void OrientationDirToWorld( const orientation_t *orient, const float *dir, float *out )
{
	assert(dir != out);
	out[0] = orient->axis[0][0] * dir[0] + orient->axis[1][0] * dir[1] + orient->axis[2][0] * dir[2];
	out[1] = orient->axis[0][1] * dir[0] + orient->axis[1][1] * dir[1] + orient->axis[2][1] * dir[2];
	out[2] = orient->axis[0][2] * dir[0] + orient->axis[1][2] * dir[1] + orient->axis[2][2] * dir[2];
}


void OrientationPlaneToWorld( const orientation_t *orient, const float *plane, float *out )
{
	assert(plane != out);
	OrientationDirToWorld( orient, plane, out );
	out[3] = orient->origin[0] * out[0] + orient->origin[1] * out[1] + orient->origin[2] * out[2] + plane[3];
}





void OrientationPosToLocal( const orientation_t *orient, const float *pos, float *out )
{
	assert(pos != out);
	float d[3] = {pos[0]-orient->origin[0], pos[1]-orient->origin[1], pos[2]-orient->origin[2]};
	out[0] = d[0]*orient->axis[0][0] + d[1]*orient->axis[0][1] + d[2]*orient->axis[0][2];
	out[1] = d[0]*orient->axis[1][0] + d[1]*orient->axis[1][1] + d[2]*orient->axis[1][2];
	out[2] = d[0]*orient->axis[2][0] + d[1]*orient->axis[2][1] + d[2]*orient->axis[2][2];
}






void OrientationDirToLocal( const orientation_t *orient, const float *dir, float *out )
{
	assert(dir != out);
	out[0] = dir[0]*orient->axis[0][0] + dir[1]*orient->axis[0][1] + dir[2]*orient->axis[0][2];
	out[1] = dir[0]*orient->axis[1][0] + dir[1]*orient->axis[1][1] + dir[2]*orient->axis[1][2];
	out[2] = dir[0]*orient->axis[2][0] + dir[1]*orient->axis[2][1] + dir[2]*orient->axis[2][2];
}

void OrientationConcatenate( const orientation_t *orFirst, const orientation_t *orSecond, orientation_t *out )
{
#line 1545
	assert( out != orFirst );
	assert( out != orSecond );
#line 1554
	OrientationDirToWorld( orSecond, orFirst->axis[0], out->axis[0] );
	OrientationDirToWorld( orSecond, orFirst->axis[1], out->axis[1] );
	OrientationDirToWorld( orSecond, orFirst->axis[2], out->axis[2] );
	OrientationPosToWorld( orSecond, orFirst->origin, out->origin );
}

#line 1555
void OrientationPlaneToLocal( const orientation_t *orient, const float *plane, float *out )
{
	assert(plane != out);
	OrientationDirToLocal( orient, plane, out );
	out[3] = plane[3] - (orient->origin[0] * plane[0] + orient->origin[1] * plane[1] + orient->origin[2] * plane[2]);
}

/* DEFERRED 0x00497b30 (158B): 3/3 tries mismatched at +0x46 (axis[0]*pos[0] vs axis[2]*pos[2] order)
void OrientationPosToWorldScaled( const orientation_t *orient, const float *pos, float scale, float *out )
{
#line 1565
	assert( pos != out );
#line 1578
	out[0] = scale * ( orient->axis[0][0] * pos[0] + orient->axis[1][0] * pos[1] + orient->axis[2][0] * pos[2] ) + orient->origin[0];
	out[1] = scale * ( orient->axis[0][1] * pos[0] + orient->axis[1][1] * pos[1] + orient->axis[2][1] * pos[2] ) + orient->origin[1];
	out[2] = scale * ( orient->axis[0][2] * pos[0] + orient->axis[1][2] * pos[1] + orient->axis[2][2] * pos[2] ) + orient->origin[2];
}
*/

#line 1572
void OrientationPlaneToWorldScaled( const orientation_t *orient, const float *plane, float scale, float *out )
{
	assert(plane != out);
	OrientationDirToWorld( orient, plane, out );
	out[3] = orient->origin[0] * out[0] + orient->origin[1] * out[1] + orient->origin[2] * out[2] + scale * plane[3];
}






void OrientationPosToLocalScaled( const orientation_t *orient, const float *pos, float scale, float *out )
{
	assert(pos != out);
	assert(scale);
	vec3_t d = { pos[0] - orient->origin[0], pos[1] - orient->origin[1], pos[2] - orient->origin[2] };
	scale = 1.0f / scale;
	out[0] = (d[0] * orient->axis[0][0] + d[1] * orient->axis[0][1] + d[2] * orient->axis[0][2]) * scale;
	out[1] = (d[0] * orient->axis[1][0] + d[1] * orient->axis[1][1] + d[2] * orient->axis[1][2]) * scale;
	out[2] = (d[0] * orient->axis[2][0] + d[1] * orient->axis[2][1] + d[2] * orient->axis[2][2]) * scale;
}






void OrientationPlaneToLocalScaled( const orientation_t *orient, const float *plane, float scale, float *out )
{
	assert(plane != out);
	OrientationDirToLocal( orient, plane, out );
	out[3] = (plane[3] - (orient->origin[0] * plane[0] + orient->origin[1] * plane[1] + orient->origin[2] * plane[2])) / scale;
}