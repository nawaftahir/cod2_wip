#include "r_local.h"

void R_FatalInitError(const char *msg)
{
	ri.Printf(0, "********** DirectX returned an unrecoverable error code during initialization  **********\n");
	ri.Printf(0, "********** Initialization also happens while playing if DirectX loses a device **********\n");
	ri.Printf(0, "********** Consult the readme for how to continue from this problem            **********\n");
	ri.Printf(0, "\n%s\n", msg);
	ri.Sys_DirectXFatalError();
}
