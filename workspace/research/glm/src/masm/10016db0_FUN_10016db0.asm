.686
.MODEL FLAT, C
.CODE
FUN_10016db0 PROC
    push esi
    xor esi, esi
L0:
    mov eax, dword ptr [esi + 0101DA564h]
    test eax, eax
    je L2
    mov cl, byte ptr [eax + 10]
    test cl, cl
    mov eax, dword ptr [eax + 12]
    push eax
    jne L1
    mov ecx, dword ptr [eax]
    call dword ptr [ecx + 8]
    jmp L2
L1:
    mov edx, dword ptr [eax]
    call dword ptr [edx + 8]
L2:
    add esi, 4
    cmp esi, 000000400h
    jb L0
    pop esi
    ret
FUN_10016db0 ENDP
END
