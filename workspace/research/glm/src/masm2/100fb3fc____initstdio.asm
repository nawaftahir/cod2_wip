.686
.MODEL FLAT, C
EXTRN sub_100FB4B3:PROC
EXTRN sub_100FB4C4:PROC
EXTRN sub_100FB517:PROC
EXTRN sub_100FB524:PROC
EXTRN sub_100FB52B:PROC
EXTRN sub_100FD7F0:PROC
EXTRN sub_100FD809:PROC
EXTRN EXTRN g_1076ADB8:DWORD:DWORD
EXTRN EXTRN g_1076BDC0:DWORD:DWORD
.CODE
___initstdio PROC
    mov mov eax, dword ptr [g_1076BDC0]
    test test eax, eax
    push push esi
    push push 20
    pop pop esi
    jne L0
    mov mov eax, 0200h
    jmp L1
    cmp cmp eax, esi
    jge L2
    mov mov eax, esi
    mov mov dword ptr [g_1076BDC0], eax
    push push 4
L0:
    push push eax
    call sub_100FD7F0
    test test eax, eax
    pop pop ecx
    pop pop ecx
    mov mov dword ptr [g_1076ADB8], eax
    jne L3
    push push 4
    push push esi
    mov mov dword ptr [g_1076BDC0], esi
    call sub_100FD809
    test test eax, eax
    pop pop ecx
    pop pop ecx
    mov mov dword ptr [g_1076ADB8], eax
    jne L4
    push push 26
    pop pop eax
    pop pop esi
    ret ret
    xor xor edx, edx
    mov mov ecx, 0101A48A0h
    jmp sub_100FB4B3
    mov mov eax, dword ptr [g_1076ADB8]
    mov mov dword ptr [edx + eax], ecx
    add add ecx, 32
    add add edx, 4
    cmp cmp ecx, 0101A4B20h
    jl sub_100FB4C4
    xor xor ecx, ecx
    mov mov edx, 0101A48B0h
    mov mov esi, ecx
    mov mov eax, ecx
    and and eax, 31
    sar sar esi, 5
    mov mov esi, dword ptr [esi*4 + 01076ACA0h]
    lea lea eax, [eax + eax*8]
    mov mov eax, dword ptr [esi + eax*4]
    cmp cmp eax, -1
    je sub_100FB524
    test test eax, eax
    jne sub_100FB52B
    or or dword ptr [edx], -1
    add add edx, 32
    inc inc ecx
    cmp cmp edx, 0101A4910h
    jl sub_100FB517
    xor xor eax, eax
    pop pop esi
    ret ret
___initstdio ENDP
END
