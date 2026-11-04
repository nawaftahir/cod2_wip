.686
.MODEL FLAT, C
EXTRN sub_10099608:PROC
EXTRN sub_10099B8B:PROC
EXTRN sub_10099BAA:PROC
EXTRN sub_1009A02F:PROC
EXTRN sub_1009A0A1:PROC
EXTRN sub_1009A0A2:PROC
EXTRN sub_1009A0A5:PROC
EXTRN sub_1009A0A8:PROC
EXTRN sub_1009A0AE:PROC
EXTRN sub_1009A0B6:PROC
EXTRN sub_1009A0B7:PROC
.CODE
FUN_10099f62 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ebx
    push push esi
    mov mov esi, dword ptr [ebp + 8]
    xor xor edx, edx
    cmp cmp esi, edx
    push push edi
    mov mov ebx, ecx
    je L2
    mov mov edi, dword ptr [ebp + 12]
    mov mov eax, dword ptr [esi + 4]
    dec dec eax
    je L1
    sub sub eax, 5
    je L1
    dec dec eax
    dec dec eax
    je L0
    dec dec eax
    je L7
    dec dec eax
    dec dec eax
    jne L5
    mov mov esi, dword ptr [esi + 32]
    jmp L4
    mov mov esi, dword ptr [esi + 16]
    push push esi
    mov mov ecx, ebx
    call sub_10099B8B
    mov mov ecx, eax
    test test ecx, ecx
    je L6
    mov mov eax, edi
    xor xor edx, edx
    div div ecx
    mov mov edi, edx
    jmp L7
    mov mov esi, dword ptr [esi + 24]
    jmp L8
    push push dword ptr [esi + 8]
    mov mov ecx, ebx
L0:
    call sub_10099BAA
    cmp cmp edi, eax
    jae L9
    mov mov esi, dword ptr [esi + 8]
    jmp sub_1009A02F
    mov mov esi, dword ptr [esi + 12]
    sub sub edi, eax
    xor xor edx, edx
    cmp cmp esi, edx
L1:
    jne L3
    mov mov eax, 080004005h
    pop pop edi
    pop pop esi
    pop pop ebx
    pop pop ebp
    ret ret 12
    push push 01010F7B0h
    push push edx
    push push edx
L2:
    push push ebx
    call sub_10099608
    add add esp, 16
    jmp sub_1009A0B6
    mov mov ecx, dword ptr [esi + 16]
    sub sub ecx, edx
    mov mov eax, dword ptr [ebp + 16]
    je sub_1009A0A2
    dec dec ecx
    je sub_1009A0A5
L4:
    dec dec ecx
    je sub_1009A0A8
    dec dec ecx
    jne sub_1009A0AE
    mov mov dword ptr [eax + 16], 3
L5:
    jmp sub_1009A0B7
    mov mov dword ptr [eax + 16], edx
    mov mov ecx, dword ptr [esi + 20]
    mov mov dword ptr [eax + 20], ecx
    xor xor ecx, ecx
    inc inc ecx
L7:
    mov mov dword ptr [eax + 24], ecx
    mov mov dword ptr [eax + 28], ecx
    mov mov ecx, dword ptr [esi + 32]
    and and ecx, 0200h
    mov mov dword ptr [eax + 32], ecx
    xor xor eax, eax
    jmp sub_1009A0A1
FUN_10099f62 ENDP
END
