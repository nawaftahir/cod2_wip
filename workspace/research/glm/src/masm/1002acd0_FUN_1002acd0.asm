.686
.MODEL FLAT, C
EXTRN sub_1002AC19:PROC
.CODE
FUN_1002acd0 PROC
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 12]
    push edi
    mov edi, 9
    sub edi, ebp
    mov ebx, eax
    mov ecx, dword ptr [ebx + edi*8 + 00000C404h]
    lea eax, [ebx + edi*8 + 00000C400h]
    cmp ecx, eax
    jne L0
    push edi
    push ebx
    call sub_1002AC19
    add esp, 8
    test al, al
    jne L0
    pop edi
    pop ebp
    xor eax, eax
    pop ebx
    ret
L0:
    mov ecx, dword ptr [ebx + edi*8 + 00000C404h]
    mov edx, dword ptr [ecx + 4]
    mov eax, dword ptr [ecx]
    mov dword ptr [edx], eax
    mov edx, dword ptr [ecx]
    mov eax, dword ptr [ecx + 4]
    mov dword ptr [edx + 4], eax
    mov edx, ecx
    sub edx, ebx
    mov eax, 05397829Dh
    imul edx
    sar edx, 7
    push esi
    mov esi, edx
    shr esi, 31
    add esi, edx
    mov eax, esi
    imul eax, eax, 000000188h
    add eax, ebx
    test edi, edi
    jne L1
    lea edx, [ebx + 00000C428h]
    mov dword ptr [eax], edx
    mov ebx, dword ptr [edx + 4]
    mov dword ptr [eax + 4], ebx
    mov dword ptr [edx + 4], eax
    mov edx, dword ptr [eax + 4]
    mov dword ptr [edx], eax
L1:
    sub ecx, eax
    sub ecx, 000000088h
    sar ecx, 4
    mov ebx, ecx
    mov ecx, 4
    sub ecx, edi
    lea edx, [ebx + 16]
    sar edx, cl
    mov byte ptr [eax + edx*4 + 10], 1
    dec edx
    js L3
    mov edi, 1
    mov ecx, ebp
    shl edi, cl
L2:
    add word ptr [eax + edx*4 + 12], di
    dec edx
    sar edx, 1
    test edx, edx
    jge L2
L3:
    shl esi, 4
    mov ecx, ebx
    add esi, ebx
    shl ecx, 4
    shl esi, 5
    lea eax, [ecx + eax + 000000088h]
    mov dword ptr [eax], esi
    pop esi
    pop edi
    pop ebp
    pop ebx
    ret
FUN_1002acd0 ENDP
END
