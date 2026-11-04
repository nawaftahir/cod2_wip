; FUN_10009cf0 @ 0x10009cf0 — auto-synthesized
    EXTRN g_101ce5ec:DWORD
    EXTRN g_101d7e9c:DWORD
    EXTRN g_10678500:DWORD
    sub_100092ff PROTO C
    sub_1000942b PROTO C
    sub_10009beb PROTO C
    sub_100f883a PROTO C
.CODE
FUN_10009cf0 PROC
    mov eax, 0x1c08
    call sub_100f883a
    push ebp
    push esi
    push 0
    lea eax, [esp + 0xc14]
    push eax
    mov eax, dword ptr [esp + 0x1c1c]
    lea ecx, [esp + 0x18]
    push ecx
    push edi
    push ebx
    push edx
    push eax
    call sub_10009beb
    xor ebp, ebp
    add esp, 0x1c
    test eax, eax
    mov dword ptr [esp + 0xc], eax
    mov dword ptr [esp + 8], ebp
    jle L0
    lea esp, [esp]
    mov esi, dword ptr [esp + ebp*4 + 0xc10]
    push edi
    push ebx
    push esi
    call sub_100092ff
    mov al, byte ptr [g_101ce5ec]
    add esp, 0xc
    test al, al
    je L1
    mov eax, dword ptr [esi + 0x28]
    test eax, eax
    mov esi, dword ptr [esi + 0x2c]
    je L1
    mov ebp, eax
    jmp L2
    lea esp, [esp]
    mov ecx, dword ptr [g_101d7e9c]
    mov eax, dword ptr [esi]
    mov edx, dword ptr [ecx + eax*4]
    cmp edx, dword ptr [g_10678500]
    je L3
    push edi
    mov ecx, ebx
    call sub_1000942b
    add esp, 4
    add esi, 4
    dec ebp
    jne L2
    mov ebp, dword ptr [esp + 8]
    mov eax, dword ptr [esp + 0xc]
    inc ebp
    cmp ebp, eax
    mov dword ptr [esp + 8], ebp
    jl L4
    pop esi
    pop ebp
FUN_10009cf0 ENDP
END