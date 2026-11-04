.686
.MODEL FLAT, C
EXTRN sub_1002AC19:PROC
EXTRN sub_1002ADC6:PROC
EXTRN sub_1002AE33:PROC
EXTRN sub_1002AE3C:PROC
.CODE
FUN_1002acd0 PROC
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 12]
    push push edi
    mov mov edi, 9
    sub sub edi, ebp
    mov mov ebx, eax
    mov mov ecx, dword ptr [ebx + edi*8 + 0C404h]
    lea lea eax, [ebx + edi*8 + 0C400h]
    cmp cmp ecx, eax
    jne L0
    push push edi
    push push ebx
    call sub_1002AC19
    add add esp, 8
    test test al, al
    jne L1
    pop pop edi
    pop pop ebp
    xor xor eax, eax
    pop pop ebx
    ret ret
    mov mov ecx, dword ptr [ebx + edi*8 + 0C404h]
    mov mov edx, dword ptr [ecx + 4]
    mov mov eax, dword ptr [ecx]
    mov mov dword ptr [edx], eax
    mov mov edx, dword ptr [ecx]
    mov mov eax, dword ptr [ecx + 4]
    mov mov dword ptr [edx + 4], eax
    mov mov edx, ecx
    sub sub edx, ebx
    mov mov eax, 05397829Dh
    imul imul edx
    sar sar edx, 7
    push push esi
    mov mov esi, edx
    shr shr esi, 31
    add add esi, edx
    mov mov eax, esi
    imul imul eax, eax, 0188h
    add add eax, ebx
    test test edi, edi
    jne sub_1002ADC6
    lea lea edx, [ebx + 0C428h]
    mov mov dword ptr [eax], edx
    mov mov ebx, dword ptr [edx + 4]
    mov mov dword ptr [eax + 4], ebx
    mov mov dword ptr [edx + 4], eax
    mov mov edx, dword ptr [eax + 4]
    mov mov dword ptr [edx], eax
    sub sub ecx, eax
    sub sub ecx, 088h
    sar sar ecx, 4
    mov mov ebx, ecx
    mov mov ecx, 4
    sub sub ecx, edi
    lea lea edx, [ebx + 16]
    sar sar edx, cl
    mov mov byte ptr [eax + edx*4 + 10], 1
    dec dec edx
    js sub_1002AE33
    mov mov edi, 1
    mov mov ecx, ebp
    shl shl edi, cl
    add add word ptr [eax + edx*4 + 12], di
    dec dec edx
    sar sar edx, 1
    test test edx, edx
    jge sub_1002AE3C
    shl shl esi, 4
    mov mov ecx, ebx
    add add esi, ebx
    shl shl ecx, 4
    shl shl esi, 5
    lea lea eax, [ecx + eax + 088h]
    mov mov dword ptr [eax], esi
    pop pop esi
    pop pop edi
    pop pop ebp
    pop pop ebx
    ret ret
FUN_1002acd0 ENDP
END
