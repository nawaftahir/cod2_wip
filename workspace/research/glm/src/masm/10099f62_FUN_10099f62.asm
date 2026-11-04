.686
.MODEL FLAT, C
EXTRN sub_10099608:PROC
EXTRN sub_10099B8B:PROC
EXTRN sub_10099BAA:PROC
.CODE
FUN_10099f62 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    push esi
    mov esi, dword ptr [ebp + 8]
    xor edx, edx
    cmp esi, edx
    push edi
    mov ebx, ecx
    je L6
    mov edi, dword ptr [ebp + 12]
L0:
    mov eax, dword ptr [esi + 4]
    dec eax
    je L3
    sub eax, 5
    je L2
    dec eax
    dec eax
    je L1
    dec eax
    je L9
    dec eax
    dec eax
    jne L8
    mov esi, dword ptr [esi + 32]
    jmp L5
L1:
    mov esi, dword ptr [esi + 16]
    push esi
    mov ecx, ebx
    call sub_10099B8B
    mov ecx, eax
    test ecx, ecx
    je L6
    mov eax, edi
    xor edx, edx
    div ecx
    mov edi, edx
    jmp L5
L2:
    mov esi, dword ptr [esi + 24]
    jmp L5
L3:
    push dword ptr [esi + 8]
    mov ecx, ebx
    call sub_10099BAA
    cmp edi, eax
    jae L4
    mov esi, dword ptr [esi + 8]
    jmp L5
L4:
    mov esi, dword ptr [esi + 12]
    sub edi, eax
L5:
    xor edx, edx
    cmp esi, edx
    jne L0
L6:
    mov eax, 080004005h
L7:
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 12
L8:
    push 01010F7B0h
    push edx
    push edx
    push ebx
    call sub_10099608
    add esp, 16
    jmp L12
L9:
    mov ecx, dword ptr [esi + 16]
    sub ecx, edx
    mov eax, dword ptr [ebp + 16]
    je L10
    dec ecx
    je L10
    dec ecx
    je L10
    dec ecx
    jne L11
    mov dword ptr [eax + 16], 3
    jmp L11
L10:
    mov dword ptr [eax + 16], edx
L11:
    mov ecx, dword ptr [esi + 20]
    mov dword ptr [eax + 20], ecx
    xor ecx, ecx
    inc ecx
    mov dword ptr [eax + 24], ecx
    mov dword ptr [eax + 28], ecx
    mov ecx, dword ptr [esi + 32]
    and ecx, 000000200h
    mov dword ptr [eax + 32], ecx
L12:
    xor eax, eax
    jmp L7
FUN_10099f62 ENDP
END
