#pragma once

extern "C" __declspec(dllimport) void __stdcall DebugBreak(void);

// the assert handler in assertive.cpp; its name is not known
int FUN_0047d980(const char *expr, const char *file, int line, int a4, int a5);

// retail keeps asserts on; each one has its own "ignore from now on" flag
#undef assert
#define assert(expr) \
	do { \
		static bool s_assertDisable; \
		if ( !(expr) && !s_assertDisable ) \
		{ \
			switch ( FUN_0047d980( #expr, __FILE__, __LINE__, 0, 1 ) ) \
			{ \
			case 0: \
				DebugBreak(); \
				break; \
			case 2: \
				s_assertDisable = true; \
				break; \
			} \
		} \
	} while ( 0 )

// assert with a message; retail formats are "%s\n\t" + fmt with the expression first
#define assertMsg(expr, fmt, a1) \
	do { \
		static bool s_assertDisable; \
		if ( !(expr) && !s_assertDisable ) \
		{ \
			switch ( FUN_0047d980( va( "%s\n\t" fmt, #expr, a1 ), __FILE__, __LINE__, 0, 1 ) ) \
			{ \
			case 0: \
				DebugBreak(); \
				break; \
			case 2: \
				s_assertDisable = true; \
				break; \
			} \
		} \
	} while ( 0 )

// Retail level-1 assertions keep the same per-site ignore state.
#define vassert(expr, fmt, a1) \
	do { \
		static bool s_assertDisable; \
		if ( !(expr) && !s_assertDisable ) \
		{ \
			switch ( FUN_0047d980( va( "%s\n\t" fmt, #expr, a1 ), __FILE__, __LINE__, 1, 1 ) ) \
			{ \
			case 0: \
				DebugBreak(); \
				break; \
			case 2: \
				s_assertDisable = true; \
				break; \
			} \
		} \
	} while ( 0 )

extern int g_assertsDisabled;

#define assertFailMsg(type, msg) \
	do { \
		static bool s_assertDisable; \
		if ( !g_assertsDisabled && !s_assertDisable ) \
		{ \
			switch ( FUN_0047d980( msg, __FILE__, __LINE__, type, 1 ) ) \
			{ \
			case 0: \
				DebugBreak(); \
				break; \
			case 2: \
				s_assertDisable = true; \
				break; \
			} \
		} \
	} while ( 0 )

// always fires unless asserts are off; type is the handler's 4th argument (1 for an unhandled switch case)
#define assertFail(type, fmt, a1) \
	do { \
		static bool s_assertDisable; \
		if ( !g_assertsDisabled && !s_assertDisable ) \
		{ \
			switch ( FUN_0047d980( va( fmt, a1 ), __FILE__, __LINE__, type, 1 ) ) \
			{ \
			case 0: \
				DebugBreak(); \
				break; \
			case 2: \
				s_assertDisable = true; \
				break; \
			} \
		} \
	} while ( 0 )
