// Direct3D call logging.
#include "a2_d3d.h"

r_logfile_globals_t r_logFileGlob;

bool RB_IsLogging()
{
    return r_logFile->current.integer && r_logFileGlob.fp;
}

void RB_LogPrint(const char *text)
{
    if (RB_IsLogging())
    {
        fprintf(r_logFileGlob.fp, "%s", text);
        fflush(r_logFileGlob.fp);
    }
}
