; __umatherr @ 0x10102999 — auto-synthesized
    sub_10102995 PROTO C
    sub_101029ba PROTO C
    sub_10102cdc PROTO C
    sub_10102d0f PROTO C
    sub_10107524 PROTO C
.CODE
__umatherr PROC
    push ebp
    mov ebp, esp
    sub esp, 0x20
    xor eax, eax
    mov ecx, dword ptr [eax*8 + 0x101a5128]
    cmp ecx, dword ptr [ebp + 0xc]
    je L0
    inc eax
    cmp eax, 0x1d
    jl L1
    xor eax, eax
    test eax, eax
    mov dword ptr [ebp - 0x1c], eax
    je L2
    mov eax, dword ptr [ebp + 0x10]
    mov dword ptr [ebp - 0x18], eax
    mov eax, dword ptr [ebp + 0x14]
    mov dword ptr [ebp - 0x14], eax
    mov eax, dword ptr [ebp + 0x18]
    mov dword ptr [ebp - 0x10], eax
    mov eax, dword ptr [ebp + 0x1c]
    push esi
    mov esi, dword ptr [ebp + 8]
    mov dword ptr [ebp - 0xc], eax
    mov eax, dword ptr [ebp + 0x20]
    mov dword ptr [ebp - 8], eax
    mov eax, dword ptr [ebp + 0x24]
    push 0xffff
    push dword ptr [ebp + 0x28]
    mov dword ptr [ebp - 0x20], esi
    mov dword ptr [ebp - 4], eax
    call sub_10102cdc
    lea eax, [ebp - 0x20]
    push eax
    call sub_10107524
    add esp, 0xc
    test eax, eax
    jne L3
    push esi
    call sub_10102995
    pop ecx
    fld qword ptr [ebp - 8]
    pop esi
    leave
    ret
    mov eax, dword ptr [eax*8 + 0x101a512c]
    jmp L4
    push 0xffff
    push dword ptr [ebp + 0x28]
    call sub_10102d0f
    push dword ptr [ebp + 8]
    call sub_101029ba
    fld qword ptr [ebp + 0x20]
    add esp, 0xc
    leave
    ret
__umatherr ENDP
END