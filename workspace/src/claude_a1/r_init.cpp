// Renderer initialization.
#include "a1.h"

refimport_t ri;
r_globals_t rg;
r_global_permanent_t rgp;

void R_AddCmdTouchAllImages();

void R_EndRegistration()
{
    R_AddCmdTouchAllImages();
}
