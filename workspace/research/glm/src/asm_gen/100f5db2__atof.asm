; _atof @ 0x100f5db2 — auto-synthesized
    sub_100f8683 PROTO C
    sub_100fa223 PROTO C
    sub_100fa2ba PROTO C
.CODE
_atof PROC
    push ebp
    mov ebp, esp
    sub esp, 0x18
    push esi
    mov esi, dword ptr [ebp + 8]
    jmp L0
    inc esi
    movzx eax, byte ptr [esi]
    push eax
    call sub_100f8683
    test eax, eax
    pop ecx
    jne L1
    push eax
    push eax
    push esi
    call sub_100fa223
    pop ecx
    push eax
    lea eax, [ebp - 0x18]
    push esi
    push eax
    call sub_100fa2ba
    fld qword ptr [eax + 0x10]
    add esp, 0x14
    pop esi
    leave
    ret
_atof ENDP
END