.686
.MODEL FLAT, C
EXTRN sub_10018108:PROC
EXTRN sub_1001819F:PROC
.CODE
FUN_10018080 PROC
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 12]
    push push esi
    push push edi
    mov mov edi, eax
    lea lea esi, [edi + edi + 2]
    cmp cmp esi, ebp
    mov mov ebx, ecx
    mov mov dword ptr [esp + 20], edi
    jge L0
    mov mov eax, dword ptr [ebx + esi*4 - 4]
    mov mov ecx, dword ptr [ebx + esi*4]
    push push eax
    push push ecx
    call call dword ptr [esp + 36]
    add add esp, 8
    test test al, al
    je L1
    dec dec esi
    mov mov edx, dword ptr [ebx + esi*4]
    mov mov dword ptr [ebx + edi*4], edx
    mov mov edi, esi
    lea lea esi, [esi + esi + 2]
    cmp cmp esi, ebp
    jl L0
    jne sub_10018108
    mov mov eax, dword ptr [ebx + ebp*4 - 4]
    mov mov dword ptr [ebx + edi*4], eax
    lea lea edi, [ebp - 1]
    mov mov ecx, dword ptr [esp + 28]
    mov mov edx, dword ptr [esp + 24]
    mov mov eax, dword ptr [esp + 20]
L0:
    push push ecx
    push push edx
    push push eax
    mov mov eax, edi
    call sub_1001819F
    add add esp, 12
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    ret ret
FUN_10018080 ENDP
END
