
100247f0/296
100247f0 sub      esp, 0xc
100247f3 test     eax, eax
100247f5 jle      0x10024914
100247fb push     ebx
100247fc push     ebp
100247fd push     esi
100247fe mov      esi, dword ptr [0x1042e778]
10024804 push     edi
10024805 mov      edi, ecx
10024807 add      edi, 8
1002480a mov      dword ptr [esp + 0x10], eax
1002480e mov      edi, edi
10024810 mov      edx, dword ptr [0x10678abc]
10024816 mov      eax, dword ptr [edi - 4]
10024819 mov      ebx, dword ptr [esi + 0x30004]
1002481f mov      ecx, dword ptr [edi - 8]
10024822 mov      ebp, dword ptr [0x101d1b48]
10024828 lea      eax, [edx + eax*8]
1002482b mov      edx, dword ptr [edi]
1002482d mov      dword ptr [esp + 0x14], eax
10024831 mov      dword ptr [esp + 0x18], edx
10024835 mov      edx, dword ptr [esi + 0x30000]
1002483b mov      eax, 0x30000
10024840 sub      eax, edx
10024842 lea      eax, [eax + ebx - 0x2000]
10024849 cmp      eax, 0x1c
1002484c jge      0x10024858
1002484e xor      ebx, ebx
10024850 mov      dword ptr [esi + 0x30008], ebx
10024856 jmp      0x10024899
10024858 lea      eax, [edx + esi]
1002485b mov      dword ptr [esi + 0x30008], eax
10024861 add      edx, 0x1c
10024864 mov      dword ptr [esi + 0x30000], edx
1002486a mov      word ptr [eax], 0x14
1002486f mov      word ptr [eax + 2], 0x1c
10024875 mov      edx, 0x3f800000
1002487a mov      dword ptr [eax + 0x10], edx
1002487d mov      dword ptr [eax + 0x14], edx
10024880 mov      dl, 0xff
10024882 mov      dword ptr [eax + 4], ebp
10024885 xor      ebx, ebx
10024887 mov      dword ptr [eax + 8], ebx
1002488a mov      dword ptr [eax + 0xc], ebx
1002488d mov      byte ptr [eax + 0x18], dl
10024890 mov      byte ptr [eax + 0x19], dl
10024893 mov      byte ptr [eax + 0x1a], dl
10024896 mov      byte ptr [eax + 0x1b], dl
10024899 push     ebx
1002489a call     0x10021770
1002489f mov      ecx, dword ptr [esi + 0x30000]
100248a5 mov      edx, dword ptr [esi + 0x30004]
100248ab mov      eax, 0x30000
100248b0 sub      eax, ecx
100248b2 lea      eax, [eax + edx - 0x2000]
100248b9 add      esp, 4
100248bc cmp      eax, 0x14
100248bf jge      0x100248c9
100248c1 mov      dword ptr [esi + 0x30008], ebx
100248c7 jmp      0x100248fe
100248c9 mov      edx, dword ptr [esp + 0x18]
100248cd lea      eax, [ecx + esi]
100248d0 mov      dword ptr [esi + 0x30008], eax
100248d6 add      ecx, 0x14
100248d9 mov      dword ptr [esi + 0x30000], ecx
100248df mov      ecx, dword ptr [esp + 0x14]
100248e3 mov      word ptr [eax], 0x17
100248e8 mov      word ptr [eax + 2], 0x14
100248ee mov      dword ptr [eax + 4], ebx
100248f1 mov      dword ptr [eax + 8], ecx
100248f4 mov      dword ptr [eax + 0xc], edx
100248f7 mov      dword ptr [eax + 0x10], 0x12
100248fe mov      eax, dword ptr [esp + 0x10]
10024902 add      edi, 0xc
10024905 dec      eax
10024906 mov      dword ptr [esp + 0x10], eax
1002490a jne      0x10024810
10024910 pop      edi
10024911 pop      esi
10024912 pop      ebp
10024913 pop      ebx
10024914 add      esp, 0xc
10024917 ret      

10024a90/456
10024a90 push     ebp
10024a91 mov      ebp, dword ptr [esp + 8]
10024a95 push     esi
10024a96 push     edi
10024a97 mov      edi, eax
10024a99 mov      eax, dword ptr [0x101ce708]
10024a9e cmp      dword ptr [eax + 8], 2
10024aa2 je       0x10024b72
10024aa8 mov      ecx, dword ptr [0x101ce694]
10024aae mov      al, byte ptr [ecx + 8]
10024ab1 test     al, al
10024ab3 je       0x10024b72
10024ab9 mov      eax, dword ptr [0x101d489c]
10024abe test     eax, eax
10024ac0 je       0x10024b72
10024ac6 cmp      dword ptr [0x10696c44], -1
10024acd jne      0x10024aef
10024acf mov      byte ptr [0x10696c40], 1
10024ad6 call     0x10020f10
10024adb mov      esi, 6
10024ae0 mov      dword ptr [0x10696c44], eax
10024ae5 call     0x10021840
10024aea call     0x10024a40
10024aef mov      al, byte ptr [0x10696c40]
10024af4 test     al, al
10024af6 je       0x10024b0e
10024af8 mov      edx, dword ptr [0x10696c44]
10024afe push     edx
10024aff call     0x10020f70
10024b04 add      esp, 4
10024b07 mov      byte ptr [0x10696c40], 0
10024b0e call     0x10020f10
10024b13 mov      dword ptr [ebp*4 + 0x10696c48], eax
10024b1a mov      eax, dword ptr [0x10678500]
10024b1f push     edi
10024b20 push     eax
10024b21 mov      esi, 0x101d7e7c
10024b26 mov      edi, 0x10678504
10024b2b call     0x10021b50
10024b30 mov      ecx, dword ptr [esp + 0x1c]
10024b34 push     0
10024b36 push     2
10024b38 push     ebx
10024b39 push     ecx
10024b3a call     0x10021890
10024b3f add      esp, 0x18
10024b42 mov      edx, ebp
10024b44 xor      eax, eax
10024b46 call     0x100294e0
10024b4b mov      al, byte ptr [0x10696c40]
10024b50 test     al, al
10024b52 je       0x10024c54
10024b58 mov      edx, dword ptr [0x10696c58]
10024b5e push     edx
10024b5f call     0x10020f70
10024b64 add      esp, 4
10024b67 pop      edi
10024b68 pop      esi
10024b69 mov      byte ptr [0x10696c40], 0
10024b70 pop      ebp
10024b71 ret      
10024b72 cmp      dword ptr [esp + 0x18], 1
10024b77 jne      0x10024c54
10024b7d cmp      dword ptr [0x10696c44], -1
10024b84 jne      0x10024bb7
10024b86 mov      byte ptr [0x10696c40], 1
10024b8d call     0x10020f10
10024b92 mov      esi, 3
10024b97 mov      dword ptr [0x10696c44], eax
10024b9c call     0x10021840
10024ba1 push     0
10024ba3 push     0x3f800000
10024ba8 push     0x10191488
10024bad push     7
10024baf call     0x10022220
10024bb4 add      esp, 0x10
10024bb7 mov      al, byte ptr [0x10696c40]
10024bbc test     al, al
10024bbe je       0x10024bd5
10024bc0 mov      eax, dword ptr [0x10696c44]
10024bc5 push     eax
10024bc6 call     0x10020f70
10024bcb add      esp, 4
10024bce mov      byte ptr [0x10696c40], 0
10024bd5 call     0x10020f10
10024bda mov      ecx, dword ptr [0x10678500]
10024be0 push     edi
10024be1 push     ecx
10024be2 mov      esi, 0x101d7e7c
10024be7 mov      edi, 0x10678504
10024bec mov      dword ptr [ebp*4 + 0x10696c48], eax
10024bf3 call     0x10021b50
10024bf8 mov      edx, dword ptr [esp + 0x1c]
10024bfc push     0
10024bfe push     0
10024c00 push     ebx
10024c01 push     edx
10024c02 call     0x10021890
10024c07 mov      ebp, dword ptr [ebp*4 + 0x10696c48]
10024c0e add      esp, 0x18
10024c11 cmp      ebp, -1
10024c14 je       0x10024c1f
10024c16 push     ebp
10024c17 call     0x10020f70
10024c1c add      esp, 4
10024c1f mov      eax, dword ptr [0x10696c58]
10024c24 cmp      eax, -1
10024c27 jne      0x10024c3a
10024c29 mov      byte ptr [0x10696c40], 1
10024c30 call     0x10020f10
10024c35 mov      dword ptr [0x10696c58], eax
10024c3a mov      cl, byte ptr [0x10696c40]
10024c40 test     cl, cl
10024c42 je       0x10024c54
10024c44 push     eax
10024c45 call     0x10020f70
10024c4a add      esp, 4
10024c4d mov      byte ptr [0x10696c40], 0
10024c54 pop      edi
10024c55 pop      esi
10024c56 pop      ebp
10024c57 ret      

10027930/839
10027930 mov      eax, dword ptr [0x10696c60]
10027935 sub      esp, 0x1c
10027938 cmp      eax, -1
1002793b je       0x10027944
1002793d mov      ecx, 1
10027942 jmp      0x10027957
10027944 mov      byte ptr [0x10696c5c], 1
1002794b call     0x10020f10
10027950 mov      dword ptr [0x10696c60], eax
10027955 xor      ecx, ecx
10027957 test     ecx, ecx
10027959 mov      cl, byte ptr [0x10696c5c]
1002795f sete     byte ptr [esp + 3]
10027964 test     cl, cl
10027966 je       0x10027978
10027968 push     eax
10027969 call     0x10020f70
1002796e add      esp, 4
10027971 mov      byte ptr [0x10696c5c], 0
10027978 push     ebp
10027979 push     esi
1002797a push     edi
1002797b call     0x10020f10
10027980 mov      ecx, dword ptr [esp + 0x2c]
10027984 mov      ebp, dword ptr [esp + 0x34]
10027988 mov      dword ptr [ecx*4 + 0x10696c64], eax
1002798f mov      eax, dword ptr [ebp + 0xa20]
10027995 xor      ecx, ecx
10027997 test     eax, eax
10027999 mov      dword ptr [esp + 0x18], 0x3f000000
100279a1 mov      dword ptr [esp + 0x1c], 0x3f000000
100279a9 mov      dword ptr [esp + 0x20], 0x3f000000
100279b1 mov      dword ptr [esp + 0x24], 0
100279b9 mov      dword ptr [esp + 0x10], ecx
100279bd je       0x10027b51
100279c3 add      ebp, 0x68
100279c6 push     ebx
100279c7 mov      ebx, dword ptr [ebp - 0x64]
100279ca mov      eax, dword ptr [ebp - 0x60]
100279cd mov      esi, dword ptr [ebp - 0x68]
100279d0 sub      eax, ebx
100279d2 sub      ebx, esi
100279d4 test     eax, eax
100279d6 mov      dword ptr [esp + 0x18], eax
100279da je       0x10027b32
100279e0 test     ebx, ebx
100279e2 je       0x10027b32
100279e8 mov      edx, dword ptr [0x101ce810]
100279ee cmp      ecx, dword ptr [edx + 8]
100279f1 jge      0x10027b32
100279f7 mov      eax, dword ptr [ebp]
100279fa push     eax
100279fb lea      ecx, [ebp - 0x5c]
100279fe push     ecx
100279ff call     0x10021ae0
10027a04 mov      esi, 4
10027a09 call     0x10021840
10027a0e push     0
10027a10 push     0x3f800000
10027a15 lea      edx, [esp + 0x2c]
10027a19 push     edx
10027a1a push     7
10027a1c call     0x10022220
10027a21 mov      eax, dword ptr [ebp - 4]
10027a24 mov      ecx, dword ptr [0x10678500]
10027a2a push     eax
10027a2b push     ecx
10027a2c mov      esi, 0x101d7e7c
10027a31 mov      edi, 0x10678504
10027a36 call     0x10021b50
10027a3b push     0x7e
10027a3d push     0x7e
10027a3f push     1
10027a41 push     1
10027a43 call     0x10021bf0
10027a48 mov      eax, dword ptr [0x10678abc]
10027a4d mov      edx, dword ptr [ebp - 0x68]
10027a50 lea      esi, [eax + edx*8]
10027a53 mov      eax, ebx
10027a55 mov      ecx, esi
10027a57 call     0x100244b0
10027a5c push     0
10027a5e push     0x1f
10027a60 push     ebx
10027a61 push     esi
10027a62 call     0x10021890
10027a67 add      esp, 0x40
10027a6a push     0x80
10027a6f push     0x80
10027a74 push     0
10027a76 push     0
10027a78 call     0x10021bf0
10027a7d mov      ecx, dword ptr [0x101ce830]
10027a83 mov      eax, dword ptr [ecx + 8]
10027a86 add      esp, 0x10
10027a89 test     eax, eax
10027a8b je       0x10027a92
10027a8d call     0x100221d0
10027a92 mov      esi, 3
10027a97 call     0x10021840
10027a9c mov      al, byte ptr [esp + 0x13]
10027aa0 test     al, al
10027aa2 je       0x10027add
10027aa4 mov      edx, dword ptr [0x101ce708]
10027aaa cmp      dword ptr [edx + 8], 2
10027aae mov      byte ptr [esp + 0x13], 0
10027ab3 je       0x10027add
10027ab5 mov      eax, dword ptr [0x101ce694]
10027aba mov      cl, byte ptr [eax + 8]
10027abd test     cl, cl
10027abf je       0x10027add
10027ac1 mov      eax, dword ptr [0x101d489c]
10027ac6 test     eax, eax
10027ac8 je       0x10027add
10027aca push     0
10027acc push     0
10027ace push     0x10191488
10027ad3 push     1
10027ad5 call     0x10022220
10027ada add      esp, 0x10
10027add mov      ecx, dword ptr [esp + 0x34]
10027ae1 mov      edx, dword ptr [0x10678500]
10027ae7 push     ecx
10027ae8 push     edx
10027ae9 mov      esi, 0x101d7e7c
10027aee mov      edi, 0x10678504
10027af3 call     0x10021b50
10027af8 mov      ecx, dword ptr [0x101ce640]
10027afe mov      eax, dword ptr [esp + 0x1c]
10027b02 mov      edx, dword ptr [ecx + 8]
10027b05 add      esp, 8
10027b08 cmp      eax, edx
10027b0a jge      0x10027b32
10027b0c mov      eax, dword ptr [0x10678abc]
10027b11 mov      edx, dword ptr [ebp - 0x64]
10027b14 mov      edi, dword ptr [esp + 0x18]
10027b18 lea      esi, [eax + edx*8]
10027b1b mov      eax, edi
10027b1d mov      ecx, esi
10027b1f call     0x100244b0
10027b24 push     0
10027b26 push     0x20
10027b28 push     edi
10027b29 push     esi
10027b2a call     0x10021890
10027b2f add      esp, 0x10
10027b32 mov      ecx, dword ptr [esp + 0x14]
10027b36 mov      edx, dword ptr [esp + 0x38]
10027b3a mov      eax, dword ptr [edx + 0xa20]
10027b40 inc      ecx
10027b41 add      ebp, 0x6c
10027b44 cmp      ecx, eax
10027b46 mov      dword ptr [esp + 0x14], ecx
10027b4a jne      0x100279c7
10027b50 pop      ebx
10027b51 mov      al, byte ptr [esp + 0xf]
10027b55 test     al, al
10027b57 mov      esi, dword ptr [0x1042e778]
10027b5d mov      edi, 8
10027b62 je       0x10027bdb
10027b64 mov      ecx, dword ptr [esi + 0x30000]
10027b6a mov      eax, 0x30000
10027b6f sub      eax, ecx
10027b71 cmp      eax, edi
10027b73 jge      0x10027b7f
10027b75 xor      eax, eax
10027b77 mov      dword ptr [esi + 0x30008], eax
10027b7d jmp      0x10027ba0
10027b7f lea      eax, [ecx + esi]
10027b82 add      ecx, 8
10027b85 mov      dword ptr [esi + 0x30000], ecx
10027b8b add      dword ptr [esi + 0x30004], edi
10027b91 mov      dword ptr [esi + 0x30008], eax
10027b97 mov      word ptr [eax], 0xe
10027b9c mov      word ptr [eax + 2], di
10027ba0 mov      dword ptr [eax + 4], 3
10027ba7 mov      eax, dword ptr [0x101ce708]
10027bac cmp      dword ptr [eax + 8], 2
10027bb0 je       0x10027bdb
10027bb2 mov      ecx, dword ptr [0x101ce694]
10027bb8 mov      al, byte ptr [ecx + 8]
10027bbb test     al, al
10027bbd je       0x10027bdb
10027bbf mov      eax, dword ptr [0x101d489c]
10027bc4 test     eax, eax
10027bc6 je       0x10027bdb
10027bc8 push     0
10027bca push     0
10027bcc push     0x10191488
10027bd1 push     1
10027bd3 call     0x10022220
10027bd8 add      esp, 0x10
10027bdb mov      edx, dword ptr [esp + 0x2c]
10027bdf mov      eax, dword ptr [edx*4 + 0x10696c64]
10027be6 cmp      eax, -1
10027be9 je       0x10027bf4
10027beb push     eax
10027bec call     0x10020f70
10027bf1 add      esp, 4
10027bf4 mov      ecx, dword ptr [0x10696c74]
10027bfa cmp      ecx, -1
10027bfd jne      0x10027c57
10027bff mov      byte ptr [0x10696c5c], 1
10027c06 mov      ecx, dword ptr [esi + 0x30000]
10027c0c mov      eax, 0x30000
10027c11 sub      eax, ecx
10027c13 cmp      eax, edi
10027c15 jge      0x10027c21
10027c17 xor      eax, eax
10027c19 mov      dword ptr [esi + 0x30008], eax
10027c1f jmp      0x10027c4a
10027c21 lea      edx, [ecx + 8]
10027c24 mov      dword ptr [esi + 0x30000], edx
10027c2a mov      edx, dword ptr [esi + 0x30004]
10027c30 lea      eax, [ecx + esi]
10027c33 add      edx, edi
10027c35 mov      dword ptr [esi + 0x30004], edx
10027c3b mov      dword ptr [esi + 0x30008], eax
10027c41 mov      word ptr [eax], 1
10027c46 mov      word ptr [eax + 2], di
10027c4a mov      dword ptr [eax + 4], 0
10027c51 mov      dword ptr [0x10696c74], ecx
10027c57 mov      al, byte ptr [0x10696c5c]
10027c5c test     al, al
10027c5e pop      edi
10027c5f pop      esi
10027c60 pop      ebp
10027c61 je       0x10027c73
10027c63 push     ecx
10027c64 call     0x10020f70
10027c69 add      esp, 4
10027c6c mov      byte ptr [0x10696c5c], 0
10027c73 add      esp, 0x1c
10027c76 ret      
