
10024c80/261
10024c80 mov      ecx, dword ptr [0x10678500]
10024c86 sub      esp, 0x10
10024c89 push     ebp
10024c8a mov      ebp, dword ptr [esp + 0x1c]
10024c8e push     esi
10024c8f push     edi
10024c90 push     eax
10024c91 push     ecx
10024c92 mov      esi, 0x101d7e7c
10024c97 mov      edi, 0x10678504
10024c9c call     0x10021b50
10024ca1 mov      eax, dword ptr [0x1042e778]
10024ca6 mov      edx, dword ptr [eax + 0x30000]
10024cac mov      ecx, 0x30000
10024cb1 sub      ecx, edx
10024cb3 mov      esi, 8
10024cb8 add      esp, 8
10024cbb cmp      ecx, esi
10024cbd jge      0x10024cc9
10024cbf xor      ecx, ecx
10024cc1 mov      dword ptr [eax + 0x30008], ecx
10024cc7 jmp      0x10024cea
10024cc9 lea      ecx, [edx + eax]
10024ccc add      edx, 8
10024ccf mov      dword ptr [eax + 0x30000], edx
10024cd5 add      dword ptr [eax + 0x30004], esi
10024cdb mov      dword ptr [eax + 0x30008], ecx
10024ce1 mov      word ptr [ecx], 0xe
10024ce6 mov      word ptr [ecx + 2], si
10024cea mov      dword ptr [ecx + 4], 0
10024cf1 mov      eax, dword ptr [0x101d4818]
10024cf6 test     eax, eax
10024cf8 je       0x10024d20
10024cfa mov      edx, dword ptr [0x101ce708]
10024d00 cmp      dword ptr [edx + 8], 2
10024d04 je       0x10024d20
10024d06 mov      eax, dword ptr [0x101ce694]
10024d0b mov      cl, byte ptr [eax + 8]
10024d0e test     cl, cl
10024d10 je       0x10024d20
10024d12 mov      eax, dword ptr [0x101d489c]
10024d17 test     eax, eax
10024d19 mov      esi, 1
10024d1e jne      0x10024d25
10024d20 mov      esi, 7
10024d25 lea      eax, [esp + 0xc]
10024d29 call     0x10024920
10024d2e push     0
10024d30 push     0x3f800000
10024d35 mov      ecx, eax
10024d37 push     ecx
10024d38 push     esi
10024d39 call     0x10022220
10024d3e mov      ecx, dword ptr [0x101d1b9c]
10024d44 add      ecx, 0xb4
10024d4a push     0
10024d4c call     0x10021770
10024d51 push     0
10024d53 push     1
10024d55 push     ebp
10024d56 push     ebx
10024d57 call     0x10021890
10024d5c push     0
10024d5e push     6
10024d60 push     ebp
10024d61 push     ebx
10024d62 call     0x10021890
10024d67 mov      esi, dword ptr [esp + 0x54]
10024d6b call     0x10021920
10024d70 push     0
10024d72 push     0x15
10024d74 push     ebp
10024d75 push     ebx
10024d76 call     0x10021890
10024d7b add      esp, 0x44
10024d7e pop      edi
10024d7f pop      esi
10024d80 pop      ebp
10024d81 add      esp, 0x10
10024d84 ret      

10024d90/451
10024d90 mov      eax, dword ptr [0x10696c98]
10024d95 sub      esp, 0x10
10024d98 cmp      eax, -1
10024d9b push     ebp
10024d9c mov      ebp, dword ptr [esp + 0x18]
10024da0 push     esi
10024da1 push     edi
10024da2 jne      0x10024e23
10024da4 mov      byte ptr [0x10696c94], 1
10024dab call     0x10020f10
10024db0 xor      esi, esi
10024db2 mov      dword ptr [0x10696c98], eax
10024db7 call     0x10021840
10024dbc mov      eax, dword ptr [0x101d4c70]
10024dc1 mov      ecx, dword ptr [0x101d4c6c]
10024dc7 push     eax
10024dc8 push     ecx
10024dc9 push     esi
10024dca push     esi
10024dcb call     0x10021bf0
10024dd0 mov      eax, dword ptr [0x101d4818]
10024dd5 add      esp, 0x10
10024dd8 test     eax, eax
10024dda je       0x10024e02
10024ddc mov      edx, dword ptr [0x101ce708]
10024de2 cmp      dword ptr [edx + 8], 2
10024de6 je       0x10024e02
10024de8 mov      eax, dword ptr [0x101ce694]
10024ded mov      cl, byte ptr [eax + 8]
10024df0 test     cl, cl
10024df2 je       0x10024e02
10024df4 mov      eax, dword ptr [0x101d489c]
10024df9 test     eax, eax
10024dfb mov      esi, 1
10024e00 jne      0x10024e07
10024e02 mov      esi, 7
10024e07 lea      eax, [esp + 0xc]
10024e0b call     0x10024920
10024e10 push     0
10024e12 push     0x3f800000
10024e17 mov      ecx, eax
10024e19 push     ecx
10024e1a push     esi
10024e1b call     0x10022220
10024e20 add      esp, 0x10
10024e23 mov      al, byte ptr [0x10696c94]
10024e28 test     al, al
10024e2a je       0x10024e42
10024e2c mov      edx, dword ptr [0x10696c98]
10024e32 push     edx
10024e33 call     0x10020f70
10024e38 add      esp, 4
10024e3b mov      byte ptr [0x10696c94], 0
10024e42 call     0x10020f10
10024e47 mov      ecx, dword ptr [0x10678500]
10024e4d mov      dword ptr [ebp*4 + 0x10696c9c], eax
10024e54 mov      eax, dword ptr [esp + 0x24]
10024e58 push     eax
10024e59 push     ecx
10024e5a mov      esi, 0x101d7e7c
10024e5f mov      edi, 0x10678504
10024e64 call     0x10021b50
10024e69 mov      edx, dword ptr [esp + 0x34]
10024e6d mov      eax, dword ptr [esp + 0x30]
10024e71 push     0
10024e73 push     3
10024e75 push     edx
10024e76 push     eax
10024e77 call     0x10021890
10024e7c add      esp, 0x18
10024e7f mov      esi, ebp
10024e81 call     0x10021920
10024e86 mov      eax, dword ptr [ebp*4 + 0x10696c9c]
10024e8d cmp      eax, -1
10024e90 je       0x10024e9b
10024e92 push     eax
10024e93 call     0x10020f70
10024e98 add      esp, 4
10024e9b mov      eax, dword ptr [0x10696cac]
10024ea0 cmp      eax, -1
10024ea3 jne      0x10024eb6
10024ea5 mov      byte ptr [0x10696c94], 1
10024eac call     0x10020f10
10024eb1 mov      dword ptr [0x10696cac], eax
10024eb6 mov      cl, byte ptr [0x10696c94]
10024ebc test     cl, cl
10024ebe je       0x10024ed0
10024ec0 push     eax
10024ec1 call     0x10020f70
10024ec6 add      esp, 4
10024ec9 mov      byte ptr [0x10696c94], 0
10024ed0 cmp      dword ptr [0x10696cb4], -1
10024ed7 jne      0x10024f04
10024ed9 mov      byte ptr [0x10696cb0], 1
10024ee0 call     0x10020f10
10024ee5 mov      ecx, dword ptr [0x101d4c70]
10024eeb mov      edx, dword ptr [0x101d4c6c]
10024ef1 push     ecx
10024ef2 push     edx
10024ef3 push     0
10024ef5 push     0
10024ef7 mov      dword ptr [0x10696cb4], eax
10024efc call     0x10021bf0
10024f01 add      esp, 0x10
10024f04 mov      al, byte ptr [0x10696cb0]
10024f09 test     al, al
10024f0b je       0x10024f22
10024f0d mov      eax, dword ptr [0x10696cb4]
10024f12 push     eax
10024f13 call     0x10020f70
10024f18 add      esp, 4
10024f1b mov      byte ptr [0x10696cb0], 0
10024f22 call     0x10020f10
10024f27 mov      ecx, dword ptr [esp + 0x24]
10024f2b mov      edx, dword ptr [0x10678500]
10024f31 push     ecx
10024f32 push     edx
10024f33 mov      esi, 0x101d7e7c
10024f38 mov      edi, 0x10678504
10024f3d mov      dword ptr [ebp*4 + 0x10696cb8], eax
10024f44 call     0x10021b50
10024f49 add      esp, 8
10024f4c pop      edi
10024f4d pop      esi
10024f4e pop      ebp
10024f4f add      esp, 0x10
10024f52 ret      

10024f60/217
10024f60 mov      ecx, dword ptr [0x10678500]
10024f66 sub      esp, 0x10
10024f69 push     esi
10024f6a push     edi
10024f6b push     eax
10024f6c push     ecx
10024f6d mov      esi, 0x101d7e7c
10024f72 mov      edi, 0x10678504
10024f77 call     0x10021b50
10024f7c mov      eax, dword ptr [0x1042e778]
10024f81 mov      edx, dword ptr [eax + 0x30000]
10024f87 mov      ecx, 0x30000
10024f8c sub      ecx, edx
10024f8e mov      esi, 8
10024f93 add      esp, 8
10024f96 cmp      ecx, esi
10024f98 jge      0x10024fa8
10024f9a mov      dword ptr [eax + 0x30008], 0
10024fa4 xor      ecx, ecx
10024fa6 jmp      0x10024fc9
10024fa8 lea      ecx, [edx + eax]
10024fab add      edx, 8
10024fae mov      dword ptr [eax + 0x30000], edx
10024fb4 add      dword ptr [eax + 0x30004], esi
10024fba mov      dword ptr [eax + 0x30008], ecx
10024fc0 mov      word ptr [ecx], 0xe
10024fc5 mov      word ptr [ecx + 2], si
10024fc9 mov      dword ptr [ecx + 4], 0
10024fd0 mov      eax, dword ptr [0x101d4818]
10024fd5 test     eax, eax
10024fd7 je       0x10024fff
10024fd9 mov      edx, dword ptr [0x101ce708]
10024fdf cmp      dword ptr [edx + 8], 2
10024fe3 je       0x10024fff
10024fe5 mov      eax, dword ptr [0x101ce694]
10024fea mov      cl, byte ptr [eax + 8]
10024fed test     cl, cl
10024fef je       0x10024fff
10024ff1 mov      eax, dword ptr [0x101d489c]
10024ff6 test     eax, eax
10024ff8 mov      esi, 1
10024ffd jne      0x10025004
10024fff mov      esi, 7
10025004 lea      eax, [esp + 8]
10025008 call     0x10024920
1002500d push     0
1002500f push     0x3f800000
10025014 mov      ecx, eax
10025016 push     ecx
10025017 push     esi
10025018 call     0x10022220
1002501d mov      edx, dword ptr [esp + 0x30]
10025021 mov      eax, dword ptr [esp + 0x2c]
10025025 push     0
10025027 push     0x21
10025029 push     edx
1002502a push     eax
1002502b call     0x10021890
10025030 add      esp, 0x20
10025033 pop      edi
10025034 pop      esi
10025035 add      esp, 0x10
10025038 ret      

10025040/694
10025040 push     ebx
10025041 push     ebp
10025042 mov      ebp, dword ptr [esp + 0xc]
10025046 push     esi
10025047 mov      esi, dword ptr [esp + 0x14]
1002504b push     edi
1002504c mov      edi, eax
1002504e mov      eax, dword ptr [esp + 0x20]
10025052 push     edi
10025053 push     eax
10025054 mov      ebx, ecx
10025056 push     ebp
10025057 mov      eax, esi
10025059 call     0x10024a90
1002505e add      esp, 0xc
10025061 cmp      edi, 1
10025064 jne      0x10025075
10025066 mov      ecx, dword ptr [esp + 0x24]
1002506a push     ecx
1002506b push     esi
1002506c push     ebp
1002506d call     0x10027930
10025072 add      esp, 0xc
10025075 cmp      dword ptr [0x10696c7c], -1
1002507c jne      0x100250c9
1002507e mov      byte ptr [0x10696c78], 1
10025085 call     0x10020f10
1002508a xor      esi, esi
1002508c mov      dword ptr [0x10696c7c], eax
10025091 call     0x10021840
10025096 mov      edx, dword ptr [0x101d4c70]
1002509c mov      eax, dword ptr [0x101d4c6c]
100250a1 push     edx
100250a2 push     eax
100250a3 push     esi
100250a4 push     esi
100250a5 call     0x10021bf0
100250aa push     edi
100250ab call     0x100249c0
100250b0 mov      ecx, dword ptr [0x101d1b9c]
100250b6 add      ecx, 0xb4
100250bc push     esi
100250bd call     0x10021770
100250c2 mov      esi, dword ptr [esp + 0x30]
100250c6 add      esp, 0x18
100250c9 mov      al, byte ptr [0x10696c78]
100250ce test     al, al
100250d0 je       0x100250e8
100250d2 mov      ecx, dword ptr [0x10696c7c]
100250d8 push     ecx
100250d9 call     0x10020f70
100250de add      esp, 4
100250e1 mov      byte ptr [0x10696c78], 0
100250e8 call     0x10020f10
100250ed mov      edx, dword ptr [0x10678500]
100250f3 push     esi
100250f4 push     edx
100250f5 mov      esi, 0x101d7e7c
100250fa mov      edi, 0x10678504
100250ff mov      dword ptr [ebp*4 + 0x10696c80], eax
10025106 call     0x10021b50
1002510b mov      esi, dword ptr [esp + 0x28]
1002510f push     0
10025111 push     1
10025113 push     ebx
10025114 push     esi
10025115 call     0x10021890
1002511a push     0
1002511c push     6
1002511e push     ebx
1002511f push     esi
10025120 call     0x10021890
10025125 add      esp, 0x28
10025128 mov      esi, ebp
1002512a call     0x10021920
1002512f mov      eax, dword ptr [ebp*4 + 0x10696c80]
10025136 cmp      eax, -1
10025139 je       0x10025144
1002513b push     eax
1002513c call     0x10020f70
10025141 add      esp, 4
10025144 cmp      dword ptr [0x10696c90], -1
1002514b jne      0x1002516e
1002514d mov      byte ptr [0x10696c78], 1
10025154 call     0x10020f10
10025159 mov      dword ptr [0x10696c90], eax
1002515e mov      eax, dword ptr [esp + 0x1c]
10025162 mov      cl, byte ptr [eax + 4]
10025165 test     cl, cl
10025167 je       0x1002516e
10025169 call     0x100220c0
1002516e mov      al, byte ptr [0x10696c78]
10025173 test     al, al
10025175 je       0x1002518d
10025177 mov      ecx, dword ptr [0x10696c90]
1002517d push     ecx
1002517e call     0x10020f70
10025183 add      esp, 4
10025186 mov      byte ptr [0x10696c78], 0
1002518d mov      eax, dword ptr [0x10696c98]
10025192 cmp      eax, -1
10025195 jne      0x100251a8
10025197 mov      byte ptr [0x10696c94], 1
1002519e call     0x10020f10
100251a3 mov      dword ptr [0x10696c98], eax
100251a8 mov      cl, byte ptr [0x10696c94]
100251ae test     cl, cl
100251b0 je       0x100251c2
100251b2 push     eax
100251b3 call     0x10020f70
100251b8 add      esp, 4
100251bb mov      byte ptr [0x10696c94], 0
100251c2 call     0x10020f10
100251c7 mov      edx, dword ptr [esp + 0x18]
100251cb mov      dword ptr [ebp*4 + 0x10696c9c], eax
100251d2 mov      eax, dword ptr [0x10678500]
100251d7 push     edx
100251d8 push     eax
100251d9 mov      esi, 0x101d7e7c
100251de mov      edi, 0x10678504
100251e3 call     0x10021b50
100251e8 mov      eax, dword ptr [esp + 0x34]
100251ec mov      ecx, dword ptr [esp + 0x30]
100251f0 add      esp, 8
100251f3 call     0x100247f0
100251f8 mov      ecx, dword ptr [0x101ce694]
100251fe mov      al, byte ptr [ecx + 8]
10025201 test     al, al
10025203 je       0x10025213
10025205 mov      eax, dword ptr [0x101d489c]
1002520a test     eax, eax
1002520c mov      eax, 0x18
10025211 jne      0x10025218
10025213 mov      eax, 0x15
10025218 mov      edx, dword ptr [esp + 0x20]
1002521c push     0
1002521e push     eax
1002521f push     ebx
10025220 push     edx
10025221 call     0x10021890
10025226 mov      eax, dword ptr [ebp*4 + 0x10696c9c]
1002522d add      esp, 0x10
10025230 cmp      eax, -1
10025233 je       0x1002523e
10025235 push     eax
10025236 call     0x10020f70
1002523b add      esp, 4
1002523e mov      eax, dword ptr [0x10696cac]
10025243 cmp      eax, -1
10025246 jne      0x10025259
10025248 mov      byte ptr [0x10696c94], 1
1002524f call     0x10020f10
10025254 mov      dword ptr [0x10696cac], eax
10025259 mov      cl, byte ptr [0x10696c94]
1002525f test     cl, cl
10025261 je       0x10025273
10025263 push     eax
10025264 call     0x10020f70
10025269 add      esp, 4
1002526c mov      byte ptr [0x10696c94], 0
10025273 mov      eax, dword ptr [0x10696cb4]
10025278 cmp      eax, -1
1002527b jne      0x1002528e
1002527d mov      byte ptr [0x10696cb0], 1
10025284 call     0x10020f10
10025289 mov      dword ptr [0x10696cb4], eax
1002528e mov      cl, byte ptr [0x10696cb0]
10025294 test     cl, cl
10025296 je       0x100252a8
10025298 push     eax
10025299 call     0x10020f70
1002529e add      esp, 4
100252a1 mov      byte ptr [0x10696cb0], 0
100252a8 call     0x10020f10
100252ad mov      ecx, dword ptr [0x10678500]
100252b3 mov      dword ptr [ebp*4 + 0x10696cb8], eax
100252ba mov      eax, dword ptr [esp + 0x18]
100252be push     eax
100252bf push     ecx
100252c0 mov      esi, 0x101d7e7c
100252c5 mov      edi, 0x10678504
100252ca call     0x10021b50
100252cf mov      eax, dword ptr [esp + 0x24]
100252d3 mov      cl, byte ptr [eax + 4]
100252d6 add      esp, 8
100252d9 test     cl, cl
100252db je       0x100252e8
100252dd mov      edx, dword ptr [eax]
100252df push     edx
100252e0 call     0x10022110
100252e5 add      esp, 4
100252e8 push     ebp
100252e9 call     0x10022170
100252ee add      esp, 4
100252f1 pop      edi
100252f2 pop      esi
100252f3 pop      ebp
100252f4 pop      ebx
100252f5 ret      
