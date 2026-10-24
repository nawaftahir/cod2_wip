// Renderer copy of a client string helper.
#include "r_local.h"
#include <string.h>

// q_parse calls this; client body (scr_stringlist.cpp). Its home TU in the renderer is not identified.
int I_strlen(const char *s)
{
    return strlen(s);
}
