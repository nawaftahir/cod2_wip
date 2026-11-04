.686
.MODEL FLAT, C
EXTRN sub_100FB120:PROC
EXTRN fp_1010C17C:DWORD
EXTRN g_101A4F00:DWORD
EXTRN g_101A4F04:DWORD
EXTRN g_101A4F0C:DWORD
.CODE
__XcptFilter PROC
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    push esi
    push edi
    call sub_100FB120
    mov edi, dword ptr [ebp + 8]
    mov esi, eax
    mov edx, dword ptr [esi + 84]
    mov eax, dword ptr [g_101A4F0C]
    mov ecx, edx
L0:
    cmp dword ptr [ecx], edi
    je L1
    lea ebx, [eax + eax*2]
    add ecx, 12
    lea ebx, [edx + ebx*4]
    cmp ecx, ebx
    jb L0
L1:
    lea eax, [eax + eax*2]
    lea eax, [edx + eax*4]
    cmp ecx, eax
    jae L2
    cmp dword ptr [ecx], edi
    je L3
L2:
    xor ecx, ecx
L3:
    test ecx, ecx
    je L17
    mov ebx, dword ptr [ecx + 8]
    test ebx, ebx
    mov dword ptr [ebp + 8], ebx
    je L17
    cmp ebx, 5
    jne L4
    and dword ptr [ecx + 8], 0
    xor eax, eax
    inc eax
    jmp L18
L4:
    cmp ebx, 1
    je L16
    mov eax, dword ptr [esi + 88]
    mov dword ptr [ebp - 4], eax
    mov eax, dword ptr [ebp + 12]
    mov dword ptr [esi + 88], eax
    mov eax, dword ptr [ecx + 4]
    cmp eax, 8
    jne L14
    mov edx, dword ptr [g_101A4F00]
    mov eax, dword ptr [g_101A4F04]
    add eax, edx
    cmp edx, eax
    jge L6
    lea eax, [edx + edx*2]
    shl eax, 2
L5:
    mov edi, dword ptr [esi + 84]
    and dword ptr [eax + edi + 8], 0
    mov edi, dword ptr [g_101A4F00]
    mov ebx, dword ptr [g_101A4F04]
    inc edx
    add ebx, edi
    add eax, 12
    cmp edx, ebx
    jl L5
    mov ebx, dword ptr [ebp + 8]
L6:
    mov ecx, dword ptr [ecx]
    cmp ecx, 0C000008Eh
    mov edi, dword ptr [esi + 92]
    jne L7
    mov dword ptr [esi + 92], 000000083h
    jmp L13
L7:
    cmp ecx, 0C0000090h
    jne L8
    mov dword ptr [esi + 92], 000000081h
    jmp L13
L8:
    cmp ecx, 0C0000091h
    jne L9
    mov dword ptr [esi + 92], 000000084h
    jmp L13
L9:
    cmp ecx, 0C0000093h
    jne L10
    mov dword ptr [esi + 92], 000000085h
    jmp L13
L10:
    cmp ecx, 0C000008Dh
    jne L11
    mov dword ptr [esi + 92], 000000082h
    jmp L13
L11:
    cmp ecx, 0C000008Fh
    jne L12
    mov dword ptr [esi + 92], 000000086h
    jmp L13
L12:
    cmp ecx, 0C0000092h
    jne L13
    mov dword ptr [esi + 92], 00000008Ah
L13:
    push dword ptr [esi + 92]
    push 8
    call ebx
    pop ecx
    mov dword ptr [esi + 92], edi
    jmp L15
L14:
    and dword ptr [ecx + 8], 0
    push eax
    call ebx
L15:
    mov eax, dword ptr [ebp - 4]
    pop ecx
    mov dword ptr [esi + 88], eax
L16:
    or eax, 0FFFFFFFFh
    jmp L18
L17:
    push dword ptr [ebp + 12]
    call dword ptr [fp_1010C17C]
L18:
    pop edi
    pop esi
    pop ebx
    leave
    ret
__XcptFilter ENDP
END
