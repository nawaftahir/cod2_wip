.686
.MODEL FLAT, C
EXTRN sub_100FD7F0:PROC
EXTRN sub_100FD809:PROC
EXTRN g_1076ADB8:DWORD
EXTRN g_1076BDC0:DWORD
.CODE
___initstdio PROC
    mov eax, dword ptr [g_1076BDC0]
    test eax, eax
    push esi
    push 20
    pop esi
    jne L0
    mov eax, 000000200h
    jmp L1
L0:
    cmp eax, esi
    jge L2
    mov eax, esi
L1:
    mov dword ptr [g_1076BDC0], eax
L2:
    push 4
    push eax
    call sub_100FD7F0
    test eax, eax
    pop ecx
    pop ecx
    mov dword ptr [g_1076ADB8], eax
    jne L3
    push 4
    push esi
    mov dword ptr [g_1076BDC0], esi
    call sub_100FD809
    test eax, eax
    pop ecx
    pop ecx
    mov dword ptr [g_1076ADB8], eax
    jne L3
    push 26
    pop eax
    pop esi
    ret
L3:
    xor edx, edx
    mov ecx, 0101A48A0h
    jmp L5
L4:
    mov eax, dword ptr [g_1076ADB8]
L5:
    mov dword ptr [edx + eax], ecx
    add ecx, 32
    add edx, 4
    cmp ecx, 0101A4B20h
    jl L4
    xor ecx, ecx
    mov edx, 0101A48B0h
L6:
    mov esi, ecx
    mov eax, ecx
    and eax, 31
    sar esi, 5
    mov esi, dword ptr [esi*4 + 01076ACA0h]
    lea eax, [eax + eax*8]
    mov eax, dword ptr [esi + eax*4]
    cmp eax, -1
    je L7
    test eax, eax
    jne L8
L7:
    or dword ptr [edx], 0FFFFFFFFh
L8:
    add edx, 32
    inc ecx
    cmp edx, 0101A4910h
    jl L6
    xor eax, eax
    pop esi
    ret
___initstdio ENDP
END
