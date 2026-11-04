.686
.MODEL FLAT, C
EXTRN sub_1001D378:PROC
.CODE
FUN_1001d170 PROC
    push ebx
    mov ebx, ecx
    sub eax, ebx
    mov ecx, eax
    mov eax, 02AAAAAABh
    imul ecx
    push ebp
    push esi
    sar edx, 1
    push edi
    mov edi, edx
    shr edi, 31
    add edi, edx
    mov eax, edi
    cdq
    sub eax, edx
    mov esi, eax
    sar esi, 1
    test esi, esi
    jle L1
    lea eax, [esi + esi*2]
    lea ebp, [ebx + eax*4]
    lea ecx, [ecx]
L0:
    mov ecx, dword ptr [esp + 20]
    push ecx
    sub ebp, 12
    sub esp, 12
    mov edx, ebp
    mov ecx, dword ptr [edx]
    mov eax, esp
    mov dword ptr [eax], ecx
    mov ecx, dword ptr [edx + 4]
    mov edx, dword ptr [edx + 8]
    mov dword ptr [eax + 4], ecx
    dec esi
    mov dword ptr [eax + 8], edx
    push edi
    mov eax, esi
    call sub_1001D378
    add esp, 20
    test esi, esi
    jg L0
L1:
    pop edi
    pop esi
    pop ebp
    pop ebx
    ret
FUN_1001d170 ENDP
END
