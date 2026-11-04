.686
.MODEL FLAT, C
EXTRN sub_1001430D:PROC
EXTRN sub_10014444:PROC
.CODE
FUN_10014230 PROC
    push push ebp
    mov mov ebp, dword ptr [esp + 8]
    push push esi
    push push edi
    mov mov edi, eax
    lea lea esi, [edi + edi + 2]
    cmp cmp esi, ebp
    mov mov dword ptr [esp + 16], edi
    jge L1
    mov mov eax, esi
    shl shl eax, 4
    add add eax, ebx
    lea lea ecx, [eax - 16]
    push push ecx
    push push eax
    call call dword ptr [esp + 44]
    add add esp, 8
    test test al, al
    je L0
    dec dec esi
    mov mov edx, esi
    shl shl edx, 4
    shl shl edi, 4
    add add edx, ebx
    mov mov eax, dword ptr [edx]
    add add edi, ebx
    mov mov dword ptr [edi], eax
    mov mov ecx, dword ptr [edx + 4]
    mov mov dword ptr [edi + 4], ecx
    mov mov eax, dword ptr [edx + 8]
    mov mov dword ptr [edi + 8], eax
    mov mov ecx, dword ptr [edx + 12]
    mov mov dword ptr [edi + 12], ecx
    mov mov edi, esi
    lea lea esi, [esi + esi + 2]
    cmp cmp esi, ebp
    jl L1
L0:
    jne sub_1001430D
    mov mov edx, ebp
    shl shl edx, 4
    shl shl edi, 4
    lea lea eax, [edx + ebx - 16]
    mov mov ecx, dword ptr [eax]
    add add edi, ebx
    mov mov dword ptr [edi], ecx
    mov mov edx, dword ptr [eax + 4]
    mov mov dword ptr [edi + 4], edx
    mov mov ecx, dword ptr [eax + 8]
    mov mov dword ptr [edi + 8], ecx
    mov mov edx, dword ptr [eax + 12]
    mov mov dword ptr [edi + 12], edx
    lea lea edi, [ebp - 1]
    mov mov eax, dword ptr [esp + 36]
    mov mov edx, dword ptr [esp + 20]
    push push eax
    mov mov eax, dword ptr [esp + 28]
    sub sub esp, 16
    mov mov ecx, esp
    mov mov dword ptr [ecx], edx
    mov mov edx, dword ptr [esp + 48]
    mov mov dword ptr [ecx + 4], eax
    mov mov eax, dword ptr [esp + 52]
    mov mov dword ptr [ecx + 8], edx
    mov mov dword ptr [ecx + 12], eax
    mov mov ecx, dword ptr [esp + 36]
    push push ecx
    push push ebx
    mov mov eax, edi
    call sub_10014444
    add add esp, 28
    pop pop edi
    pop pop esi
    pop pop ebp
    ret ret
FUN_10014230 ENDP
END
