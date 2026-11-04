.686
.MODEL FLAT, C
EXTRN sub_10028763:PROC
EXTRN sub_1002877C:PROC
EXTRN sub_10028796:PROC
EXTRN sub_100287AA:PROC
EXTRN sub_100287C3:PROC
.CODE
FUN_10028580 PROC
    sub esp, 8
    push ebx
    mov ebx, dword ptr [esp + 20]
    push esi
    push edi
    mov edi, eax
    mov eax, ebx
    sub eax, edi
    sar eax, 3
    cmp eax, 40
    jle L0
    inc eax
    cdq
    and edx, 7
    add eax, edx
    sar eax, 3
    push ebp
    mov ebp, eax
    shl eax, 3
    lea esi, [eax + edi]
    mov dword ptr [esp + 16], eax
    mov eax, dword ptr [esp + 36]
    shl ebp, 4
    push eax
    lea ebx, [edi + ebp]
    mov dword ptr [esp + 24], esi
    call sub_10028763
    mov esi, dword ptr [esp + 32]
    mov eax, dword ptr [esp + 20]
    mov ecx, dword ptr [esp + 40]
    mov edi, esi
    push ecx
    lea ebx, [eax + esi]
    sub edi, eax
    call sub_1002877C
    mov ebx, dword ptr [esp + 40]
    mov edx, dword ptr [esp + 24]
    mov esi, ebx
    sub esi, edx
    mov edx, dword ptr [esp + 44]
    mov edi, ebx
    push edx
    sub edi, ebp
    call sub_10028796
    mov eax, dword ptr [esp + 48]
    mov edi, dword ptr [esp + 32]
    mov ebx, esi
    mov esi, dword ptr [esp + 40]
    push eax
    call sub_100287AA
    add esp, 16
    pop ebp
    pop edi
    pop esi
    pop ebx
    add esp, 8
    ret
L0:
    mov ecx, dword ptr [esp + 32]
    mov esi, dword ptr [esp + 24]
    push ecx
    call sub_100287C3
    add esp, 4
    pop edi
    pop esi
    pop ebx
    add esp, 8
    ret
FUN_10028580 ENDP
END
