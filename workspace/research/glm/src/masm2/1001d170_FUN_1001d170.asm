.686
.MODEL FLAT, C
EXTRN sub_1001D1F6:PROC
EXTRN sub_1001D1FF:PROC
EXTRN sub_1001D378:PROC
.CODE
FUN_1001d170 PROC
    push push ebx
    mov mov ebx, ecx
    sub sub eax, ebx
    mov mov ecx, eax
    mov mov eax, 02AAAAAABh
    imul imul ecx
    push push ebp
    push push esi
    sar sar edx, 1
    push push edi
    mov mov edi, edx
    shr shr edi, 31
    add add edi, edx
    mov mov eax, edi
    cdq cdq
    sub sub eax, edx
    mov mov esi, eax
    sar sar esi, 1
    test test esi, esi
    jle sub_1001D1F6
    lea lea eax, [esi + esi*2]
    lea lea ebp, [ebx + eax*4]
    lea lea ecx, [ecx]
    mov mov ecx, dword ptr [esp + 20]
    push push ecx
    sub sub ebp, 12
    sub sub esp, 12
    mov mov edx, ebp
    mov mov ecx, dword ptr [edx]
    mov mov eax, esp
    mov mov dword ptr [eax], ecx
    mov mov ecx, dword ptr [edx + 4]
    mov mov edx, dword ptr [edx + 8]
    mov mov dword ptr [eax + 4], ecx
    dec dec esi
    mov mov dword ptr [eax + 8], edx
    push push edi
    mov mov eax, esi
    call sub_1001D378
    add add esp, 20
    test test esi, esi
    jg sub_1001D1FF
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    ret ret
FUN_1001d170 ENDP
END
