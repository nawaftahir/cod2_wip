.686
.MODEL FLAT, C
EXTRN sub_1001D500:PROC
.CODE
FUN_1001d320 PROC
    push ebp
    mov ebp, dword ptr [esp + 8]
    push esi
    push edi
    mov edi, eax
    lea esi, [edi + edi + 2]
    cmp esi, ebp
    mov dword ptr [esp + 16], edi
    jge L2
L0:
    lea eax, [esi + esi*2]
    lea eax, [ebx + eax*4]
    lea ecx, [eax - 12]
    push ecx
    push eax
    call dword ptr [esp + 0x28]
    add esp, 8
    test al, al
    je L1
    dec esi
L1:
    lea edx, [esi + esi*2]
    lea eax, [ebx + edx*4]
    lea ecx, [edi + edi*2]
    lea edx, [ebx + ecx*4]
    mov ecx, dword ptr [eax]
    mov dword ptr [edx], ecx
    mov ecx, dword ptr [eax + 4]
    mov dword ptr [edx + 4], ecx
    mov eax, dword ptr [eax + 8]
    mov edi, esi
    lea esi, [esi + esi + 2]
    cmp esi, ebp
    mov dword ptr [edx + 8], eax
    jl L0
L2:
    jne L3
    lea ecx, [ebp + ebp*2]
    lea edx, [ebx + ecx*4 - 12]
    lea eax, [edi + edi*2]
    lea ecx, [ebx + eax*4]
    mov eax, dword ptr [edx]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [edx + 4]
    mov dword ptr [ecx + 4], eax
    mov edx, dword ptr [edx + 8]
    mov dword ptr [ecx + 8], edx
    lea edi, [ebp - 1]
L3:
    mov eax, dword ptr [esp + 32]
    mov edx, dword ptr [esp + 20]
    push eax
    mov eax, dword ptr [esp + 28]
    sub esp, 12
    mov ecx, esp
    mov dword ptr [ecx], edx
    mov edx, dword ptr [esp + 44]
    mov dword ptr [ecx + 4], eax
    mov eax, dword ptr [esp + 32]
    push eax
    push ebx
    mov eax, edi
    mov dword ptr [ecx + 8], edx
    call sub_1001D500
    add esp, 24
    pop edi
    pop esi
    pop ebp
    ret
FUN_1001d320 ENDP
END
