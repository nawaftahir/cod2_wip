.686
.MODEL FLAT, C
EXTRN sub_100259F4:PROC
EXTRN sub_10025AAF:PROC
EXTRN sub_10025BD7:PROC
EXTRN sub_10025C60:PROC
.CODE
FUN_10025d10 PROC
    mov edx, dword ptr [esp + 4]
    sub esp, 12
    cmp edx, edi
    push ebx
    push ebp
    jle L2
    mov eax, dword ptr [esp + 36]
    mov dword ptr [esp + 8], eax
    mov dword ptr [esp + 12], eax
    mov eax, dword ptr [esp + 28]
    test eax, eax
    jle L5
    mov ebx, edx
    mov ebp, edi
    imul ebx, esi
    imul ebp, esi
    mov dword ptr [esp + 16], eax
    jmp L1
L0:
    mov edx, dword ptr [esp + 24]
    lea esp, [esp]
L1:
    mov eax, dword ptr [esp + 12]
    push eax
    mov eax, dword ptr [esp + 12]
    push esi
    push 1
    push edx
    mov ecx, edi
    call sub_100259F4
    mov edx, dword ptr [esp + 24]
    mov ecx, dword ptr [esp + 28]
    mov eax, dword ptr [esp + 32]
    add edx, ebx
    add ecx, ebp
    add esp, 16
    dec eax
    mov dword ptr [esp + 8], edx
    mov dword ptr [esp + 12], ecx
    mov dword ptr [esp + 16], eax
    jne L0
    jmp L5
L2:
    jge L5
    mov eax, dword ptr [esp + 28]
    mov ecx, dword ptr [esp + 36]
    dec eax
    mov ebx, eax
    imul ebx, edx
    mov ebp, eax
    imul ebx, esi
    imul ebp, edi
    imul ebp, esi
    add ebx, ecx
    add ebp, ecx
    test eax, eax
    jl L5
    mov ecx, edx
    imul ecx, esi
    mov dword ptr [esp + 12], ecx
    mov ecx, edi
    imul ecx, esi
    inc eax
    mov dword ptr [esp + 8], ecx
    mov dword ptr [esp + 16], eax
    jmp L4
L3:
    mov edx, dword ptr [esp + 24]
L4:
    push ebx
    push esi
    push edi
    mov eax, ebp
    mov ecx, 1
    call sub_10025BD7
    mov edx, dword ptr [esp + 24]
    mov ecx, dword ptr [esp + 20]
    mov eax, dword ptr [esp + 28]
    add esp, 12
    sub ebx, edx
    sub ebp, ecx
    dec eax
    mov dword ptr [esp + 16], eax
    jne L3
L5:
    mov ecx, dword ptr [esp + 32]
    mov eax, dword ptr [esp + 28]
    cmp eax, ecx
    jle L8
    test edi, edi
    mov ebx, dword ptr [esp + 36]
    jle L11
    mov ebp, edi
    jmp L7
L6:
    mov ecx, dword ptr [esp + 32]
    lea ecx, [ecx]
L7:
    mov edx, dword ptr [esp + 28]
    push ebx
    push esi
    push edi
    push edx
    mov eax, ebx
    call sub_10025AAF
    add esp, 16
    add ebx, esi
    dec ebp
    jne L6
    pop ebp
    pop ebx
    add esp, 12
    ret
L8:
    jge L11
    mov ebx, dword ptr [esp + 36]
    lea eax, [edi - 1]
    mov edx, eax
    imul edx, esi
    add ebx, edx
    test eax, eax
    mov ebp, ebx
    jl L11
    inc eax
    mov dword ptr [esp + 24], eax
    jmp L10
L9:
    mov ecx, dword ptr [esp + 32]
    mov edi, edi
L10:
    mov edx, dword ptr [esp + 28]
    push ebx
    push esi
    push ecx
    mov eax, ebp
    mov ecx, edi
    call sub_10025C60
    mov eax, dword ptr [esp + 36]
    add esp, 12
    sub ebx, esi
    sub ebp, esi
    dec eax
    mov dword ptr [esp + 24], eax
    jne L9
L11:
    pop ebp
    pop ebx
    add esp, 12
    ret
FUN_10025d10 ENDP
END
