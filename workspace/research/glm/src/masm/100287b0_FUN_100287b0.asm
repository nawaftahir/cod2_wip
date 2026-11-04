.686
.MODEL FLAT, C
EXTRN sub_10028901:PROC
.CODE
FUN_100287b0 PROC
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 12]
    mov ebx, eax
    push esi
    lea esi, [ebx + ebx + 2]
    cmp esi, ebp
    mov dword ptr [esp + 16], ebx
    jge L2
L0:
    lea eax, [edi + esi*8]
    lea ecx, [eax - 8]
    push ecx
    push eax
    call dword ptr [esp + 0x24]
    add esp, 8
    test al, al
    je L1
    dec esi
L1:
    mov edx, dword ptr [edi + esi*8]
    mov dword ptr [edi + ebx*8], edx
    mov eax, dword ptr [edi + esi*8 + 4]
    mov dword ptr [edi + ebx*8 + 4], eax
    mov ebx, esi
    lea esi, [esi + esi + 2]
    cmp esi, ebp
    jl L0
L2:
    jne L3
    mov ecx, dword ptr [edi + ebp*8 - 8]
    mov dword ptr [edi + ebx*8], ecx
    mov edx, dword ptr [edi + ebp*8 - 4]
    mov dword ptr [edi + ebx*8 + 4], edx
    lea ebx, [ebp - 1]
L3:
    mov eax, dword ptr [esp + 28]
    mov ecx, dword ptr [esp + 24]
    mov edx, dword ptr [esp + 20]
    push eax
    mov eax, dword ptr [esp + 20]
    push ecx
    push edx
    push eax
    push edi
    mov eax, ebx
    call sub_10028901
    add esp, 20
    pop esi
    pop ebp
    pop ebx
    ret
FUN_100287b0 ENDP
END
