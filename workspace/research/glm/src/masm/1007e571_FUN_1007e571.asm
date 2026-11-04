.686
.MODEL FLAT, C
.CODE
FUN_1007e571 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, dword ptr [ebp + 24]
    mov edx, esi
    shl edx, 2
    je L1
    mov eax, dword ptr [ebp + 20]
    mov ecx, dword ptr [ebp + 16]
    sub ecx, eax
L0:
    fild dword ptr [ecx + eax]
    fstp dword ptr [eax]
    add eax, 4
    dec edx
    jne L0
L1:
    mov eax, dword ptr [ebp + 8]
    mov ecx, dword ptr [eax]
    push esi
    push dword ptr [ebp + 16]
    push dword ptr [ebp + 12]
    push eax
    call dword ptr [ecx + 0x178]
    pop esi
    pop ebp
    ret 20
FUN_1007e571 ENDP
END
