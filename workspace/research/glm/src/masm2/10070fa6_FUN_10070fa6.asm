.686
.MODEL FLAT, C
EXTRN sub_1006EC54:PROC
EXTRN sub_1007108B:PROC
EXTRN sub_100710B2:PROC
EXTRN sub_100710B9:PROC
EXTRN sub_100710BF:PROC
EXTRN sub_100710C1:PROC
EXTRN sub_100710C3:PROC
EXTRN sub_100710D8:PROC
EXTRN sub_100710E5:PROC
EXTRN sub_100710ED:PROC
EXTRN sub_10086233:PROC
.CODE
FUN_10070fa6 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    cmp cmp dword ptr [ebp + 8], 0
    push push edi
    mov mov edi, ecx
    jne L0
    xor xor eax, eax
    jmp sub_1007108B
    mov mov ecx, dword ptr [edi + 8]
    mov mov eax, dword ptr [ebp + 16]
    and and dword ptr [ebp - 4], 0
    cmp cmp eax, dword ptr [ecx + 4]
    jae L1
L0:
    mov mov edx, dword ptr [ecx + 16]
    mov mov eax, dword ptr [edx + eax*4]
    jmp L2
    xor xor eax, eax
    test test eax, eax
    jne L3
    mov mov eax, 080004005h
    jmp sub_100710B2
    push push eax
    call sub_10086233
    mov mov ecx, dword ptr [edi + 8]
    cmp cmp eax, dword ptr [ecx + 4]
    mov mov dword ptr [ebp + 16], eax
    jae L4
    mov mov ecx, dword ptr [ecx + 16]
    mov mov ecx, dword ptr [ecx + eax*4]
    jmp L5
    xor xor ecx, ecx
    test test ecx, ecx
    jne L6
L2:
    mov mov eax, 08007000Eh
    jmp sub_100710D8
    or or dword ptr [ecx + 4], 64
    mov mov edx, dword ptr [ecx + 4]
    test test dl, 16
    je sub_100710BF
    test test dl, dl
    js sub_100710C3
    push push ebx
    push push esi
    mov mov esi, 0200h
    test test esi, edx
    mov mov ebx, 0400h
    je sub_100710B9
    mov mov eax, dword ptr [edi + 8]
    test test dword ptr [eax + 112], esi
    je sub_100710C1
    or or edx, ebx
    mov mov dword ptr [ecx + 4], edx
    mov mov edx, dword ptr [ecx + 4]
    test test esi, edx
    jne sub_100710E5
    mov mov eax, dword ptr [edi + 8]
    test test dword ptr [eax + 112], ebx
    je sub_100710ED
    or or edx, 0100400h
    mov mov dword ptr [ecx + 4], edx
    pop pop esi
    pop pop ebx
    push push 0
    push push dword ptr [ebp + 32]
    lea lea eax, [ebp - 4]
    push push dword ptr [ebp + 28]
    mov mov ecx, edi
    push push eax
    push push dword ptr [ebp + 28]
    push push dword ptr [ebp + 24]
    push push dword ptr [ebp + 20]
    push push dword ptr [ebp + 16]
    push push dword ptr [ebp + 12]
    push push dword ptr [ebp + 8]
    call sub_1006EC54
    pop pop edi
    leave leave
    ret ret 28
FUN_10070fa6 ENDP
END
