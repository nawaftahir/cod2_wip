#pragma once
#include <windows.h>

BOOL SaveRegistryInfo(const char *name, void *data, long size);
BOOL LoadRegistryInfo(const char *name, void *data, long *size);
