.686
.MODEL FLAT, C
.CODE
FUN_1007e4a3 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push esi
    mov esi, dword ptr [ebp + 24]
    mov edx, esi
    shl edx, 2
    fnstcw word ptr [ebp + 24]
    mov eax, dword ptr [ebp + 24]
    or eax, 000000C00h
    mov dword ptr [ebp - 4], eax
    fldcw word ptr [ebp - 4]
    test edx, edx
    mov eax, dword ptr [ebp + 24]
    mov dword ptr [ebp - 4], eax
    jbe L1
    mov eax, dword ptr [ebp + 20]
    mov ecx, dword ptr [ebp + 16]
    sub ecx, eax
    push edi
L0:
    fld dword ptr [ecx + eax]
    fstp dword ptr [ebp + 24]
    fld dword ptr [ebp + 24]
    fistp dword ptr [ebp + 20]
    mov edi, dword ptr [ebp + 20]
    mov dword ptr [eax], edi
    add eax, 4
    dec edx
    jne L0
    pop edi
L1:
    fldcw word ptr [ebp - 4]
    mov eax, dword ptr [ebp + 8]
    mov ecx, dword ptr [eax]
    push esi
    push dword ptr [ebp + 16]
    push dword ptr [ebp + 12]
    push eax
    call dword ptr [ecx + 0x180]
    pop esi
    leave
    ret 20
FUN_1007e4a3 ENDP
END
