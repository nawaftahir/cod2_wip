.686
.MODEL FLAT, C
EXTRN sub_10028848:PROC
EXTRN sub_10028901:PROC
.CODE
FUN_100287b0 PROC
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 12]
    mov mov ebx, eax
    push push esi
    lea lea esi, [ebx + ebx + 2]
    cmp cmp esi, ebp
    mov mov dword ptr [esp + 16], ebx
    jge L1
    lea lea eax, [edi + esi*8]
    lea lea ecx, [eax - 8]
    push push ecx
    push push eax
    call call dword ptr [esp + 36]
    add add esp, 8
    test test al, al
    je L0
    dec dec esi
    mov mov edx, dword ptr [edi + esi*8]
    mov mov dword ptr [edi + ebx*8], edx
    mov mov eax, dword ptr [edi + esi*8 + 4]
    mov mov dword ptr [edi + ebx*8 + 4], eax
    mov mov ebx, esi
    lea lea esi, [esi + esi + 2]
    cmp cmp esi, ebp
    jl L1
    jne sub_10028848
    mov mov ecx, dword ptr [edi + ebp*8 - 8]
    mov mov dword ptr [edi + ebx*8], ecx
    mov mov edx, dword ptr [edi + ebp*8 - 4]
    mov mov dword ptr [edi + ebx*8 + 4], edx
    lea lea ebx, [ebp - 1]
    mov mov eax, dword ptr [esp + 28]
    mov mov ecx, dword ptr [esp + 24]
    mov mov edx, dword ptr [esp + 20]
    push push eax
    mov mov eax, dword ptr [esp + 20]
    push push ecx
    push push edx
    push push eax
    push push edi
    mov mov eax, ebx
    call sub_10028901
    add add esp, 20
    pop pop esi
    pop pop ebp
    pop pop ebx
    ret ret
FUN_100287b0 ENDP
END
