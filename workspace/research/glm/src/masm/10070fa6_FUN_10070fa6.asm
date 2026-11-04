.686
.MODEL FLAT, C
EXTRN sub_1006EC54:PROC
EXTRN sub_10086233:PROC
.CODE
FUN_10070fa6 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    cmp dword ptr [ebp + 8], 0
    push edi
    mov edi, ecx
    jne L0
    xor eax, eax
    jmp L10
L0:
    mov ecx, dword ptr [edi + 8]
    mov eax, dword ptr [ebp + 16]
    and dword ptr [ebp - 4], 0
    cmp eax, dword ptr [ecx + 4]
    jae L1
    mov edx, dword ptr [ecx + 16]
    mov eax, dword ptr [edx + eax*4]
    jmp L2
L1:
    xor eax, eax
L2:
    test eax, eax
    jne L3
    mov eax, 080004005h
    jmp L10
L3:
    push eax
    call sub_10086233
    mov ecx, dword ptr [edi + 8]
    cmp eax, dword ptr [ecx + 4]
    mov dword ptr [ebp + 16], eax
    jae L4
    mov ecx, dword ptr [ecx + 16]
    mov ecx, dword ptr [ecx + eax*4]
    jmp L5
L4:
    xor ecx, ecx
L5:
    test ecx, ecx
    jne L6
    mov eax, 08007000Eh
    jmp L10
L6:
    or dword ptr [ecx + 4], 64
    mov edx, dword ptr [ecx + 4]
    test dl, 16
    je L9
    test dl, dl
    js L9
    push ebx
    push esi
    mov esi, 000000200h
    test esi, edx
    mov ebx, 000000400h
    je L7
    mov eax, dword ptr [edi + 8]
    test dword ptr [eax + 112], esi
    je L7
    or edx, ebx
    mov dword ptr [ecx + 4], edx
L7:
    mov edx, dword ptr [ecx + 4]
    test esi, edx
    jne L8
    mov eax, dword ptr [edi + 8]
    test dword ptr [eax + 112], ebx
    je L8
    or edx, 000100400h
    mov dword ptr [ecx + 4], edx
L8:
    pop esi
    pop ebx
L9:
    push 0
    push dword ptr [ebp + 32]
    lea eax, [ebp - 4]
    push dword ptr [ebp + 28]
    mov ecx, edi
    push eax
    push dword ptr [ebp + 28]
    push dword ptr [ebp + 24]
    push dword ptr [ebp + 20]
    push dword ptr [ebp + 16]
    push dword ptr [ebp + 12]
    push dword ptr [ebp + 8]
    call sub_1006EC54
L10:
    pop edi
    leave
    ret 28
FUN_10070fa6 ENDP
END
