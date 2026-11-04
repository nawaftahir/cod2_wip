; FUN_10039670 @ 0x10039670 — auto-synthesized
    EXTRN g_1072d9bc:DWORD
    sub_1001390a PROTO C
    sub_10039639 PROTO C
.CODE
FUN_10039670 PROC
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 0x10]
    mov ebx, eax
    mov eax, dword ptr [ebx]
    push esi
    push edi
    mov edi, dword ptr [esp + 0x14]
    mov dword ptr [ebp], eax
    mov ecx, dword ptr [ebx + 4]
    xor esi, esi
    mov dword ptr [ebp + 4], ecx
    add edi, 4
    mov edi, edi
    mov eax, dword ptr [edi]
    mov ecx, ebp
    call sub_10039639
    test al, al
    jne L0
    mov edx, dword ptr [g_1072d9bc]
    mov eax, dword ptr [edx]
    mov ecx, dword ptr [esp + 0x14]
    mov edx, dword ptr [ecx]
    push eax
    push esi
    push edx
    push 0x10198ba8
    push 0
    call sub_1001390a
    add esp, 0x14
    inc esi
    add edi, 4
    cmp esi, 0xb
    jb L1
    pop edi
    pop esi
    pop ebp
    pop ebx
    ret
FUN_10039670 ENDP
END