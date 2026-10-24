#include "../qcommon/qcommon.h"
#include "com_memory.h"
#include "dvar.h"

dvar_t *sortedDvars;
int dvar_modifiedFlags;
int dvarCount;
int dvar_unreferenced;	// unreferenced storage, sized from the layout
dvar_t *dvar_cheats;
dvar_t dvarPool[MAX_DVARS];

static const char *s_dvarOffString = "off";
static const char *s_dvarOnString = "on";

static dvar_t *dvarHashTable[FILE_HASH_SIZE];
static float dvarVectorPool[12];
static unsigned int dvarVectorPoolIndex;
static bool isDvarSystemActive;
static bool isLoadingAutoExec;

static const char digitStrings[10][2] = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9" };

void Dvar_SetInAutoExec(bool inAutoExec)
{
	isLoadingAutoExec = inAutoExec;
}

bool Dvar_IsSystemActive()
{
	return isDvarSystemActive;
}

static int generateHashValue(const char *fname)
{
	int i;
	int hash;
	int letter;

	if ( !fname )
		Com_Error(ERR_DROP, "\x15" "null name in generateHashValue");

	hash = 0;
	i = 0;

	while ( fname[i] != '\0' )
	{
		letter = tolower(fname[i]);
		hash += letter * (i + 119);
		i++;
	}

	hash &= FILE_HASH_SIZE - 1;
	return hash;
}

bool Dvar_IsValidName(const char *dvarName)
{
	int index;
	char nameChar;

	if ( !dvarName )
		return false;

	for ( index = 0; dvarName[index]; ++index )
	{
		nameChar = dvarName[index];
		if ( !isalnum(nameChar) && nameChar != '_' )
			return false;
	}

	return true;
}

// temporary vectors for string conversions; the ring wraps when full
static float *Dvar_AllocVector(unsigned int componentCount)
{
	float *vector;

	if ( dvarVectorPoolIndex + componentCount > 12 )
		dvarVectorPoolIndex = 0;

	vector = &dvarVectorPool[dvarVectorPoolIndex];
	dvarVectorPoolIndex += componentCount;
	return vector;
}

// current, latched and reset share one allocation
static void Dvar_AllocVectors(dvar_t *dvar)
{
	dvar->current.vector = (float *)Z_Malloc(3 * dvar->type * sizeof(float));
	dvar->latched.vector = dvar->current.vector + dvar->type;
	dvar->reset.vector = dvar->latched.vector + dvar->type;
}

static void Dvar_FreeVectors(dvar_t *dvar)
{
	Z_Free(dvar->current.vector);
}

static void Dvar_FreeNameString(const char *name)
{
	Z_Free((void *)name);
}

// the empty string, single digits and "on"/"off" are shared constants
static const char *Dvar_InternString(const char *string)
{
	unsigned int length;

	if ( !*string )
		return "";

	length = I_strlen(string);

	if ( !string[1] )
	{
		if ( *string >= '0' && *string <= '9' )
			return digitStrings[*string - '0'];
	}
	else if ( *string == 'o' )
	{
		if ( length == 3 && string[1] == 'f' && string[2] == 'f' && !string[3] )
			return s_dvarOffString;

		if ( length == 2 && string[1] == 'n' && !string[2] )
			return s_dvarOnString;
	}

	return CopyString(string);
}

static void Dvar_FreeInternString(const char *string)
{
	if ( !*string )
		return;

	if ( !string[1] && *string >= '0' && *string <= '9' )
		return;

	if ( string == s_dvarOffString || string == s_dvarOnString )
		return;

	Z_Free((void *)string);
}

static void Dvar_FreeCurrentString(dvar_t *dvar)
{
	if ( dvar->current.string != dvar->latched.string && dvar->current.string != dvar->reset.string )
		Dvar_FreeInternString(dvar->current.string);

	dvar->current.string = NULL;
}

static void Dvar_FreeLatchedString(dvar_t *dvar)
{
	if ( dvar->latched.string != dvar->current.string && dvar->latched.string != dvar->reset.string )
		Dvar_FreeInternString(dvar->latched.string);

	dvar->latched.string = NULL;
}

static void Dvar_FreeResetString(dvar_t *dvar)
{
	if ( dvar->reset.string != dvar->current.string && dvar->reset.string != dvar->latched.string )
		Dvar_FreeInternString(dvar->reset.string);

	dvar->reset.string = NULL;
}

static void Dvar_SetCurrentStringValue(dvar_t *dvar, const char *string)
{
	if ( dvar->latched.string && (string == dvar->latched.string || !strcmp(string, dvar->latched.string)) )
		dvar->current.string = dvar->latched.string;
	else if ( dvar->reset.string && (string == dvar->reset.string || !strcmp(string, dvar->reset.string)) )
		dvar->current.string = dvar->reset.string;
	else
		dvar->current.string = Dvar_InternString(string);
}

static void Dvar_SetLatchedStringValue(dvar_t *dvar, const char *string)
{
	if ( dvar->current.string && (string == dvar->current.string || !strcmp(string, dvar->current.string)) )
		dvar->latched.string = dvar->current.string;
	else if ( dvar->reset.string && (string == dvar->reset.string || !strcmp(string, dvar->reset.string)) )
		dvar->latched.string = dvar->reset.string;
	else
		dvar->latched.string = Dvar_InternString(string);
}

static const char *Dvar_ValueToString(const dvar_t *dvar, DvarValue value)
{
	switch ( dvar->type )
	{
	case DVAR_TYPE_BOOL:
		return value.boolean ? "1" : "0";
	case DVAR_TYPE_INT:
		return va("%i", value.integer);
	case DVAR_TYPE_FLOAT:
		return va("%g", value.decimal);
	case DVAR_TYPE_VEC2:
		return va("%g %g", value.vector[0], value.vector[1]);
	case DVAR_TYPE_VEC3:
		return va("%g %g %g", value.vector[0], value.vector[1], value.vector[2]);
	case DVAR_TYPE_VEC4:
		return va("%g %g %g %g", value.vector[0], value.vector[1], value.vector[2], value.vector[3]);
	case DVAR_TYPE_COLOR:
		return va("%g %g %g %g",
		          value.color[0] * (1.0f / 255.0f), value.color[1] * (1.0f / 255.0f),
		          value.color[2] * (1.0f / 255.0f), value.color[3] * (1.0f / 255.0f));
	case DVAR_TYPE_ENUM:
		if ( !dvar->domain.enumeration.stringCount )
			return "";
		return dvar->domain.enumeration.strings[value.integer];
	case DVAR_TYPE_STRING:
		return va("%s", value.string);
	default:
		return "";
	}
}
















































































































static bool Dvar_StringToBool(const char *string)
{
	assert( string );
	return atol(string) != 0;
}


static int Dvar_StringToInt(const char *string)
{
	assert( string );
	return atol(string);
}


static float Dvar_StringToFloat(const char *string)
{
	assert( string );
	return (float)atof(string);
}

static float *Dvar_StringToVec2(const char *string)
{
	float *vector;

	vector = Dvar_AllocVector(2);
	Vector2Clear(vector);
	sscanf(string, "%g %g", &vector[0], &vector[1]);
	return vector;
}

static float *Dvar_StringToVec3(const char *string)
{
	float *vector;

	vector = Dvar_AllocVector(3);
	VectorClear(vector);
	sscanf(string, "%g %g %g", &vector[0], &vector[1], &vector[2]);
	return vector;
}

static float *Dvar_StringToVec4(const char *string)
{
	float *vector;

	vector = Dvar_AllocVector(4);
	Vector4Clear(vector);
	sscanf(string, "%g %g %g %g", &vector[0], &vector[1], &vector[2], &vector[3]);
	return vector;
}

// accepts a name, an index, or an unambiguous name prefix
static int Dvar_StringToEnum(const DvarLimits *domain, const char *string)
{
	int stringIndex;
	const char *digit;
	int len;

	for ( stringIndex = 0; stringIndex < domain->enumeration.stringCount; ++stringIndex )
	{
		if ( !stricmp(string, domain->enumeration.strings[stringIndex]) )
			return stringIndex;
	}

	stringIndex = 0;
	for ( digit = string; *digit; ++digit )
	{
		if ( *digit < '0' || *digit > '9' )
			return DVAR_INVALID_ENUM_INDEX;
		stringIndex = 10 * stringIndex + *digit - '0';
	}

	if ( stringIndex >= 0 && stringIndex < domain->enumeration.stringCount )
		return stringIndex;

	len = I_strlen(string);
	for ( stringIndex = 0; stringIndex < domain->enumeration.stringCount; ++stringIndex )
	{
		if ( !I_strnicmpInline(string, domain->enumeration.strings[stringIndex], len) )
			return stringIndex;
	}

	return DVAR_INVALID_ENUM_INDEX;
}

static void Dvar_StringToColor(const char *string, unsigned char *color)
{
	vec4_t colorVec;

	Vector4Clear(colorVec);
	sscanf(string, "%g %g %g %g", &colorVec[0], &colorVec[1], &colorVec[2], &colorVec[3]);

	color[0] = I_fround(I_fmax(0.0f, I_fmin(1.0f, colorVec[0])) * 255.0f);
	color[1] = I_fround(I_fmax(0.0f, I_fmin(1.0f, colorVec[1])) * 255.0f);
	color[2] = I_fround(I_fmax(0.0f, I_fmin(1.0f, colorVec[2])) * 255.0f);
	color[3] = I_fround(I_fmax(0.0f, I_fmin(1.0f, colorVec[3])) * 255.0f);
}

static DvarValue Dvar_StringToValue(unsigned char type, DvarLimits domain, const char *string)
{
	DvarValue value;

	switch ( type )
	{
	case DVAR_TYPE_BOOL:
		value.boolean = Dvar_StringToBool(string);
		break;
	case DVAR_TYPE_INT:
		value.integer = Dvar_StringToInt(string);
		break;
	case DVAR_TYPE_FLOAT:
		value.decimal = Dvar_StringToFloat(string);
		break;
	case DVAR_TYPE_VEC2:
		value.vector = Dvar_StringToVec2(string);
		break;
	case DVAR_TYPE_VEC3:
		value.vector = Dvar_StringToVec3(string);
		break;
	case DVAR_TYPE_VEC4:
		value.vector = Dvar_StringToVec4(string);
		break;
	case DVAR_TYPE_ENUM:
		value.integer = Dvar_StringToEnum(&domain, string);
		break;
	case DVAR_TYPE_STRING:
		value.string = string;
		break;
	case DVAR_TYPE_COLOR:
		Dvar_StringToColor(string, value.color);
		break;
	default:
		value.integer = 0;
		break;
	}

	return value;
}

static void Dvar_ClampVectorToDomain(float *vector, int components, float min, float max)
{
	int channel;

	for ( channel = 0; channel < components; channel++ )
	{
		if ( vector[channel] < min )
			vector[channel] = min;
		else if ( vector[channel] > max )
			vector[channel] = max;
	}
}

static bool Dvar_VectorInDomain(const float *vector, int components, float min, float max)
{
	int channel;

	for ( channel = 0; channel < components; channel++ )
	{
		if ( vector[channel] < min )
			return false;
		if ( vector[channel] > max )
			return false;
	}

	return true;
}

bool Dvar_ValueInDomain(unsigned char type, DvarValue value, DvarLimits domain)
{
	switch ( type )
	{
	case DVAR_TYPE_BOOL:
		return true;
	case DVAR_TYPE_INT:
		if ( value.integer < domain.integer.min )
			return false;
		if ( value.integer > domain.integer.max )
			return false;
		return true;
	case DVAR_TYPE_FLOAT:
		if ( value.decimal < domain.decimal.min )
			return false;
		if ( value.decimal > domain.decimal.max )
			return false;
		return true;
	case DVAR_TYPE_ENUM:
		return (value.integer >= 0 && value.integer < domain.enumeration.stringCount) || value.integer == 0;
	case DVAR_TYPE_VEC2:
		return Dvar_VectorInDomain(value.vector, 2, domain.decimal.min, domain.decimal.max);
	case DVAR_TYPE_VEC3:
		return Dvar_VectorInDomain(value.vector, 3, domain.decimal.min, domain.decimal.max);
	case DVAR_TYPE_VEC4:
		return Dvar_VectorInDomain(value.vector, 4, domain.decimal.min, domain.decimal.max);
	case DVAR_TYPE_STRING:
		return true;
	case DVAR_TYPE_COLOR:
		return true;
	default:
		return false;
	}
}

static void Dvar_VectorDomainToString(int components, DvarLimits domain, char *outBuffer, int outBufferLen)
{
	if ( domain.decimal.min != -FLT_MAX )
	{
		if ( domain.decimal.max != FLT_MAX )
			_snprintf(outBuffer, outBufferLen, "Domain is any %iD vector with components from %g to %g", components, domain.decimal.min, domain.decimal.max);
		else
			_snprintf(outBuffer, outBufferLen, "Domain is any %iD vector with components %g or bigger", components, domain.decimal.min);
	}
	else
	{
		if ( domain.decimal.max != FLT_MAX )
			_snprintf(outBuffer, outBufferLen, "Domain is any %iD vector with components %g or smaller", components, domain.decimal.max);
		else
			_snprintf(outBuffer, outBufferLen, "Domain is any %iD vector", components);
	}
}

static const char *Dvar_DomainToString_Internal(unsigned char type, DvarLimits domain, char *outBuffer, int outBufferLen, int *outLineCount)
{
	char *outBufferEnd;
	int charsWritten;
	int stringIndex;

	outBufferEnd = &outBuffer[outBufferLen];
	if ( outLineCount )
		*outLineCount = 0;

	switch ( type )
	{
	case DVAR_TYPE_BOOL:
		_snprintf(outBuffer, outBufferLen, "Domain is 0 or 1");
		break;
	case DVAR_TYPE_INT:
		if ( domain.integer.min != INT_MIN )
		{
			if ( domain.integer.max != INT_MAX )
				_snprintf(outBuffer, outBufferLen, "Domain is any integer from %i to %i", domain.integer.min, domain.integer.max);
			else
				_snprintf(outBuffer, outBufferLen, "Domain is any integer %i or bigger", domain.integer.min);
		}
		else
		{
			if ( domain.integer.max != INT_MAX )
				_snprintf(outBuffer, outBufferLen, "Domain is any integer %i or smaller", domain.integer.max);
			else
				_snprintf(outBuffer, outBufferLen, "Domain is any integer");
		}
		break;
	case DVAR_TYPE_FLOAT:
		if ( domain.decimal.min != -FLT_MAX )
		{
			if ( domain.decimal.max != FLT_MAX )
				_snprintf(outBuffer, outBufferLen, "Domain is any number from %g to %g", domain.decimal.min, domain.decimal.max);
			else
				_snprintf(outBuffer, outBufferLen, "Domain is any number %g or bigger", domain.decimal.min);
		}
		else
		{
			if ( domain.decimal.max != FLT_MAX )
				_snprintf(outBuffer, outBufferLen, "Domain is any number %g or smaller", domain.decimal.max);
			else
				_snprintf(outBuffer, outBufferLen, "Domain is any number");
		}
		break;
	case DVAR_TYPE_VEC2:
		Dvar_VectorDomainToString(2, domain, outBuffer, outBufferLen);
		break;
	case DVAR_TYPE_VEC3:
		Dvar_VectorDomainToString(3, domain, outBuffer, outBufferLen);
		break;
	case DVAR_TYPE_VEC4:
		Dvar_VectorDomainToString(4, domain, outBuffer, outBufferLen);
		break;
	case DVAR_TYPE_STRING:
		_snprintf(outBuffer, outBufferLen, "Domain is any text");
		break;
	case DVAR_TYPE_ENUM:
		charsWritten = _snprintf(outBuffer, outBufferEnd - outBuffer, "Domain is one of the following:");
		if ( charsWritten < 0 )
			break;

		outBuffer += charsWritten;
		for ( stringIndex = 0; stringIndex < domain.enumeration.stringCount; ++stringIndex )
		{
			charsWritten = _snprintf(outBuffer, outBufferEnd - outBuffer, "\n  %2i: %s", stringIndex, domain.enumeration.strings[stringIndex]);
			if ( charsWritten < 0 )
				break;

			if ( outLineCount )
				++*outLineCount;

			outBuffer += charsWritten;
		}
		break;
	case DVAR_TYPE_COLOR:
		_snprintf(outBuffer, outBufferLen, "Domain is any 4-component color, in RGBA format");
		break;
	default:
		*outBuffer = 0;
		break;
	}

	outBufferEnd[-1] = 0;
	return outBuffer;
}

static const char *Dvar_DomainToString(unsigned char type, DvarLimits domain, char *outBuffer, int outBufferLen)
{
	return Dvar_DomainToString_Internal(type, domain, outBuffer, outBufferLen, NULL);
}

void Dvar_PrintDomain(unsigned char type, DvarLimits domain)
{
	char domainBuffer[1024];

	Com_Printf("  %s\n", Dvar_DomainToString(type, domain, domainBuffer, sizeof(domainBuffer)));
}

static bool Dvar_ValuesEqual(unsigned char type, DvarValue val0, DvarValue val1)
{
	switch ( type )
	{
	case DVAR_TYPE_BOOL:
		return val0.boolean == val1.boolean;
	case DVAR_TYPE_INT:
		return val0.integer == val1.integer;
	case DVAR_TYPE_FLOAT:
		return val0.decimal == val1.decimal;
	case DVAR_TYPE_VEC2:
		return Vector2Compare(val0.vector, val1.vector);
	case DVAR_TYPE_VEC3:
		return VectorCompare(val0.vector, val1.vector);
	case DVAR_TYPE_VEC4:
		return Vector4Compare(val0.vector, val1.vector);
	case DVAR_TYPE_COLOR:
		return Byte4Compare(val0.color, val1.color);
	case DVAR_TYPE_ENUM:
		return val0.integer == val1.integer;
	case DVAR_TYPE_STRING:
		return strcmp(val0.string, val1.string) == 0;
	default:
		return false;
	}
}

static void Dvar_SetLatchedValue(dvar_t *dvar, DvarValue value)
{
	switch ( dvar->type )
	{
	case DVAR_TYPE_STRING:
		Dvar_FreeLatchedString(dvar);
		Dvar_SetLatchedStringValue(dvar, value.string);
		break;
	case DVAR_TYPE_VEC2:
		Vector2Copy(value.vector, dvar->latched.vector);
		break;
	case DVAR_TYPE_VEC3:
		VectorCopy(value.vector, dvar->latched.vector);
		break;
	case DVAR_TYPE_VEC4:
		VectorCopy4(value.vector, dvar->latched.vector);
		break;
	default:
		dvar->latched = value;
		break;
	}
}

bool Dvar_HasLatchedValue(const dvar_t *dvar)
{
	return !Dvar_ValuesEqual(dvar->type, dvar->current, dvar->latched);
}

bool Dvar_IsAtDefaultValue(const dvar_t *dvar)
{
	return Dvar_ValuesEqual(dvar->type, dvar->current, dvar->reset);
}

static void Dvar_SetVariant(dvar_t *dvar, DvarValue value, DvarSetSource source)
{
	Com_PrintMessage(CON_CHANNEL_LOGFILEONLY, va("      dvar set %s %s\n", dvar->name, Dvar_ValueToString(dvar, value)));

	if ( !Dvar_ValueInDomain(dvar->type, value, dvar->domain) )
	{
		Com_Printf("'%s' is not a valid value for dvar '%s'\n", Dvar_ValueToString(dvar, value), dvar->name);
		Dvar_PrintDomain(dvar->type, dvar->domain);
		if ( dvar->type == DVAR_TYPE_ENUM )
			Dvar_SetVariant(dvar, dvar->reset, source);
		return;
	}

	if ( source == DVAR_SOURCE_EXTERNAL || source == DVAR_SOURCE_SCRIPT )
	{
		if ( dvar->flags & DVAR_ROM )
		{
			Com_Printf("%s is read only.\n", dvar->name);
			return;
		}

		if ( dvar->flags & DVAR_INIT )
		{
			Com_Printf("%s is write protected.\n", dvar->name);
			return;
		}

		if ( source == DVAR_SOURCE_EXTERNAL && (dvar->flags & DVAR_CHEAT) && !dvar_cheats->current.boolean )
		{
			Com_Printf("%s is cheat protected.\n", dvar->name);
			return;
		}

		if ( dvar->flags & DVAR_LATCH )
		{
			Dvar_SetLatchedValue(dvar, value);
			if ( !Dvar_ValuesEqual(dvar->type, dvar->latched, dvar->current) )
				Com_Printf("%s will be changed upon restarting.\n", dvar->name);
			return;
		}
	}

	if ( Dvar_ValuesEqual(dvar->type, dvar->current, value) )
	{
		Dvar_SetLatchedValue(dvar, dvar->current);
		return;
	}

	dvar_modifiedFlags |= dvar->flags;

	switch ( dvar->type )
	{
	case DVAR_TYPE_STRING:
		Dvar_FreeCurrentString(dvar);
		Dvar_SetCurrentStringValue(dvar, value.string);
		Dvar_FreeLatchedString(dvar);
		dvar->latched.string = dvar->current.string;
		break;
	case DVAR_TYPE_VEC2:
		Vector2Copy(value.vector, dvar->current.vector);
		Vector2Copy(value.vector, dvar->latched.vector);
		break;
	case DVAR_TYPE_VEC3:
		VectorCopy(value.vector, dvar->current.vector);
		VectorCopy(value.vector, dvar->latched.vector);
		break;
	case DVAR_TYPE_VEC4:
		VectorCopy4(value.vector, dvar->current.vector);
		VectorCopy4(value.vector, dvar->latched.vector);
		break;
	default:
		dvar->current = value;
		dvar->latched = value;
		break;
	}

	dvar->modified = true;
}

void Dvar_Shutdown()
{
	dvar_t *dvar;

	for ( dvar = sortedDvars; dvar; dvar = dvar->next )
	{
		if ( dvar->type == DVAR_TYPE_STRING )
		{
			Dvar_FreeCurrentString(dvar);
			Dvar_FreeResetString(dvar);
			Dvar_FreeLatchedString(dvar);
		}
		else if ( dvar->type == DVAR_TYPE_VEC2 || dvar->type == DVAR_TYPE_VEC3 || dvar->type == DVAR_TYPE_VEC4 )
		{
			Dvar_FreeVectors(dvar);
		}

		if ( dvar->flags & DVAR_EXTERNAL )
			Dvar_FreeNameString(dvar->name);
	}

	dvarCount = 0;
	sortedDvars = NULL;
	dvar_cheats = NULL;
	dvar_modifiedFlags = 0;
	isDvarSystemActive = false;
	memset(dvarHashTable, 0, sizeof(dvarHashTable));
}

// turns a registered dvar back into an external string dvar



















































































































































static void Dvar_UpdateRegistration(dvar_t *dvar, const char *dvarName, unsigned char type, unsigned short flags, DvarValue resetValue, DvarLimits domain)
{
	if ( flags & DVAR_EXTERNAL )
		return;

	if ( (flags & DVAR_CHANGEABLE_RESET) && !(dvar->flags & DVAR_CHANGEABLE_RESET) )
	{
		dvar->name = dvarName;
		if ( dvar->type == DVAR_TYPE_ENUM )
			dvar->domain = domain;
	}
}

void Dvar_ClearLatchedValue(dvar_t *dvar)
{
	if ( !Dvar_HasLatchedValue(dvar) )
		return;

	Dvar_SetLatchedValue(dvar, dvar->current);
}

// tests the vec4 type, so a vec2 dvar always takes the string path





















































































































































static void Dvar_SetFromStringFromSource(dvar_t *dvar, const char *string, DvarSetSource source)
{
	DvarValue newValue;
	char buf[1024];

	Sys_EnterCriticalSection( 4 );
	I_strncpyz(buf, string, sizeof(buf));
	newValue = Dvar_StringToValue(dvar->type, dvar->domain, buf);
	if ( dvar->type == DVAR_TYPE_ENUM && newValue.integer == DVAR_INVALID_ENUM_INDEX )
	{
		Com_Printf("'%s' is not a valid value for dvar '%s'\n", buf, dvar->name);
		Dvar_PrintDomain(dvar->type, dvar->domain);
		newValue = dvar->reset;
	}

	Dvar_SetVariant(dvar, newValue, source);
	Sys_LeaveCriticalSection( 4 );
}

void Dvar_SetFromString(dvar_t *dvar, const char *string)
{
	Dvar_SetFromStringFromSource(dvar, string, DVAR_SOURCE_INTERNAL);
}

// the fallback passes byte components to a %g format unconverted

// walks the registration chain from the first pool entry










bool Dvar_AnyLatchedValues()
{
	dvar_t *dvar;

	for ( dvar = sortedDvars; dvar; dvar = dvar->next )
	{
		if ( Dvar_HasLatchedValue(dvar) )
			return true;
	}

	return false;
}

// packs "name\0value\0" pairs; a NULL buffer only measures
