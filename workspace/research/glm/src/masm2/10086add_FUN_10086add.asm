.686
.MODEL FLAT, C
EXTRN sub_10086338:PROC
EXTRN sub_10086B25:PROC
EXTRN sub_100F787B:PROC
.CODE
FUN_10086add PROC
    mov mov edi, edi
    push push esi
    mov mov esi, ecx
    push push dword ptr [esi + 0D0h]
    mov mov dword ptr [esi], 010110420h
    call sub_100F787B
    pop pop ecx
    mov mov ecx, dword ptr [esi + 0E0h]
    test test ecx, ecx
    je sub_10086B25
    mov mov eax, dword ptr [ecx]
    push push 1
    call call dword ptr [eax]
    mov mov ecx, esi
    pop pop esi
    jmp sub_10086338
FUN_10086add ENDP
END
