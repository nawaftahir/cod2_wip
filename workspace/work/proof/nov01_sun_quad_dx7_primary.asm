1003aed0/494
1003aed0 sub      esp, 0x54
1003aed3 mov      eax, dword ptr [0x1072ddc8]
1003aed8 mov      ecx, dword ptr [0x101d1b9c]
1003aede fld      dword ptr [eax + 0xe8]
1003aee4 fmul     dword ptr [ecx + 0x1bc]
1003aeea push     esi
1003aeeb fld      dword ptr [eax + 0xd8]
1003aef1 push     edi
1003aef2 fmul     dword ptr [ecx + 0x1b8]
1003aef8 mov      esi, 0x10191368
1003aefd lea      edi, [esp + 0x1c]
1003af01 faddp    st(1)
1003af03 fld      dword ptr [ecx + 0x1b4]
1003af09 fmul     dword ptr [eax + 0xc8]
1003af0f faddp    st(1)
1003af11 fstp     dword ptr [esp + 0xc]
1003af15 fld      dword ptr [eax + 0xec]
1003af1b fmul     dword ptr [ecx + 0x1bc]
1003af21 fld      dword ptr [eax + 0xdc]
1003af27 fmul     dword ptr [ecx + 0x1b8]
1003af2d faddp    st(1)
1003af2f fld      dword ptr [eax + 0xcc]
1003af35 fmul     dword ptr [ecx + 0x1b4]
1003af3b faddp    st(1)
1003af3d fstp     dword ptr [esp + 0x10]
1003af41 fld      dword ptr [eax + 0xf0]
1003af47 fmul     dword ptr [ecx + 0x1bc]
1003af4d fld      dword ptr [eax + 0xe0]
1003af53 fmul     dword ptr [ecx + 0x1b8]
1003af59 faddp    st(1)
1003af5b fld      dword ptr [eax + 0xd0]
1003af61 fmul     dword ptr [ecx + 0x1b4]
1003af67 faddp    st(1)
1003af69 fstp     dword ptr [esp + 0x14]
1003af6d fld      dword ptr [eax + 0xf4]
1003af73 fmul     dword ptr [ecx + 0x1bc]
1003af79 fld      dword ptr [eax + 0xe4]
1003af7f fmul     dword ptr [ecx + 0x1b8]
1003af85 faddp    st(1)
1003af87 fld      dword ptr [eax + 0xd4]
1003af8d fmul     dword ptr [ecx + 0x1b4]
1003af93 mov      ecx, 0x10
1003af98 rep movsd dword ptr es:[edi], dword ptr [esi]
1003af9a faddp    st(1)
1003af9c fstp     dword ptr [esp + 0x18]
1003afa0 fld      dword ptr [0x1019bc78]
1003afa6 fdiv     dword ptr [esp + 0x18]
1003afaa mov      edi, dword ptr [0x10730550]
1003afb0 mov      ecx, 0x10
1003afb5 lea      esi, [esp + 0x1c]
1003afb9 fstp     dword ptr [esp + 8]
1003afbd imul     edi, edi, 0xcd0
1003afc3 fld      dword ptr [esp + 8]
1003afc7 fmul     dword ptr [esp + 0xc]
1003afcb fstp     dword ptr [esp + 0xc]
1003afcf fld      dword ptr [esp + 8]
1003afd3 add      edi, 0x1072e220
1003afd9 fmul     dword ptr [esp + 0x10]
1003afdd rep movsd dword ptr es:[edi], dword ptr [esi]
1003afdf fstp     dword ptr [esp + 0x10]
1003afe3 fld      dword ptr [esp + 8]
1003afe7 fmul     dword ptr [esp + 0x14]
1003afeb fstp     dword ptr [esp + 0x14]
1003afef call     0x1003e130
1003aff4 lea      eax, [esp + 0x1c]
1003aff8 push     eax
1003aff9 call     0x1003df90
1003affe mov      ecx, dword ptr [esp + 0x6c]
1003b002 push     ecx
1003b003 call     0x1003ac40
1003b008 mov      ecx, dword ptr [esp + 0x14]
1003b00c mov      edx, dword ptr [esp + 0x18]
1003b010 mov      esi, dword ptr [esp + 0x1c]
1003b014 mov      dword ptr [eax], ecx
1003b016 mov      dword ptr [eax + 4], edx
1003b019 mov      dword ptr [eax + 8], esi
1003b01c mov      dword ptr [eax + 0x24], ecx
1003b01f mov      dword ptr [eax + 0x28], edx
1003b022 mov      dword ptr [eax + 0x2c], esi
1003b025 add      esp, 8
1003b028 mov      dword ptr [eax + 0x48], ecx
1003b02b mov      dword ptr [eax + 0x4c], edx
1003b02e fld      dword ptr [esp + 0x60]
1003b032 mov      dword ptr [eax + 0x50], esi
1003b035 mov      dword ptr [eax + 0x74], esi
1003b038 mov      dword ptr [eax + 0x6c], ecx
1003b03b mov      dword ptr [eax + 0x70], edx
1003b03e fadd     dword ptr [eax]
1003b040 pop      edi
1003b041 pop      esi
1003b042 fstp     dword ptr [eax]
1003b044 fld      dword ptr [esp + 0x5c]
1003b048 fadd     dword ptr [eax + 4]
1003b04b fstp     dword ptr [eax + 4]
1003b04e fld      dword ptr [eax + 8]
1003b051 fsub     dword ptr [0x1019bde4]
1003b057 fstp     dword ptr [eax + 8]
1003b05a fld      dword ptr [esp + 0x58]
1003b05e fadd     dword ptr [eax + 0x24]
1003b061 fstp     dword ptr [eax + 0x24]
1003b064 fld      dword ptr [eax + 0x28]
1003b067 fsub     dword ptr [esp + 0x5c]
1003b06b fstp     dword ptr [eax + 0x28]
1003b06e fld      dword ptr [eax + 0x2c]
1003b071 fsub     dword ptr [0x1019bde4]
1003b077 fstp     dword ptr [eax + 0x2c]
1003b07a fld      dword ptr [eax + 0x48]
1003b07d fsub     dword ptr [esp + 0x58]
1003b081 fstp     dword ptr [eax + 0x48]
1003b084 fld      dword ptr [eax + 0x4c]
1003b087 fsub     dword ptr [esp + 0x5c]
1003b08b fstp     dword ptr [eax + 0x4c]
1003b08e fld      dword ptr [eax + 0x50]
1003b091 fsub     dword ptr [0x1019bde4]
1003b097 fstp     dword ptr [eax + 0x50]
1003b09a fld      dword ptr [eax + 0x6c]
1003b09d fsub     dword ptr [esp + 0x58]
1003b0a1 fstp     dword ptr [eax + 0x6c]
1003b0a4 fld      dword ptr [esp + 0x5c]
1003b0a8 fadd     dword ptr [eax + 0x70]
1003b0ab fstp     dword ptr [eax + 0x70]
1003b0ae fld      dword ptr [eax + 0x74]
1003b0b1 fsub     dword ptr [0x1019bde4]
1003b0b7 fstp     dword ptr [eax + 0x74]
1003b0ba add      esp, 0x54
1003b0bd ret      
