/* Experimental two-body reconstruction, based on retail decomp and byte spans. */
#include <stdarg.h>
#include <stdio.h>
extern "C" void FUN_00408f20(const char *format, ...)
{
    va_list args;
    va_start(args, format);
    vprintf(format, args);
    va_end(args);
}
extern "C" void FUN_00408f40() {}
