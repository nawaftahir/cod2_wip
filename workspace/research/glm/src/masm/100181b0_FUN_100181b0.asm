.686
.MODEL FLAT, C
.CODE
FUN_100181b0 PROC
    push ecx
    push ebp
    mov ebp, dword ptr [esp + 12]
    push esi
    push edi
    mov edi, eax
    sub edi, ebp
    mov ecx, ebx
    sub ecx, ebp
    sar edi, 2
    sar ecx, 2
    test edi, edi
    mov eax, ecx
    mov esi, edi
    je L1
    mov edi, edi
L0:
    cdq
    idiv esi
    mov eax, esi
    test edx, edx
    mov esi, edx
    jne L0
L1:
    cmp eax, ecx
    jge L8
    test eax, eax
    jle L8
    lea esi, [ebp + eax*4]
    mov dword ptr [esp + 20], eax
    jmp L2
    lea ecx, [ecx]
L2:
    mov eax, dword ptr [esi]
    lea ecx, [esi + edi*4]
    cmp ecx, ebx
    mov edx, esi
    mov dword ptr [esp + 12], eax
    jne L3
    mov ecx, ebp
L3:
    cmp ecx, esi
    je L7
L4:
    mov eax, dword ptr [ecx]
    mov dword ptr [edx], eax
    mov eax, ebx
    sub eax, ecx
    sar eax, 2
    cmp edi, eax
    mov edx, ecx
    jge L5
    lea eax, [edi*4]
    add ecx, eax
    jmp L6
L5:
    mov ecx, edi
    sub ecx, eax
    lea ecx, [ebp + ecx*4]
L6:
    cmp ecx, esi
    jne L4
L7:
    mov eax, dword ptr [esp + 12]
    mov dword ptr [edx], eax
    mov eax, dword ptr [esp + 20]
    sub esi, 4
    dec eax
    mov dword ptr [esp + 20], eax
    jne L2
L8:
    pop edi
    pop esi
FUN_100181b0 ENDP
END
