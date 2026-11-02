10035cd0 mov      ecx, dword ptr [0x10764578]
10035cd6 sub      esp, 0x4c
10035cd9 test     ecx, ecx
10035cdb push     ebx
10035cdc push     ebp
10035cdd push     esi
10035cde push     edi
10035cdf je       0x10035f66
10035ce5 mov      ecx, dword ptr [0x101ce7cc]
10035ceb mov      ecx, dword ptr [ecx + 8]
10035cee test     ecx, ecx
10035cf0 mov      dword ptr [esp + 0x3c], ecx
10035cf4 jle      0x10035f66
10035cfa fld      dword ptr [eax]
10035cfc fsub     dword ptr [0x1019bde0]
10035d02 fstp     dword ptr [esp + 0x2c]
10035d06 fld      qword ptr [0x1019bd80]
10035d0c fstp     qword ptr [esp + 0x40]
10035d10 fld      dword ptr [esp + 0x2c]
10035d14 fadd     qword ptr [esp + 0x40]
10035d18 fistp    dword ptr [esp + 0x28]
10035d1c fld      dword ptr [eax + 4]
10035d1f mov      edx, dword ptr [esp + 0x28]
10035d23 fsub     dword ptr [0x1019bde0]
10035d29 sar      edx, 5
10035d2c mov      dword ptr [esp + 0x38], edx
10035d30 fstp     dword ptr [esp + 0x2c]
10035d34 fld      qword ptr [0x1019bd80]
10035d3a fstp     qword ptr [esp + 0x40]
10035d3e fld      dword ptr [esp + 0x2c]
10035d42 fadd     qword ptr [esp + 0x40]
10035d46 fistp    dword ptr [esp + 0x28]
10035d4a fld      dword ptr [eax + 8]
10035d4d mov      ebx, dword ptr [esp + 0x28]
10035d51 fsub     dword ptr [0x1019bde0]
10035d57 sar      ebx, 5
10035d5a mov      dword ptr [esp + 0x34], ebx
10035d5e fstp     dword ptr [esp + 0x2c]
10035d62 fld      qword ptr [0x1019bd68]
10035d68 fstp     qword ptr [esp + 0x40]
10035d6c fld      dword ptr [esp + 0x2c]
10035d70 fsub     qword ptr [esp + 0x40]
10035d74 fistp    dword ptr [esp + 0x28]
10035d78 mov      edi, dword ptr [esp + 0x28]
10035d7c lea      eax, [edx - 0x1000]
10035d82 shl      eax, 5
10035d85 mov      dword ptr [esp + 0x2c], eax
10035d89 fild     dword ptr [esp + 0x2c]
10035d8d lea      eax, [ebx - 0x1000]
10035d93 shl      eax, 5
10035d96 fstp     dword ptr [esp + 0x4c]
10035d9a sar      edi, 6
10035d9d mov      dword ptr [esp + 0x2c], eax
10035da1 fild     dword ptr [esp + 0x2c]
10035da5 lea      eax, [edi - 0x800]
10035dab shl      eax, 6
10035dae fstp     dword ptr [esp + 0x50]
10035db2 mov      dword ptr [esp + 0x2c], eax
10035db6 fild     dword ptr [esp + 0x2c]
10035dba or       ebp, 0xffffffff
10035dbd mov      dword ptr [esp + 0x40], edi
10035dc1 mov      dword ptr [esp + 0x1c], ebp
10035dc5 fstp     dword ptr [esp + 0x54]
10035dc9 lea      esp, [esp]
10035dd0 lea      eax, [edi + ebp]
10035dd3 test     eax, eax
10035dd5 mov      dword ptr [esp + 0x20], eax
10035dd9 jl       0x10035f58
10035ddf shl      eax, 6
10035de2 cmp      eax, 0x80000
10035de7 jg       0x10035f58
10035ded mov      esi, ecx
10035def neg      esi
10035df1 cmp      esi, ecx
10035df3 mov      dword ptr [esp + 0x24], esi
10035df7 jg       0x10035f58
10035dfd mov      eax, ecx
10035dff sub      eax, esi
10035e01 lea      edi, [esi + ebx]
10035e04 inc      eax
10035e05 mov      dword ptr [esp + 0x18], edi
10035e09 mov      dword ptr [esp + 0x2c], eax
10035e0d lea      ecx, [ecx]
10035e10 test     edi, edi
10035e12 jl       0x10035f40
10035e18 mov      ebp, edi
10035e1a shl      ebp, 5
10035e1d cmp      ebp, 0x80000
10035e23 jg       0x10035f40
10035e29 cmp      esi, ecx
10035e2b jg       0x10035f40
10035e31 lea      ebp, [esi + edx]
10035e34 lea      eax, [ebp - 0x1000]
10035e3a shl      eax, 5
10035e3d mov      dword ptr [esp + 0x14], eax
10035e41 mov      eax, ecx
10035e43 sub      eax, esi
10035e45 inc      eax
10035e46 mov      dword ptr [esp + 0x28], eax
10035e4a lea      ebx, [ebx]
10035e50 test     ebp, ebp
10035e52 jl       0x10035f15
10035e58 mov      ecx, ebp
10035e5a shl      ecx, 5
10035e5d cmp      ecx, 0x80000
10035e63 jg       0x10035f15
10035e69 mov      edx, dword ptr [esp + 0x20]
10035e6d push     0
10035e6f push     edx
10035e70 push     edi
10035e71 mov      ebx, ebp
10035e73 call     0x10035c40
10035e78 add      esp, 0xc
10035e7b test     eax, eax
10035e7d jge      0x10035f15
10035e83 fild     dword ptr [esp + 0x14]
10035e87 mov      eax, dword ptr [esp + 0x20]
10035e8b mov      esi, dword ptr [esp + 0x64]
10035e8f mov      ecx, dword ptr [esp + 0x60]
10035e93 add      edi, 0xfffff000
10035e99 fstp     dword ptr [esp + 0x4c]
10035e9d shl      edi, 5
10035ea0 mov      dword ptr [esp + 0x30], edi
10035ea4 fild     dword ptr [esp + 0x30]
10035ea8 add      eax, 0xfffff800
10035ead shl      eax, 6
10035eb0 mov      dword ptr [esp + 0x30], eax
10035eb4 fstp     dword ptr [esp + 0x50]
10035eb8 push     0
10035eba fild     dword ptr [esp + 0x34]
10035ebe lea      edi, [esp + 0x50]
10035ec2 fstp     dword ptr [esp + 0x58]
10035ec6 call     0x1002c060
10035ecb add      esp, 4
10035ece cmp      eax, 2
10035ed1 je       0x10035f0d
10035ed3 mov      eax, dword ptr [esp + 0x1c]
10035ed7 test     eax, eax
10035ed9 je       0x10035ee5
10035edb cmp      eax, 1
10035ede mov      ebx, 0x10191408
10035ee3 jne      0x10035eea
10035ee5 mov      ebx, 0x101913c8
10035eea mov      edi, dword ptr [0x106d3194]
10035ef0 push     0x10195640
10035ef5 lea      ecx, [esp + 0x50]
10035ef9 push     0x3f800000
10035efe push     ecx
10035eff add      edi, 0x249d18
10035f05 call     0x10005680
10035f0a add      esp, 0xc
10035f0d mov      edi, dword ptr [esp + 0x18]
10035f11 mov      esi, dword ptr [esp + 0x24]
10035f15 mov      edx, dword ptr [esp + 0x14]
10035f19 mov      eax, dword ptr [esp + 0x28]
10035f1d add      edx, 0x20
10035f20 inc      ebp
10035f21 dec      eax
10035f22 mov      dword ptr [esp + 0x14], edx
10035f26 mov      dword ptr [esp + 0x28], eax
10035f2a jne      0x10035e50
10035f30 mov      ebx, dword ptr [esp + 0x34]
10035f34 mov      edx, dword ptr [esp + 0x38]
10035f38 mov      ecx, dword ptr [esp + 0x3c]
10035f3c mov      eax, dword ptr [esp + 0x2c]
10035f40 inc      edi
10035f41 dec      eax
10035f42 mov      dword ptr [esp + 0x18], edi
10035f46 mov      dword ptr [esp + 0x2c], eax
10035f4a jne      0x10035e10
10035f50 mov      edi, dword ptr [esp + 0x40]
10035f54 mov      ebp, dword ptr [esp + 0x1c]
10035f58 inc      ebp
10035f59 cmp      ebp, 1
10035f5c mov      dword ptr [esp + 0x1c], ebp
10035f60 jle      0x10035dd0
10035f66 pop      edi
10035f67 pop      esi
10035f68 pop      ebp
10035f69 pop      ebx
10035f6a add      esp, 0x4c
10035f6d ret      
