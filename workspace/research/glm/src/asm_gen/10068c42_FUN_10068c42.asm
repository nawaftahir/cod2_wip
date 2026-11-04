; FUN_10068c42 @ 0x10068c42 — auto-synthesized
    sub_10067c9b PROTO C
    sub_10067cb9 PROTO C
    sub_10067cf6 PROTO C
    sub_10067e9f PROTO C
    sub_100f6251 PROTO C
    sub_100f883f PROTO C
.CODE
FUN_10068c42 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, 0x1000
    call sub_100f883f
    push ebx
    mov ebx, dword ptr [ebp + 8]
    push esi
    mov esi, dword ptr [ebp + 0xc]
    push edi
    push 0xd
    mov edi, 0x1010c5e8
    pop ecx
    xor eax, eax
    mov dword ptr [ebx + 0x4c], 1
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L0
    mov ecx, dword ptr [ebx]
    lea esi, [ebx + 0x10]
    push esi
    push 0x7d0
    call sub_10067e9f
    cmp dword ptr [esi], 9
    jne L1
    mov eax, 0x7e7
    cmp dword ptr [ebx + 0x54], eax
    jne L2
    push dword ptr [ebx + 0x18]
    push 0x1010ec20
    push eax
    push esi
    push dword ptr [ebx]
    call sub_10067c9b
    add esp, 0x14
    mov eax, 0x7e8
    cmp dword ptr [ebx + 0x54], eax
    jne L1
    push dword ptr [ebx + 0x18]
    push 0x1010ebfc
    push eax
    push esi
    push dword ptr [ebx]
    call sub_10067cb9
    add esp, 0x14
    jmp L1
    lea eax, [ebp + 0x10]
    push eax
    push dword ptr [ebp + 0xc]
    lea eax, [ebp - 0x1000]
    push 0x1000
    push eax
    call sub_100f6251
    lea eax, [ebp - 0x1000]
    push eax
    push 0x10193358
    push 0
    lea eax, [ebx + 0x10]
    push eax
    push dword ptr [ebx]
    mov byte ptr [ebp - 0xf01], 0
    call sub_10067cf6
    add esp, 0x24
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_10068c42 ENDP
END