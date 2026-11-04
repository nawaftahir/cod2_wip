.686
.MODEL FLAT, C
EXTRN sub_1001D3E9:PROC
EXTRN sub_1001D500:PROC
.CODE
FUN_1001d320 PROC
    push push ebp
    mov mov ebp, dword ptr [esp + 8]
    push push esi
    push push edi
    mov mov edi, eax
    lea lea esi, [edi + edi + 2]
    cmp cmp esi, ebp
    mov mov dword ptr [esp + 16], edi
    jge L1
    lea lea eax, [esi + esi*2]
    lea lea eax, [ebx + eax*4]
    lea lea ecx, [eax - 12]
    push push ecx
    push push eax
    call call dword ptr [esp + 40]
    add add esp, 8
    test test al, al
    je L0
    dec dec esi
    lea lea edx, [esi + esi*2]
    lea lea eax, [ebx + edx*4]
    lea lea ecx, [edi + edi*2]
    lea lea edx, [ebx + ecx*4]
    mov mov ecx, dword ptr [eax]
    mov mov dword ptr [edx], ecx
    mov mov ecx, dword ptr [eax + 4]
    mov mov dword ptr [edx + 4], ecx
    mov mov eax, dword ptr [eax + 8]
    mov mov edi, esi
    lea lea esi, [esi + esi + 2]
    cmp cmp esi, ebp
    mov mov dword ptr [edx + 8], eax
    jl L1
    jne sub_1001D3E9
    lea lea ecx, [ebp + ebp*2]
    lea lea edx, [ebx + ecx*4 - 12]
    lea lea eax, [edi + edi*2]
    lea lea ecx, [ebx + eax*4]
    mov mov eax, dword ptr [edx]
    mov mov dword ptr [ecx], eax
    mov mov eax, dword ptr [edx + 4]
    mov mov dword ptr [ecx + 4], eax
    mov mov edx, dword ptr [edx + 8]
    mov mov dword ptr [ecx + 8], edx
    lea lea edi, [ebp - 1]
    mov mov eax, dword ptr [esp + 32]
    mov mov edx, dword ptr [esp + 20]
    push push eax
    mov mov eax, dword ptr [esp + 28]
    sub sub esp, 12
    mov mov ecx, esp
    mov mov dword ptr [ecx], edx
    mov mov edx, dword ptr [esp + 44]
    mov mov dword ptr [ecx + 4], eax
    mov mov eax, dword ptr [esp + 32]
    push push eax
    push push ebx
    mov mov eax, edi
    mov mov dword ptr [ecx + 8], edx
    call sub_1001D500
    add add esp, 24
    pop pop edi
    pop pop esi
    pop pop ebp
    ret ret
FUN_1001d320 ENDP
END
