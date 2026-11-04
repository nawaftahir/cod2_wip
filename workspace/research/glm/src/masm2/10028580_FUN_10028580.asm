.686
.MODEL FLAT, C
EXTRN sub_1002862D:PROC
EXTRN sub_10028763:PROC
EXTRN sub_1002877C:PROC
EXTRN sub_10028796:PROC
EXTRN sub_100287AA:PROC
EXTRN sub_100287C3:PROC
.CODE
FUN_10028580 PROC
    sub sub esp, 8
    push push ebx
    mov mov ebx, dword ptr [esp + 20]
    push push esi
    push push edi
    mov mov edi, eax
    mov mov eax, ebx
    sub sub eax, edi
    sar sar eax, 3
    cmp cmp eax, 40
    jle sub_1002862D
    inc inc eax
    cdq cdq
    and and edx, 7
    add add eax, edx
    sar sar eax, 3
    push push ebp
    mov mov ebp, eax
    shl shl eax, 3
    lea lea esi, [eax + edi]
    mov mov dword ptr [esp + 16], eax
    mov mov eax, dword ptr [esp + 36]
    shl shl ebp, 4
    push push eax
    lea lea ebx, [edi + ebp]
    mov mov dword ptr [esp + 24], esi
    call sub_10028763
    mov mov esi, dword ptr [esp + 32]
    mov mov eax, dword ptr [esp + 20]
    mov mov ecx, dword ptr [esp + 40]
    mov mov edi, esi
    push push ecx
    lea lea ebx, [eax + esi]
    sub sub edi, eax
    call sub_1002877C
    mov mov ebx, dword ptr [esp + 40]
    mov mov edx, dword ptr [esp + 24]
    mov mov esi, ebx
    sub sub esi, edx
    mov mov edx, dword ptr [esp + 44]
    mov mov edi, ebx
    push push edx
    sub sub edi, ebp
    call sub_10028796
    mov mov eax, dword ptr [esp + 48]
    mov mov edi, dword ptr [esp + 32]
    mov mov ebx, esi
    mov mov esi, dword ptr [esp + 40]
    push push eax
    call sub_100287AA
    add add esp, 16
    pop pop ebp
    pop pop edi
    pop pop esi
    pop pop ebx
    add add esp, 8
    ret ret
    mov mov ecx, dword ptr [esp + 32]
    mov mov esi, dword ptr [esp + 24]
    push push ecx
    call sub_100287C3
    add add esp, 4
    pop pop edi
    pop pop esi
    pop pop ebx
    add add esp, 8
    ret ret
FUN_10028580 ENDP
END
