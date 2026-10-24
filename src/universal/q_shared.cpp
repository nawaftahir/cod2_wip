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

const char *Com_GetExtensionSubString( const char *filename );










































void Com_StripFilename( const char *in, char *out )
{
	const char *filename;
	int len;

	filename = Com_GetFilenameSubString( in );
	len = filename - in;
	memcpy( out, in, len );
	out[len] = 0;
}

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

void I_strncpyz( char *dest, const char *src, int destsize );






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











































































































































































int I_stricmp( const char *s0, const char *s1 )
{
	assert( s0 );
	assert( s1 );

	return I_strnicmp( s0, s1, 0x7FFFFFFF );
}

// '*' matches any run of characters, '?' any single character












































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




















char *va( const char *format, ... );

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
const char *Info_ValueForKey( const char *s, const char *key );

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

void Info_RemoveKey( char *s, const char *key );



































































void Info_RemoveKey_Big( char *s, const char *key );

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
void Info_SetValueForKey( char *s, const char *key, const char *value );


































































































































































































































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
