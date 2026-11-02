
10021770/195
10021770 mov      edx, dword ptr [0x1042e778]
10021776 push     esi
10021777 mov      esi, dword ptr [edx + 0x30000]
1002177d mov      eax, 0x30000
10021782 sub      eax, esi
10021784 cmp      eax, 0x4c
10021787 jge      0x10021793
10021789 xor      eax, eax
1002178b mov      dword ptr [edx + 0x30008], eax
10021791 jmp      0x100217b7
10021793 lea      eax, [esi + edx]
10021796 add      esi, 0x4c
10021799 mov      dword ptr [edx + 0x30000], esi
1002179f add      dword ptr [edx + 0x30004], 0x4c
100217a6 mov      dword ptr [edx + 0x30008], eax
100217ac mov      word ptr [eax], 5
100217b1 mov      word ptr [eax + 2], 0x4c
100217b7 mov      edx, dword ptr [esp + 8]
100217bb mov      dword ptr [eax + 4], edx
100217be mov      edx, dword ptr [ecx + 4]
100217c1 mov      dword ptr [eax + 8], edx
100217c4 mov      edx, dword ptr [ecx + 8]
100217c7 mov      dword ptr [eax + 0xc], edx
100217ca mov      edx, dword ptr [ecx + 0xc]
100217cd mov      dword ptr [eax + 0x10], edx
100217d0 mov      edx, dword ptr [ecx + 0x10]
100217d3 mov      dword ptr [eax + 0x14], edx
100217d6 fld      dword ptr [ecx + 0x1c]
100217d9 mov      edx, dword ptr [ecx + 0x14]
100217dc fld      dword ptr [ecx + 0x18]
100217df fstp     dword ptr [eax + 0x2c]
100217e2 mov      dword ptr [eax + 0x28], edx
100217e5 mov      edx, 0x3f800000
100217ea fstp     dword ptr [eax + 0x30]
100217ed mov      dword ptr [eax + 0x34], edx
100217f0 fld      dword ptr [ecx + 0x28]
100217f3 mov      esi, dword ptr [ecx + 0x20]
100217f6 fld      dword ptr [ecx + 0x24]
100217f9 mov      dword ptr [eax + 0x24], edx
100217fc mov      edx, dword ptr [0x101ce638]
10021802 fstp     dword ptr [eax + 0x1c]
10021805 mov      dword ptr [eax + 0x18], esi
10021808 fstp     dword ptr [eax + 0x20]
1002180b pop      esi
1002180c fld      dword ptr [edx + 8]
1002180f fld      st(0)
10021811 fmul     dword ptr [eax + 0x28]
10021814 fstp     dword ptr [eax + 0x38]
10021817 fld      st(0)
10021819 fmul     dword ptr [eax + 0x2c]
1002181c fstp     dword ptr [eax + 0x3c]
1002181f fld      st(0)
10021821 fmul     dword ptr [eax + 0x30]
10021824 fstp     dword ptr [eax + 0x40]
10021827 fmul     dword ptr [eax + 0x34]
1002182a fstp     dword ptr [eax + 0x44]
1002182d mov      ecx, dword ptr [ecx]
1002182f mov      dword ptr [eax + 0x48], ecx
10021832 ret      

10021840/79
10021840 mov      eax, dword ptr [0x1042e778]
10021845 mov      edx, dword ptr [eax + 0x30000]
1002184b mov      ecx, 0x30000
10021850 sub      ecx, edx
10021852 cmp      ecx, 8
10021855 jge      0x10021867
10021857 mov      dword ptr [eax + 0x30008], 0
10021861 xor      eax, eax
10021863 mov      dword ptr [eax + 4], esi
10021866 ret      
10021867 lea      ecx, [edx + eax]
1002186a add      edx, 8
1002186d mov      dword ptr [eax + 0x30000], edx
10021873 add      dword ptr [eax + 0x30004], 8
1002187a mov      dword ptr [eax + 0x30008], ecx
10021880 mov      word ptr [ecx], 0xe
10021885 mov      word ptr [ecx + 2], 8
1002188b mov      dword ptr [ecx + 4], esi
1002188e ret      

10021920/87
10021920 mov      eax, dword ptr [0x1042e778]
10021925 mov      edx, dword ptr [eax + 0x30000]
1002192b push     edi
1002192c mov      edi, dword ptr [eax + 0x30004]
10021932 mov      ecx, 0x30000
10021937 sub      ecx, edx
10021939 lea      ecx, [ecx + edi - 0x2000]
10021940 cmp      ecx, 8
10021943 pop      edi
10021944 jge      0x10021956
10021946 mov      dword ptr [eax + 0x30008], 0
10021950 xor      eax, eax
10021952 mov      dword ptr [eax + 4], esi
10021955 ret      
10021956 lea      ecx, [edx + eax]
10021959 add      edx, 8
1002195c mov      dword ptr [eax + 0x30000], edx
10021962 mov      dword ptr [eax + 0x30008], ecx
10021968 mov      word ptr [ecx], 0x18
1002196d mov      word ptr [ecx + 2], 8
10021973 mov      dword ptr [ecx + 4], esi
10021976 ret      

10021b50/146
10021b50 mov      eax, dword ptr [0x1042e778]
10021b55 mov      edx, dword ptr [eax + 0x30000]
10021b5b mov      ecx, 0x30000
10021b60 sub      ecx, edx
10021b62 cmp      ecx, 0x30
10021b65 jge      0x10021b75
10021b67 mov      dword ptr [eax + 0x30008], 0
10021b71 xor      eax, eax
10021b73 jmp      0x10021b9b
10021b75 lea      ecx, [edx + eax]
10021b78 add      edx, 0x30
10021b7b mov      dword ptr [eax + 0x30000], edx
10021b81 add      dword ptr [eax + 0x30004], 0x30
10021b88 mov      dword ptr [eax + 0x30008], ecx
10021b8e mov      word ptr [ecx], 0xc
10021b93 mov      word ptr [ecx + 2], 0x30
10021b99 mov      eax, ecx
10021b9b mov      ecx, dword ptr [esp + 4]
10021b9f mov      dword ptr [eax + 0x2c], ecx
10021ba2 mov      ecx, dword ptr [edi]
10021ba4 lea      edx, [eax + 4]
10021ba7 mov      dword ptr [edx], ecx
10021ba9 mov      ecx, dword ptr [edi + 4]
10021bac mov      dword ptr [edx + 4], ecx
10021baf mov      ecx, dword ptr [edi + 8]
10021bb2 mov      dword ptr [edx + 8], ecx
10021bb5 mov      ecx, dword ptr [edi + 0xc]
10021bb8 mov      dword ptr [edx + 0xc], ecx
10021bbb mov      edx, dword ptr [esp + 8]
10021bbf mov      dword ptr [eax + 0x14], edx
10021bc2 mov      ecx, dword ptr [esi]
10021bc4 add      eax, 0x18
10021bc7 mov      dword ptr [eax], ecx
10021bc9 mov      edx, dword ptr [esi + 4]
10021bcc mov      dword ptr [eax + 4], edx
10021bcf mov      ecx, dword ptr [esi + 8]
10021bd2 mov      dword ptr [eax + 8], ecx
10021bd5 mov      edx, dword ptr [esi + 0xc]
10021bd8 mov      dword ptr [eax + 0xc], edx
10021bdb mov      ecx, dword ptr [esi + 0x10]
10021bde mov      dword ptr [eax + 0x10], ecx
10021be1 ret      
