.686
.MODEL FLAT, C
EXTRN sub_10086338:PROC
EXTRN sub_100F787B:PROC
.CODE
FUN_10086add PROC
    mov edi, edi
    push esi
    mov esi, ecx
    push dword ptr [esi + 0000000D0h]
    mov dword ptr [esi], 010110420h
    call sub_100F787B
    pop ecx
    mov ecx, dword ptr [esi + 0000000E0h]
    test ecx, ecx
    je L0
    mov eax, dword ptr [ecx]
    push 1
    call dword ptr [eax]
L0:
    mov ecx, esi
    pop esi
    jmp sub_10086338
FUN_10086add ENDP
END
