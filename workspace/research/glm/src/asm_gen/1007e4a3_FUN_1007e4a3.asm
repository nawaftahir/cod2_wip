; FUN_1007e4a3 @ 0x1007e4a3 — auto-synthesized
.CODE
FUN_1007e4a3 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push esi
    mov esi, dword ptr [ebp + 0x18]
    mov edx, esi
    shl edx, 2
    fnstcw word ptr [ebp + 0x18]
    mov eax, dword ptr [ebp + 0x18]
    or eax, 0xc00
    mov dword ptr [ebp - 4], eax
    fldcw word ptr [ebp - 4]
    test edx, edx
    mov eax, dword ptr [ebp + 0x18]
    mov dword ptr [ebp - 4], eax
    jbe L0
    mov eax, dword ptr [ebp + 0x14]
    mov ecx, dword ptr [ebp + 0x10]
    sub ecx, eax
    push edi
    fld dword ptr [ecx + eax]
    fstp dword ptr [ebp + 0x18]
    fld dword ptr [ebp + 0x18]
    fistp dword ptr [ebp + 0x14]
    mov edi, dword ptr [ebp + 0x14]
    mov dword ptr [eax], edi
    add eax, 4
    dec edx
    jne L1
    pop edi
    fldcw word ptr [ebp - 4]
    mov eax, dword ptr [ebp + 8]
    mov ecx, dword ptr [eax]
    push esi
    push dword ptr [ebp + 0x10]
    push dword ptr [ebp + 0xc]
    push eax
    call dword ptr [ecx + 0x180]
    pop esi
    leave
    ret 0x14
FUN_1007e4a3 ENDP
END