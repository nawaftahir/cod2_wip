.686
.MODEL FLAT, C
EXTRN sub_1000E323:PROC
EXTRN sub_1000E32A:PROC
EXTRN sub_1000E32F:PROC
EXTRN sub_1000E337:PROC
EXTRN sub_1000E33C:PROC
EXTRN sub_1000E340:PROC
EXTRN sub_1000E341:PROC
EXTRN sub_1000E356:PROC
EXTRN sub_1000E371:PROC
EXTRN sub_1000E375:PROC
EXTRN sub_1000E81E:PROC
.CODE
FUN_1000e280 PROC
    mov mov eax, dword ptr [esp + 8]
    push push edi
    mov mov edi, dword ptr [esp + 8]
    cmp cmp edi, eax
    je sub_1000E323
    push push esi
    lea lea esi, [edi + 4]
    cmp cmp esi, eax
    je sub_1000E32A
    push push ebx
    push push ebp
    lea lea ebp, [esi + 4]
    jmp L0
    mov mov edi, dword ptr [esp + 20]
    mov mov eax, dword ptr [edi]
    mov mov ecx, dword ptr [esi]
    mov mov ebx, dword ptr [esp + 28]
    push push eax
    push push ecx
    call call ebx
    add add esp, 8
    test test eax, eax
    je L1
    cmp cmp edi, esi
    je sub_1000E33C
    cmp cmp esi, ebp
    je sub_1000E340
    push push edi
    jmp sub_1000E337
    mov mov edx, dword ptr [ebp - 8]
    mov mov eax, dword ptr [esi]
    lea lea edi, [ebp - 8]
    push push edx
    push push eax
    call call ebx
    add add esp, 8
    test test eax, eax
    je sub_1000E356
    mov mov ecx, dword ptr [edi - 4]
    mov mov edx, dword ptr [esi]
    mov mov ebx, edi
    sub sub edi, 4
    push push ecx
    push push edx
    call call dword ptr [esp + 36]
    add add esp, 8
    test test eax, eax
    jne sub_1000E341
    cmp cmp ebx, esi
    je sub_1000E371
    cmp cmp esi, ebp
    je sub_1000E375
    push push ebx
    mov mov eax, esi
    mov mov ebx, ebp
L1:
    call sub_1000E81E
    add add esp, 4
    mov mov eax, dword ptr [esp + 24]
    add add esi, 4
    add add ebp, 4
    cmp cmp esi, eax
    jne sub_1000E32F
    pop pop ebp
    pop pop ebx
    pop pop esi
    pop pop edi
    ret ret
FUN_1000e280 ENDP
END
