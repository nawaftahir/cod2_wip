; FID_conflict:vswprintf @ 0x100f93bb — auto-synthesized
    sub_100fa36e PROTO C
    sub_100fa388 PROTO C
    sub_1010555a PROTO C
.CODE
FID_conflict:vswprintf PROC
    push ebp
    mov ebp, esp
    sub esp, 0x20
    mov eax, dword ptr [ebp + 8]
    mov dword ptr [ebp - 0x18], eax
    mov dword ptr [ebp - 0x20], eax
    mov eax, dword ptr [ebp + 0xc]
    push esi
    push dword ptr [ebp + 0x14]
    add eax, eax
    push dword ptr [ebp + 0x10]
    mov dword ptr [ebp - 0x1c], eax
    lea eax, [ebp - 0x20]
    push eax
    mov dword ptr [ebp - 0x14], 0x42
    call sub_1010555a
    add esp, 0xc
    dec dword ptr [ebp - 0x1c]
    mov esi, eax
    js L0
    mov eax, dword ptr [ebp - 0x20]
    mov byte ptr [eax], 0
    inc dword ptr [ebp - 0x20]
    jmp L1
    lea eax, [ebp - 0x20]
    push eax
    push 0
    call sub_100fa36e
    pop ecx
    pop ecx
    dec dword ptr [ebp - 0x1c]
    js L2
    mov eax, dword ptr [ebp - 0x20]
    mov byte ptr [eax], 0
    jmp L3
    lea eax, [ebp - 0x20]
    push eax
    push 0
    call sub_100fa388
    pop ecx
    pop ecx
    mov eax, esi
    pop esi
    leave
    ret
FID_conflict:vswprintf ENDP
END