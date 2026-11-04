.686
.MODEL FLAT, C
EXTRN sub_100FB120:PROC
EXTRN sub_100FE203:PROC
EXTRN sub_100FE204:PROC
EXTRN sub_100FE211:PROC
EXTRN sub_100FE226:PROC
EXTRN sub_100FE22B:PROC
EXTRN sub_100FE230:PROC
EXTRN sub_100FE248:PROC
EXTRN sub_100FE26A:PROC
EXTRN sub_100FE271:PROC
EXTRN sub_100FE282:PROC
EXTRN sub_100FE28C:PROC
EXTRN sub_100FE293:PROC
EXTRN sub_100FE2A4:PROC
EXTRN sub_100FE2AE:PROC
EXTRN sub_100FE2B5:PROC
EXTRN sub_100FE2C6:PROC
EXTRN sub_100FE2CE:PROC
EXTRN sub_100FE2F6:PROC
EXTRN sub_100FE31E:PROC
EXTRN EXTRN fp_1010C17C:DWORD:DWORD
EXTRN EXTRN g_101A4F00:DWORD:DWORD
EXTRN EXTRN g_101A4F04:DWORD:DWORD
EXTRN EXTRN g_101A4F0C:DWORD:DWORD
.CODE
__XcptFilter PROC
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ebx
    push push esi
    push push edi
    call sub_100FB120
    mov mov edi, dword ptr [ebp + 8]
    mov mov esi, eax
    mov mov edx, dword ptr [esi + 84]
    mov mov eax, dword ptr [g_101A4F0C]
    mov mov ecx, edx
    cmp cmp dword ptr [ecx], edi
    je L1
    lea lea ebx, [eax + eax*2]
    add add ecx, 12
    lea lea ebx, [edx + ebx*4]
    cmp cmp ecx, ebx
    jb L0
    lea lea eax, [eax + eax*2]
    lea lea eax, [edx + eax*4]
    cmp cmp ecx, eax
    jae L2
    cmp cmp dword ptr [ecx], edi
    je L3
    xor xor ecx, ecx
    test test ecx, ecx
    je sub_100FE203
    mov mov ebx, dword ptr [ecx + 8]
L0:
    test test ebx, ebx
    mov mov dword ptr [ebp + 8], ebx
    je sub_100FE211
    cmp cmp ebx, 5
    jne L4
    and and dword ptr [ecx + 8], 0
    xor xor eax, eax
    inc inc eax
    jmp sub_100FE22B
    cmp cmp ebx, 1
    je sub_100FE226
    mov mov eax, dword ptr [esi + 88]
    mov mov dword ptr [ebp - 4], eax
    mov mov eax, dword ptr [ebp + 12]
    mov mov dword ptr [esi + 88], eax
    mov mov eax, dword ptr [ecx + 4]
    cmp cmp eax, 8
    jne sub_100FE230
    mov mov edx, dword ptr [g_101A4F00]
    mov mov eax, dword ptr [g_101A4F04]
    add add eax, edx
    cmp cmp edx, eax
    jge L5
    lea lea eax, [edx + edx*2]
    shl shl eax, 2
    mov mov edi, dword ptr [esi + 84]
    and and dword ptr [eax + edi + 8], 0
    mov mov edi, dword ptr [g_101A4F00]
    mov mov ebx, dword ptr [g_101A4F04]
    inc inc edx
    add add ebx, edi
    add add eax, 12
    cmp cmp edx, ebx
    jl L6
    mov mov ebx, dword ptr [ebp + 8]
    mov mov ecx, dword ptr [ecx]
    cmp cmp ecx, 0C000008Eh
    mov mov edi, dword ptr [esi + 92]
    jne sub_100FE204
    mov mov dword ptr [esi + 92], 083h
    jmp sub_100FE271
    cmp cmp ecx, 0C0000090h
    jne sub_100FE226
    mov mov dword ptr [esi + 92], 081h
    jmp sub_100FE282
    cmp cmp ecx, 0C0000091h
    jne sub_100FE248
    mov mov dword ptr [esi + 92], 084h
    jmp sub_100FE293
    cmp cmp ecx, 0C0000093h
    jne sub_100FE26A
    mov mov dword ptr [esi + 92], 085h
    jmp sub_100FE2A4
    cmp cmp ecx, 0C000008Dh
    jne sub_100FE28C
    mov mov dword ptr [esi + 92], 082h
    jmp sub_100FE2B5
    cmp cmp ecx, 0C000008Fh
    jne sub_100FE2AE
    mov mov dword ptr [esi + 92], 086h
    jmp sub_100FE2C6
    cmp cmp ecx, 0C0000092h
    jne sub_100FE2CE
    mov mov dword ptr [esi + 92], 08Ah
    push push dword ptr [esi + 92]
    push push 8
    call call ebx
    pop pop ecx
    mov mov dword ptr [esi + 92], edi
    jmp sub_100FE2F6
    and and dword ptr [ecx + 8], 0
    push push eax
    call call ebx
    mov mov eax, dword ptr [ebp - 4]
    pop pop ecx
    mov mov dword ptr [esi + 88], eax
L5:
    or or eax, -1
L6:
    jmp sub_100FE31E
    push push dword ptr [ebp + 12]
    call dword ptr [fp_1010C17C]
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
__XcptFilter ENDP
END
