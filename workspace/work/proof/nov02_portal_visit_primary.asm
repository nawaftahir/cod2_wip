
10009cf0/167
10009cf0 mov      eax, 0x1c08
10009cf5 call     0x100f8830
10009cfa push     ebp
10009cfb push     esi
10009cfc push     0
10009cfe lea      eax, [esp + 0xc14]
10009d05 push     eax
10009d06 mov      eax, dword ptr [esp + 0x1c1c]
10009d0d lea      ecx, [esp + 0x18]
10009d11 push     ecx
10009d12 push     edi
10009d13 push     ebx
10009d14 push     edx
10009d15 push     eax
10009d16 call     0x10009bc0
10009d1b xor      ebp, ebp
10009d1d add      esp, 0x1c
10009d20 test     eax, eax
10009d22 mov      dword ptr [esp + 0xc], eax
10009d26 mov      dword ptr [esp + 8], ebp
10009d2a jle      0x10009d95
10009d2c lea      esp, [esp]
10009d30 mov      esi, dword ptr [esp + ebp*4 + 0xc10]
10009d37 push     edi
10009d38 push     ebx
10009d39 push     esi
10009d3a call     0x100092b0
10009d3f mov      al, byte ptr [0x101ce5ec]
10009d44 add      esp, 0xc
10009d47 test     al, al
10009d49 je       0x10009d88
10009d4b mov      eax, dword ptr [esi + 0x28]
10009d4e test     eax, eax
10009d50 mov      esi, dword ptr [esi + 0x2c]
10009d53 je       0x10009d88
10009d55 mov      ebp, eax
10009d57 jmp      0x10009d60
10009d59 lea      esp, [esp]
10009d60 mov      ecx, dword ptr [0x101d7e9c]
10009d66 mov      eax, dword ptr [esi]
10009d68 mov      edx, dword ptr [ecx + eax*4]
10009d6b cmp      edx, dword ptr [0x10678500]
10009d71 je       0x10009d7e
10009d73 push     edi
10009d74 mov      ecx, ebx
10009d76 call     0x100093a0
10009d7b add      esp, 4
10009d7e add      esi, 4
10009d81 dec      ebp
10009d82 jne      0x10009d60
10009d84 mov      ebp, dword ptr [esp + 8]
10009d88 mov      eax, dword ptr [esp + 0xc]
10009d8c inc      ebp
10009d8d cmp      ebp, eax
10009d8f mov      dword ptr [esp + 8], ebp
10009d93 jl       0x10009d30
10009d95 pop      esi
10009d96 pop      ebp

10009df0/547
10009df0 sub      esp, 0xc
10009df3 push     ebx
10009df4 mov      ebx, dword ptr [esp + 0x20]
10009df8 push     ebp
10009df9 mov      ebp, dword ptr [esp + 0x28]
10009dfd push     esi
10009dfe mov      esi, dword ptr [esp + 0x1c]
10009e02 push     edi
10009e03 push     ebp
10009e04 push     ebx
10009e05 push     esi
10009e06 call     0x10007aa0
10009e0b add      esp, 0xc
10009e0e push     ebp
10009e0f push     ebx
10009e10 push     esi
10009e11 call     0x100092b0
10009e16 mov      al, byte ptr [0x101ce5ec]
10009e1b add      esp, 0xc
10009e1e test     al, al
10009e20 je       0x10009e2b
10009e22 mov      edi, ebp
10009e24 mov      ecx, esi
10009e26 call     0x10009690
10009e2b mov      edx, dword ptr [esp + 0x24]
10009e2f xor      edi, edi
10009e31 cmp      edx, edi
10009e33 mov      eax, edx
10009e35 je       0x10009e4a
10009e37 mov      cl, 1
10009e39 lea      esp, [esp]
10009e40 mov      byte ptr [eax + 1], cl
10009e43 mov      eax, dword ptr [eax + 4]
10009e46 cmp      eax, edi
10009e48 jne      0x10009e40
10009e4a cmp      dword ptr [esp + 0x34], edi
10009e4e jne      0x10009e82
10009e50 mov      edx, dword ptr [esp + 0x28]
10009e54 push     esi
10009e55 mov      edi, ebp
10009e57 call     0x10009cf0
10009e5c mov      eax, dword ptr [esp + 0x28]
10009e60 xor      ecx, ecx
10009e62 add      esp, 4
10009e65 cmp      eax, ecx
10009e67 je       0x1000a00b
10009e6d lea      ecx, [ecx]
10009e70 mov      byte ptr [eax + 1], cl
10009e73 mov      eax, dword ptr [eax + 4]
10009e76 cmp      eax, ecx
10009e78 jne      0x10009e70
10009e7a pop      edi
10009e7b pop      esi
10009e7c pop      ebp
10009e7d pop      ebx
10009e7e add      esp, 0xc
10009e81 ret      
10009e82 cmp      dword ptr [esi + 0x20], edi
10009e85 mov      dword ptr [esp + 0x18], edi
10009e89 jle      0x10009ff6
10009e8f mov      dword ptr [esp + 0x14], edi
10009e93 mov      ebx, dword ptr [esi + 0x24]
10009e96 mov      ecx, dword ptr [esp + 0x14]
10009e9a mov      al, byte ptr [ebx + ecx + 1]
10009e9e add      ebx, ecx
10009ea0 test     al, al
10009ea2 jne      0x10009fcf
10009ea8 fld      dword ptr [0x101ce5d4]
10009eae lea      esi, [ebx + 8]
10009eb1 fmul     dword ptr [esi + 4]
10009eb4 fld      dword ptr [0x101ce5d8]
10009eba fmul     dword ptr [esi + 8]
10009ebd faddp    st(1)
10009ebf fld      dword ptr [0x101ce5dc]
10009ec5 fmul     dword ptr [esi + 0xc]
10009ec8 faddp    st(1)
10009eca fld      dword ptr [0x101ce5d0]
10009ed0 fmul     dword ptr [esi]
10009ed2 faddp    st(1)
10009ed4 fcomp    dword ptr [0x1019bc84]
10009eda fnstsw   ax
10009edc test     ah, 0x41
10009edf je       0x10009fcf
10009ee5 mov      edi, dword ptr [esp + 0x2c]
10009ee9 mov      ecx, ebp
10009eeb mov      edx, edi
10009eed mov      eax, ebx
10009eef call     0x10007e10
10009ef4 test     al, al
10009ef6 jne      0x10009fcf
10009efc call     0x10009700
10009f01 test     al, al
10009f03 jne      0x10009fcf
10009f09 fld      dword ptr [0x1019bc84]
10009f0f fld      dword ptr [0x101ce5dc]
10009f15 fucompp  
10009f17 fnstsw   ax
10009f19 test     ah, 0x44
10009f1c jnp      0x10009f91
10009f1e fld      dword ptr [0x101ce5d4]
10009f24 fmul     dword ptr [esi + 4]
10009f27 fld      dword ptr [0x101ce5d8]
10009f2d fmul     dword ptr [esi + 8]
10009f30 faddp    st(1)
10009f32 fld      dword ptr [0x101ce5dc]
10009f38 fmul     dword ptr [esi + 0xc]
10009f3b faddp    st(1)
10009f3d fld      dword ptr [0x101ce5d0]
10009f43 fmul     dword ptr [esi]
10009f45 faddp    st(1)
10009f47 fcomp    dword ptr [0x1019bf38]
10009f4d fnstsw   ax
10009f4f test     ah, 0x41
10009f52 jne      0x10009f91
10009f54 movzx    eax, byte ptr [ebx + 0x24]
10009f58 mov      edi, dword ptr [ebx + 0x20]
10009f5b push     0x101ce5d0
10009f60 push     eax
10009f61 mov      ecx, esi
10009f63 call     0x1005d800
10009f68 add      esp, 8
10009f6b test     eax, eax
10009f6d je       0x10009fcf
10009f6f mov      ecx, dword ptr [esp + 0x34]
10009f73 mov      edx, dword ptr [esp + 0x2c]
10009f77 mov      eax, dword ptr [ebx + 0x1c]
10009f7a push     ecx
10009f7b push     ebp
10009f7c push     edx
10009f7d push     esi
10009f7e push     ebx
10009f7f push     eax
10009f80 mov      dword ptr [ebx + 4], 0
10009f87 call     0x10009df0
10009f8c add      esp, 0x18
10009f8f jmp      0x10009fcf
10009f91 mov      ecx, dword ptr [esp + 0x28]
10009f95 push     ecx
10009f96 mov      edx, edi
10009f98 mov      ecx, ebp
10009f9a mov      edi, ebx
10009f9c call     0x10009b30
10009fa1 add      esp, 4
10009fa4 test     al, al
10009fa6 je       0x10009fcf
10009fa8 cmp      byte ptr [ebx], 0
10009fab jne      0x10009fbf
10009fad mov      edx, dword ptr [esp + 0x24]
10009fb1 push     ebx
10009fb2 mov      dword ptr [ebx + 4], edx
10009fb5 call     0x10009770
10009fba add      esp, 4
10009fbd jmp      0x10009fcf
10009fbf mov      eax, dword ptr [esp + 0x24]
10009fc3 cmp      dword ptr [ebx + 4], eax
10009fc6 je       0x10009fcf
10009fc8 mov      dword ptr [ebx + 4], 0
10009fcf mov      eax, dword ptr [esp + 0x18]
10009fd3 mov      edx, dword ptr [esp + 0x14]
10009fd7 mov      esi, dword ptr [esp + 0x20]
10009fdb mov      ecx, dword ptr [esi + 0x20]
10009fde inc      eax
10009fdf add      edx, 0x44
10009fe2 cmp      eax, ecx
10009fe4 mov      dword ptr [esp + 0x18], eax
10009fe8 mov      dword ptr [esp + 0x14], edx
10009fec jl       0x10009e93
10009ff2 mov      edx, dword ptr [esp + 0x24]
10009ff6 test     edx, edx
10009ff8 mov      eax, edx
10009ffa je       0x1000a00b
10009ffc lea      esp, [esp]
1000a000 mov      byte ptr [eax + 1], 0
1000a004 mov      eax, dword ptr [eax + 4]
1000a007 test     eax, eax
1000a009 jne      0x1000a000
1000a00b pop      edi
1000a00c pop      esi
1000a00d pop      ebp
1000a00e pop      ebx
1000a00f add      esp, 0xc
1000a012 ret      

1000a020/919
1000a020 sub      esp, 0xe5c
1000a026 push     ebx
1000a027 push     ebp
1000a028 push     esi
1000a029 push     edi
1000a02a push     0x20000
1000a02f call     dword ptr [0x101d4a10]
1000a035 mov      edi, eax
1000a037 add      esp, 4
1000a03a push     edi
1000a03b mov      dword ptr [esp + 0x20], edi
1000a03f call     dword ptr [0x101d4a18]
1000a045 add      esp, 4
1000a048 mov      ecx, eax
1000a04a mov      esi, 0xff
1000a04f nop      
1000a050 dec      esi
1000a051 lea      edx, [ecx + 0x200]
1000a057 mov      dword ptr [ecx], edx
1000a059 mov      ecx, edx
1000a05b jne      0x1000a050
1000a05d mov      ecx, dword ptr [esp + 0xe7c]
1000a064 mov      edx, dword ptr [esp + 0xe78]
1000a06b xor      ebx, ebx
1000a06d mov      dword ptr [eax + 0x1fe00], ebx
1000a073 push     1
1000a075 push     ecx
1000a076 mov      ecx, dword ptr [esp + 0xe78]
1000a07d mov      dword ptr [0x101ce5e8], eax
1000a082 lea      eax, [esp + 0x670]
1000a089 push     edx
1000a08a mov      dword ptr [0x101ce5e4], eax
1000a08f mov      eax, dword ptr [esp + 0xe80]
1000a096 push     eax
1000a097 push     ebx
1000a098 push     ecx
1000a099 mov      dword ptr [0x101ce5e0], ebx
1000a09f call     0x10009df0
1000a0a4 mov      eax, dword ptr [0x101ce5e0]
1000a0a9 add      esp, 0x18
1000a0ac xor      ebp, ebp
1000a0ae cmp      eax, ebx
1000a0b0 je       0x1000a363
1000a0b6 call     0x10009820
1000a0bb mov      esi, eax
1000a0bd movzx    edi, byte ptr [esi + 0x25]
1000a0c1 mov      ecx, dword ptr [esi + 0x28]
1000a0c4 lea      edx, [esp + 0x28]
1000a0c8 push     edx
1000a0c9 push     edi
1000a0ca call     0x10057a40
1000a0cf lea      eax, [esp + 0x30]
1000a0d3 push     eax
1000a0d4 add      edi, -2
1000a0d7 push     edi
1000a0d8 mov      eax, ecx
1000a0da call     0x10057f10
1000a0df mov      ecx, dword ptr [0x101ce5e8]
1000a0e5 mov      edi, eax
1000a0e7 mov      eax, dword ptr [esi + 0x28]
1000a0ea mov      dword ptr [eax], ecx
1000a0ec add      esp, 0x10
1000a0ef cmp      edi, ebx
1000a0f1 mov      dword ptr [0x101ce5e8], eax
1000a0f6 mov      dword ptr [esi + 0x28], ebx
1000a0f9 je       0x1000a353
1000a0ff mov      edx, dword ptr [0x101ce68c]
1000a105 mov      eax, dword ptr [edx + 8]
1000a108 inc      ebp
1000a109 cmp      ebp, eax
1000a10b mov      dword ptr [esp + 0x20], ebp
1000a10f je       0x1000a378
1000a115 fld      dword ptr [esi + 0x14]
1000a118 lea      ebp, [esi + 8]
1000a11b fchs     
1000a11d xor      ecx, ecx
1000a11f cmp      edi, 4
1000a122 fld      st(0)
1000a124 fmul     dword ptr [ebp]
1000a127 fstp     dword ptr [esp + 0x10]
1000a12b fld      st(0)
1000a12d fmul     dword ptr [ebp + 4]
1000a130 fstp     dword ptr [esp + 0x14]
1000a134 fmul     dword ptr [ebp + 8]
1000a137 fstp     dword ptr [esp + 0x18]
1000a13b jl       0x1000a27f
1000a141 lea      edx, [edi - 3]
1000a144 lea      eax, [esp + 0x370]
1000a14b jmp      0x1000a150
1000a14d lea      ecx, [ecx]
1000a150 fld      dword ptr [esp + ecx*8 + 0x28]
1000a154 fld      st(0)
1000a156 fmul     dword ptr [esi + 0x2c]
1000a159 fadd     dword ptr [esp + 0x10]
1000a15d fstp     dword ptr [eax - 8]
1000a160 fld      st(0)
1000a162 fmul     dword ptr [esi + 0x30]
1000a165 fadd     dword ptr [esp + 0x14]
1000a169 fstp     dword ptr [eax - 4]
1000a16c fmul     dword ptr [esi + 0x34]
1000a16f fadd     dword ptr [esp + 0x18]
1000a173 fstp     dword ptr [eax]
1000a175 fld      dword ptr [esp + ecx*8 + 0x2c]
1000a179 fld      st(0)
1000a17b fmul     dword ptr [esi + 0x38]
1000a17e fadd     dword ptr [eax - 8]
1000a181 fstp     dword ptr [eax - 8]
1000a184 fld      st(0)
1000a186 fmul     dword ptr [esi + 0x3c]
1000a189 fadd     dword ptr [eax - 4]
1000a18c fstp     dword ptr [eax - 4]
1000a18f fmul     dword ptr [esi + 0x40]
1000a192 fadd     dword ptr [eax]
1000a194 fstp     dword ptr [eax]
1000a196 fld      dword ptr [esp + ecx*8 + 0x30]
1000a19a fld      st(0)
1000a19c fmul     dword ptr [esi + 0x2c]
1000a19f fadd     dword ptr [esp + 0x10]
1000a1a3 fstp     dword ptr [eax + 4]
1000a1a6 fld      st(0)
1000a1a8 fmul     dword ptr [esi + 0x30]
1000a1ab fadd     dword ptr [esp + 0x14]
1000a1af fstp     dword ptr [eax + 8]
1000a1b2 fmul     dword ptr [esi + 0x34]
1000a1b5 fadd     dword ptr [esp + 0x18]
1000a1b9 fstp     dword ptr [eax + 0xc]
1000a1bc fld      dword ptr [esp + ecx*8 + 0x34]
1000a1c0 fld      st(0)
1000a1c2 fmul     dword ptr [esi + 0x38]
1000a1c5 fadd     dword ptr [eax + 4]
1000a1c8 fstp     dword ptr [eax + 4]
1000a1cb fld      st(0)
1000a1cd fmul     dword ptr [esi + 0x3c]
1000a1d0 fadd     dword ptr [eax + 8]
1000a1d3 fstp     dword ptr [eax + 8]
1000a1d6 fmul     dword ptr [esi + 0x40]
1000a1d9 fadd     dword ptr [eax + 0xc]
1000a1dc fstp     dword ptr [eax + 0xc]
1000a1df fld      dword ptr [esp + ecx*8 + 0x38]
1000a1e3 fld      st(0)
1000a1e5 fmul     dword ptr [esi + 0x2c]
1000a1e8 fadd     dword ptr [esp + 0x10]
1000a1ec fstp     dword ptr [eax + 0x10]
1000a1ef fld      st(0)
1000a1f1 fmul     dword ptr [esi + 0x30]
1000a1f4 fadd     dword ptr [esp + 0x14]
1000a1f8 fstp     dword ptr [eax + 0x14]
1000a1fb fmul     dword ptr [esi + 0x34]
1000a1fe fadd     dword ptr [esp + 0x18]
1000a202 fstp     dword ptr [eax + 0x18]
1000a205 fld      dword ptr [esp + ecx*8 + 0x3c]
1000a209 fld      st(0)
1000a20b fmul     dword ptr [esi + 0x38]
1000a20e fadd     dword ptr [eax + 0x10]
1000a211 fstp     dword ptr [eax + 0x10]
1000a214 fld      st(0)
1000a216 fmul     dword ptr [esi + 0x3c]
1000a219 fadd     dword ptr [eax + 0x14]
1000a21c fstp     dword ptr [eax + 0x14]
1000a21f fmul     dword ptr [esi + 0x40]
1000a222 fadd     dword ptr [eax + 0x18]
1000a225 fstp     dword ptr [eax + 0x18]
1000a228 fld      dword ptr [esp + ecx*8 + 0x40]
1000a22c fld      st(0)
1000a22e fmul     dword ptr [esi + 0x2c]
1000a231 fadd     dword ptr [esp + 0x10]
1000a235 fstp     dword ptr [eax + 0x1c]
1000a238 fld      st(0)
1000a23a fmul     dword ptr [esi + 0x30]
1000a23d fadd     dword ptr [esp + 0x14]
1000a241 fstp     dword ptr [eax + 0x20]
1000a244 fmul     dword ptr [esi + 0x34]
1000a247 add      ecx, 4
1000a24a add      eax, 0x30
1000a24d cmp      ecx, edx
1000a24f fadd     dword ptr [esp + 0x18]
1000a253 fstp     dword ptr [eax - 0xc]
1000a256 fld      dword ptr [esp + ecx*8 + 0x24]
1000a25a fld      st(0)
1000a25c fmul     dword ptr [esi + 0x38]
1000a25f fadd     dword ptr [eax - 0x14]
1000a262 fstp     dword ptr [eax - 0x14]
1000a265 fld      st(0)
1000a267 fmul     dword ptr [esi + 0x3c]
1000a26a fadd     dword ptr [eax - 0x10]
1000a26d fstp     dword ptr [eax - 0x10]
1000a270 fmul     dword ptr [esi + 0x40]
1000a273 fadd     dword ptr [eax - 0xc]
1000a276 fstp     dword ptr [eax - 0xc]
1000a279 jl       0x1000a150
1000a27f cmp      ecx, edi
1000a281 jge      0x1000a2e1
1000a283 lea      eax, [ecx + ecx*2]
1000a286 lea      eax, [esp + eax*4 + 0x370]
1000a28d lea      ecx, [ecx]
1000a290 fld      dword ptr [esp + ecx*8 + 0x28]
1000a294 inc      ecx
1000a295 fld      st(0)
1000a297 add      eax, 0xc
1000a29a cmp      ecx, edi
1000a29c fmul     dword ptr [esi + 0x2c]
1000a29f fadd     dword ptr [esp + 0x10]
1000a2a3 fstp     dword ptr [eax - 0x14]
1000a2a6 fld      st(0)
1000a2a8 fmul     dword ptr [esi + 0x30]
1000a2ab fadd     dword ptr [esp + 0x14]
1000a2af fstp     dword ptr [eax - 0x10]
1000a2b2 fmul     dword ptr [esi + 0x34]
1000a2b5 fadd     dword ptr [esp + 0x18]
1000a2b9 fstp     dword ptr [eax - 0xc]
1000a2bc fld      dword ptr [esp + ecx*8 + 0x24]
1000a2c0 fld      st(0)
1000a2c2 fmul     dword ptr [esi + 0x38]
1000a2c5 fadd     dword ptr [eax - 0x14]
1000a2c8 fstp     dword ptr [eax - 0x14]
1000a2cb fld      st(0)
1000a2cd fmul     dword ptr [esi + 0x3c]
1000a2d0 fadd     dword ptr [eax - 0x10]
1000a2d3 fstp     dword ptr [eax - 0x10]
1000a2d6 fmul     dword ptr [esi + 0x40]
1000a2d9 fadd     dword ptr [eax - 0xc]
1000a2dc fstp     dword ptr [eax - 0xc]
1000a2df jl       0x1000a290
1000a2e1 mov      eax, dword ptr [0x101ce6e0]
1000a2e6 cmp      dword ptr [eax + 8], ebx
1000a2e9 je       0x1000a31a
1000a2eb mov      ecx, dword ptr [0x101ce80c]
1000a2f1 cmp      byte ptr [ecx + 8], bl
1000a2f4 jne      0x1000a31a
1000a2f6 mov      ebx, dword ptr [0x101da9c8]
1000a2fc lea      edx, [esp + 0x368]
1000a303 push     edx
1000a304 push     edi
1000a305 add      ebx, 0x249d18
1000a30b mov      eax, 0x10192528
1000a310 call     0x10005440
1000a315 add      esp, 8
1000a318 xor      ebx, ebx
1000a31a lea      eax, [esp + 0x228]
1000a321 push     edi
1000a322 push     eax
1000a323 lea      eax, [esp + 0x2c]
1000a327 lea      ecx, [esp + 0x370]
1000a32e call     0x10007430
1000a333 mov      ecx, dword ptr [esp + 0x2c]
1000a337 push     ecx
1000a338 push     eax
1000a339 mov      eax, dword ptr [esi + 0x1c]
1000a33c lea      edx, [esp + 0x238]
1000a343 push     edx
1000a344 push     ebp
1000a345 push     esi
1000a346 push     eax
1000a347 call     0x10009df0
1000a34c mov      ebp, dword ptr [esp + 0x40]
1000a350 add      esp, 0x20
1000a353 cmp      dword ptr [0x101ce5e0], ebx
1000a359 jne      0x1000a0b6
1000a35f mov      edi, dword ptr [esp + 0x1c]
1000a363 push     edi
1000a364 call     dword ptr [0x101d4a14]
1000a36a add      esp, 4
1000a36d pop      edi
1000a36e pop      esi
1000a36f pop      ebp
1000a370 pop      ebx
1000a371 add      esp, 0xe5c
1000a377 ret      
1000a378 cmp      dword ptr [0x101ce5e0], ebx
1000a37e je       0x1000a3a1
1000a380 call     0x10009820
1000a385 mov      ecx, dword ptr [eax + 0x28]
1000a388 mov      edx, dword ptr [0x101ce5e8]
1000a38e mov      dword ptr [ecx], edx
1000a390 mov      dword ptr [0x101ce5e8], ecx
1000a396 mov      dword ptr [eax + 0x28], ebx
1000a399 cmp      dword ptr [0x101ce5e0], ebx
1000a39f jne      0x1000a380
1000a3a1 mov      eax, dword ptr [esp + 0x1c]
1000a3a5 push     eax
1000a3a6 call     dword ptr [0x101d4a14]
1000a3ac add      esp, 4
1000a3af pop      edi
1000a3b0 pop      esi
1000a3b1 pop      ebp
1000a3b2 pop      ebx

1000a680/248
1000a680 sub      esp, 8
1000a683 push     ebx
1000a684 push     ebp
1000a685 mov      ebp, dword ptr [esp + 0x14]
1000a689 push     esi
1000a68a push     edi
1000a68b mov      edi, eax
1000a68d push     ebp
1000a68e mov      ebx, edi
1000a690 mov      esi, ecx
1000a692 call     0x10009250
1000a697 mov      eax, dword ptr [0x101ce78c]
1000a69c mov      cl, byte ptr [eax + 8]
1000a69f xor      ebx, ebx
1000a6a1 add      esp, 4
1000a6a4 cmp      cl, bl
1000a6a6 jne      0x1000a770
1000a6ac cmp      esi, ebx
1000a6ae jl       0x1000a70f
1000a6b0 mov      ecx, dword ptr [0x101d1b9c]
1000a6b6 imul     esi, esi, 0x3c
1000a6b9 add      esi, dword ptr [ecx + 0x100]
1000a6bf mov      edx, dword ptr [0x101ce664]
1000a6c5 cmp      byte ptr [edx + 8], bl
1000a6c8 push     edi
1000a6c9 push     ebp
1000a6ca je       0x1000a6f9
1000a6cc push     esi
1000a6cd mov      dword ptr [0x101ce5b4], ebx
1000a6d3 call     0x100092b0
1000a6d8 mov      al, byte ptr [0x101ce5ec]
1000a6dd add      esp, 0xc
1000a6e0 cmp      al, bl
1000a6e2 je       0x1000a770
1000a6e8 mov      ebx, ebp
1000a6ea mov      ecx, esi
1000a6ec call     0x10009690
1000a6f1 pop      edi
1000a6f2 pop      esi
1000a6f3 pop      ebp
1000a6f4 pop      ebx
1000a6f5 add      esp, 8
1000a6f8 ret      
1000a6f9 push     0x101ce588
1000a6fe push     esi
1000a6ff call     0x1000a020
1000a704 add      esp, 0x10
1000a707 pop      edi
1000a708 pop      esi
1000a709 pop      ebp
1000a70a pop      ebx
1000a70b add      esp, 8
1000a70e ret      
1000a70f mov      eax, dword ptr [0x101d1b9c]
1000a714 cmp      dword ptr [eax + 0xfc], ebx
1000a71a mov      dword ptr [esp + 0x14], ebx
1000a71e jle      0x1000a770
1000a720 mov      dword ptr [esp + 0x10], ebx
1000a724 mov      esi, dword ptr [eax + 0x100]
1000a72a mov      ecx, dword ptr [esp + 0x10]
1000a72e push     edi
1000a72f add      esi, ecx
1000a731 push     ebp
1000a732 push     esi
1000a733 call     0x100092b0
1000a738 mov      al, byte ptr [0x101ce5ec]
1000a73d add      esp, 0xc
1000a740 test     al, al
1000a742 je       0x1000a74d
1000a744 mov      ebx, ebp
1000a746 mov      ecx, esi
1000a748 call     0x10009690
1000a74d mov      ecx, dword ptr [esp + 0x14]
1000a751 mov      esi, dword ptr [esp + 0x10]
1000a755 mov      eax, dword ptr [0x101d1b9c]
1000a75a mov      edx, dword ptr [eax + 0xfc]
1000a760 inc      ecx
1000a761 add      esi, 0x3c
1000a764 cmp      ecx, edx
1000a766 mov      dword ptr [esp + 0x14], ecx
1000a76a mov      dword ptr [esp + 0x10], esi
1000a76e jl       0x1000a724
1000a770 pop      edi
1000a771 pop      esi
1000a772 pop      ebp
1000a773 pop      ebx
1000a774 add      esp, 8
1000a777 ret      

1000a780/72
1000a780 mov      eax, dword ptr [0x101ce5b4]
1000a785 test     eax, eax
1000a787 je       0x1000a7c7
1000a789 mov      eax, dword ptr [0x101d1b9c]
1000a78e mov      ecx, dword ptr [eax + 0x18]
1000a791 push     esi
1000a792 xor      esi, esi
1000a794 test     ecx, ecx
1000a796 jle      0x1000a7c6
1000a798 push     ebx
1000a799 push     ebp
1000a79a mov      ebp, dword ptr [esp + 0x14]
1000a79e push     edi
1000a79f dec      ebp
1000a7a0 mov      ecx, dword ptr [esp + 0x14]
1000a7a4 mov      edx, dword ptr [eax + 0x1c]
1000a7a7 mov      edi, dword ptr [edx + esi*4]
1000a7aa push     ebp
1000a7ab push     ecx
1000a7ac xor      ebx, ebx
1000a7ae call     0x100080d0
1000a7b3 mov      eax, dword ptr [0x101d1b9c]
1000a7b8 mov      ecx, dword ptr [eax + 0x18]
1000a7bb add      esp, 8
1000a7be inc      esi
1000a7bf cmp      esi, ecx
1000a7c1 jl       0x1000a7a0
1000a7c3 pop      edi
1000a7c4 pop      ebp
1000a7c5 pop      ebx
1000a7c6 pop      esi
1000a7c7 ret      

10006be0/446
10006be0 mov      ecx, dword ptr [esp + 8]
10006be4 sub      esp, 0xac
10006bea push     ebx
10006beb xor      ebx, ebx
10006bed test     ecx, ecx
10006bef jle      0x10006d96
10006bf5 push     ebp
10006bf6 lea      ebp, [esp + 0x14]
10006bfa sub      ebp, edx
10006bfc push     esi
10006bfd mov      esi, dword ptr [esp + 0xbc]
10006c04 mov      dword ptr [esp + 0x10], ebp
10006c08 push     edi
10006c09 lea      edi, [esp + 0x20]
10006c0d lea      ebp, [esp + 0x20]
10006c11 add      esi, 8
10006c14 sub      ebp, edx
10006c16 mov      dword ptr [esp + 0x10], edi
10006c1a mov      dword ptr [esp + 0x18], ebp
10006c1e mov      ebp, dword ptr [esp + 0x10]
10006c22 lea      ecx, [edx + 4]
10006c25 lea      edi, [edx + 8]
10006c28 test     bl, 1
10006c2b je       0x10006c35
10006c2d fld      dword ptr [0x1019bc78]
10006c33 jmp      0x10006c3b
10006c35 fld      dword ptr [0x1019bda0]
10006c3b fld      st(0)
10006c3d mov      edx, ebx
10006c3f shr      edx, 1
10006c41 and      edx, 1
10006c44 fmul     dword ptr [eax + edx*4]
10006c47 fadd     dword ptr [eax + 0xc]
10006c4a fstp     dword ptr [ebp - 4]
10006c4d fld      dword ptr [esi - 4]
10006c50 fmul     dword ptr [eax + 4]
10006c53 fld      dword ptr [eax + 0xc]
10006c56 fmul     dword ptr [esi + 4]
10006c59 faddp    st(1)
10006c5b fld      dword ptr [eax]
10006c5d fmul     dword ptr [esi - 8]
10006c60 faddp    st(1)
10006c62 fld      dword ptr [esi]
10006c64 fmul     dword ptr [eax + 8]
10006c67 faddp    st(1)
10006c69 fstp     dword ptr [edi - 8]
10006c6c fld      st(0)
10006c6e fmul     dword ptr [eax + edx*4 + 0x10]
10006c72 fadd     dword ptr [eax + 0x1c]
10006c75 fstp     dword ptr [ebp]
10006c78 mov      ebp, dword ptr [esp + 0x14]
10006c7c fld      dword ptr [eax + 0x1c]
10006c7f fmul     dword ptr [esi + 4]
10006c82 fld      dword ptr [eax + 0x14]
10006c85 fmul     dword ptr [esi - 4]
10006c88 faddp    st(1)
10006c8a fld      dword ptr [eax + 0x18]
10006c8d fmul     dword ptr [esi]
10006c8f faddp    st(1)
10006c91 fld      dword ptr [eax + 0x10]
10006c94 fmul     dword ptr [esi - 8]
10006c97 faddp    st(1)
10006c99 fstp     dword ptr [edi - 4]
10006c9c fld      st(0)
10006c9e fmul     dword ptr [eax + edx*4 + 0x20]
10006ca2 fadd     dword ptr [eax + 0x2c]
10006ca5 fstp     dword ptr [edi + ebp]
10006ca8 fld      dword ptr [eax + 0x2c]
10006cab fmul     dword ptr [esi + 4]
10006cae fld      dword ptr [eax + 0x24]
10006cb1 fmul     dword ptr [esi - 4]
10006cb4 faddp    st(1)
10006cb6 fld      dword ptr [eax + 0x28]
10006cb9 fmul     dword ptr [esi]
10006cbb faddp    st(1)
10006cbd fld      dword ptr [eax + 0x20]
10006cc0 fmul     dword ptr [esi - 8]
10006cc3 faddp    st(1)
10006cc5 fstp     dword ptr [edi]
10006cc7 fmul     dword ptr [eax + edx*4 + 0x30]
10006ccb mov      edx, dword ptr [esp + 0x18]
10006ccf fadd     dword ptr [eax + 0x3c]
10006cd2 fstp     dword ptr [edx + edi]
10006cd5 fld      dword ptr [eax + 0x3c]
10006cd8 fmul     dword ptr [esi + 4]
10006cdb fld      dword ptr [eax + 0x34]
10006cde fmul     dword ptr [esi - 4]
10006ce1 faddp    st(1)
10006ce3 fld      dword ptr [eax + 0x38]
10006ce6 fmul     dword ptr [esi]
10006ce8 faddp    st(1)
10006cea fld      dword ptr [eax + 0x30]
10006ced fmul     dword ptr [esi - 8]
10006cf0 faddp    st(1)
10006cf2 fstp     dword ptr [edi + 4]
10006cf5 fld      dword ptr [ecx + 4]
10006cf8 fld      dword ptr [ecx]
10006cfa fld      dword ptr [ecx - 4]
10006cfd fld      st(1)
10006cff fmul     st(2)
10006d01 fld      st(1)
10006d03 fmul     st(2)
10006d05 faddp    st(1)
10006d07 fld      st(3)
10006d09 fmul     st(4)
10006d0b faddp    st(1)
10006d0d fsqrt    
10006d0f fstp     st(3)
10006d11 mov      ebp, dword ptr [esp + 0x10]
10006d15 fstp     st(0)
10006d17 fstp     st(0)
10006d19 fdivr    dword ptr [0x1019bc78]
10006d1f fld      st(0)
10006d21 fmul     dword ptr [ecx - 4]
10006d24 fstp     dword ptr [ecx - 4]
10006d27 fld      st(0)
10006d29 fmul     dword ptr [ecx]
10006d2b fstp     dword ptr [ecx]
10006d2d fld      st(0)
10006d2f fmul     dword ptr [ecx + 4]
10006d32 fstp     dword ptr [ecx + 4]
10006d35 fmul     dword ptr [ecx + 8]
10006d38 fstp     dword ptr [ecx + 8]
10006d3b mov      edx, dword ptr [ecx - 4]
10006d3e test     edx, edx
10006d40 setle    dl
10006d43 dec      dl
10006d45 and      edx, 0xc
10006d48 mov      byte ptr [ecx + 0xc], dl
10006d4b cmp      dword ptr [ecx], 0
10006d4e setle    dl
10006d51 dec      dl
10006d53 and      dl, 0xc
10006d56 add      dl, 4
10006d59 mov      byte ptr [ecx + 0xd], dl
10006d5c mov      edx, dword ptr [ecx + 4]
10006d5f test     edx, edx
10006d61 setle    dl
10006d64 dec      dl
10006d66 and      dl, 0xc
10006d69 add      dl, 8
10006d6c mov      byte ptr [ecx + 0xe], dl
10006d6f mov      edx, dword ptr [esp + 0xc4]
10006d76 mov      byte ptr [ecx + 0xf], 0xff
10006d7a inc      ebx
10006d7b add      ebp, 0x14
10006d7e add      esi, 0x10
10006d81 add      edi, 0x14
10006d84 add      ecx, 0x14
10006d87 cmp      ebx, edx
10006d89 mov      dword ptr [esp + 0x10], ebp
10006d8d jl       0x10006c28
10006d93 pop      edi
10006d94 pop      esi
10006d95 pop      ebp
10006d96 pop      ebx
10006d97 add      esp, 0xac
10006d9d ret      

100062a0/95
100062a0 mov      ecx, dword ptr [0x101ce5b0]
100062a6 test     ecx, ecx
100062a8 push     esi
100062a9 je       0x100062d0
100062ab push     edi
100062ac mov      edi, dword ptr [ecx]
100062ae lea      esi, [eax + eax*4]
100062b1 lea      esi, [edx + esi*4]
100062b4 mov      dword ptr [esi], edi
100062b6 mov      edi, dword ptr [ecx + 4]
100062b9 mov      dword ptr [esi + 4], edi
100062bc mov      edi, dword ptr [ecx + 8]
100062bf mov      dword ptr [esi + 8], edi
100062c2 mov      edi, dword ptr [ecx + 0xc]
100062c5 mov      dword ptr [esi + 0xc], edi
100062c8 mov      ecx, dword ptr [ecx + 0x10]
100062cb mov      dword ptr [esi + 0x10], ecx
100062ce inc      eax
100062cf pop      edi
100062d0 mov      ecx, dword ptr [0x101ce5b4]
100062d6 test     ecx, ecx
100062d8 je       0x100062fd
100062da lea      esi, [eax + eax*4]
100062dd lea      edx, [edx + esi*4]
100062e0 mov      esi, dword ptr [ecx]
100062e2 mov      dword ptr [edx], esi
100062e4 mov      esi, dword ptr [ecx + 4]
100062e7 mov      dword ptr [edx + 4], esi
100062ea mov      esi, dword ptr [ecx + 8]
100062ed mov      dword ptr [edx + 8], esi
100062f0 mov      esi, dword ptr [ecx + 0xc]
100062f3 mov      dword ptr [edx + 0xc], esi
100062f6 mov      ecx, dword ptr [ecx + 0x10]
100062f9 mov      dword ptr [edx + 0x10], ecx
100062fc inc      eax
100062fd pop      esi
100062fe ret      
