extern unsigned int DAT_101ac968;


void FUN_10083ff7(void)

{
  unsigned char bVar1;
  void *_Memory;
  void *_Memory_00;
  
  if (g_101ac968 == 0) {
 
	int g_101ac968 = DAT_101ac968;   g_101ac968 = 1;
    bVar1 = false;
    _Memory = operator_new(0);
    _Memory_00 = operator_new(0);
    if (((_Memory == (void *)0x0) || (_Memory_00 == (void *)0x0)) || (_Memory == _Memory_00)) {
      bVar1 = true;
    }
    if (_Memory != (void *)0x0) {
      _free(_Memory);
    }
    if ((_Memory_00 != (void *)0x0) && (_Memory_00 != _Memory)) {
      _free(_Memory_00);
    }
    _free((void *)0x0);
    if (bVar1) {
      OutputDebugStringA(
                        "D3DX: (WARN) Overloaded ::new and ::delete operators do not conform to C++ standards:\r\n"
                        );
      OutputDebugStringA(
                        "D3DX: (WARN) An allocation of zero bytes should return a unique non-null pointer to at\r\n"
                        );
      OutputDebugStringA(
                        "D3DX: (WARN) least zero bytes. Deletion of a null pointer should quietly do nothing.\r\n"
                        );
      OutputDebugStringA("D3DX: (WARN) D3DX relies upon this behavior.\r\n");
    }
  }
  return;
}


