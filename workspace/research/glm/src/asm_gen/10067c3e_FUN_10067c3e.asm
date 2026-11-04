; FUN_10067c3e @ 0x10067c3e — auto-synthesized
    sub_100676f6 PROTO C
    sub_100f6257 PROTO C
    sub_100f78b2 PROTO C
    sub_100f78d9 PROTO C
    sub_100f78fb PROTO C
    sub_100f883f PROTO C
.CODE
FUN_10067c3e PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, 0x1000
    call sub_100f883f
    push ebx
    mov ebx, dword ptr [ebp + 0xc]
    test ebx, ebx
    push esi
    push edi
    lea esi, [ebp - 0x1000]
    mov edi, 0xffe
    je L0
    mov eax, dword ptr [ebx + 0x10]
    test eax, eax
    je L1
    push eax
    push 0x10193358
    mov eax, esi
    push edi
    push eax
    call sub_100f78b2
    add esp, 0x10
    test eax, eax
    jge L2
    mov eax, edi
    lea esi, [ebp + eax - 0x1000]
    sub edi, eax
    mov eax, dword ptr [ebx + 0x14]
    test eax, eax
    jne L3
    inc eax
    push eax
    push 0x1010ca14
    push edi
    push esi
    call sub_100f78d9
    add esp, 0x10
    test eax, eax
    jge L4
    mov eax, edi
    add esi, eax
    sub edi, eax
    cmp dword ptr [ebp + 0x10], 0
    je L5
    push dword ptr [ebp + 0x10]
    push 0x1010ca08
    push edi
    push esi
    call sub_100f78fb
    add esp, 0x10
    test eax, eax
    jge L6
    mov eax, edi
    add esi, eax
    sub edi, eax
    lea eax, [ebp + 0x18]
    push eax
    push dword ptr [ebp + 0x14]
    push edi
    push esi
    call sub_100f6257
    add esp, 0x10
    test eax, eax
    jge L7
    mov eax, edi
    mov ecx, dword ptr [ebp + 8]
    add esi, eax
    lea eax, [ebp - 0x1000]
    mov byte ptr [esi], 0xa
    mov byte ptr [esi + 1], 0
    inc dword ptr [ecx + 8]
    push eax
    call sub_100676f6
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_10067c3e ENDP
END