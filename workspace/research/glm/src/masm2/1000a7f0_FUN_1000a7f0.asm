.686
.MODEL FLAT, C
EXTRN sub_1000A847:PROC
EXTRN sub_1000A853:PROC
EXTRN sub_1000A855:PROC
EXTRN EXTRN g_101CE580:DWORD:DWORD
EXTRN EXTRN g_101D1B9C:DWORD:DWORD
.CODE
FUN_1000a7f0 PROC
    mov mov eax, dword ptr [g_101D1B9C]
    test test eax, eax
    mov mov dword ptr [g_101CE580], 0
    je sub_1000A847
    mov mov edx, dword ptr [eax + 0FCh]
    xor xor ecx, ecx
    test test edx, edx
    jle sub_1000A853
    xor xor edx, edx
    push push edi
    mov mov eax, dword ptr [eax + 0100h]
    mov mov dword ptr [eax + edx + 56], 0
    mov mov eax, dword ptr [g_101D1B9C]
    mov mov edi, dword ptr [eax + 0FCh]
    inc inc ecx
    add add edx, 60
    cmp cmp ecx, edi
    jl sub_1000A855
    pop pop edi
    ret ret
FUN_1000a7f0 ENDP
END
