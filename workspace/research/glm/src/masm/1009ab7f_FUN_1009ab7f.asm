.686
.MODEL FLAT, C
EXTRN sub_1006513A:PROC
EXTRN sub_100828A3:PROC
EXTRN sub_10082902:PROC
EXTRN sub_10082952:PROC
EXTRN sub_1009956F:PROC
EXTRN sub_1009959C:PROC
EXTRN sub_100997EC:PROC
EXTRN sub_1009981F:PROC
EXTRN sub_1009985C:PROC
.CODE
FUN_1009ab7f PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 16]
    test eax, eax
    jne L0
    push 010114A14h
    push eax
    push eax
    push esi
    call sub_1009959C
    add esp, 16
    mov eax, 080004005h
    jmp L13
L0:
    push ebx
    mov ebx, dword ptr [ebp + 8]
    push edi
    mov edi, dword ptr [ebx + 20]
    add edi, 16
    push eax
    push edi
    mov ecx, esi
    call sub_1009981F
    jmp L3
L1:
    mov ecx, dword ptr [eax + 8]
    cmp dword ptr [ecx + 44], 0
    jne L2
    cmp dword ptr [ebx + 16], 2
    jne L5
    cmp dword ptr [ecx + 16], 2
    jne L5
L2:
    mov eax, dword ptr [eax + 12]
L3:
    test eax, eax
    jne L1
    mov eax, dword ptr [esi + 16]
    mov ecx, dword ptr [eax + 32]
    test ecx, ecx
    je L7
    cmp dword ptr [eax + 16], 3
    jne L7
    cmp dword ptr [ecx + 16], 2
    jne L7
    push ecx
    push edi
    mov ecx, esi
    call sub_1009985C
    test eax, eax
    je L7
    push dword ptr [edi + 8]
    push 0101149ECh
    push 000000BDCh
L4:
    push edi
    push esi
    call sub_1009956F
    add esp, 20
    mov eax, 080004005h
    jmp L12
L5:
    cmp dword ptr [ebp + 12], 0
    je L6
    push dword ptr [eax + 8]
    push ebx
    call sub_100828A3
    test eax, eax
    jne L11
L6:
    push dword ptr [edi + 8]
    push 0101149D4h
    push 000000BBBh
    jmp L4
L7:
    push 20
    call sub_1006513A
    xor edi, edi
    cmp eax, edi
    je L8
    push 010114734h
    push edi
    push edi
    mov ecx, eax
    call sub_10082952
    mov edi, eax
L8:
    test edi, edi
    je L9
    push ebx
    call sub_10082902
    test eax, eax
    mov dword ptr [edi + 8], eax
    jne L10
L9:
    mov eax, 08007000Eh
    jmp L12
L10:
    mov ecx, dword ptr [esi + 16]
    mov ecx, dword ptr [ecx + 20]
    mov dword ptr [eax + 32], ecx
    mov eax, dword ptr [edi + 8]
    mov eax, dword ptr [eax + 32]
    mov dword ptr [ebx + 32], eax
    mov ecx, dword ptr [esi + 76]
    mov eax, dword ptr [edi + 8]
    mov dword ptr [eax + 36], ecx
    mov eax, dword ptr [edi + 8]
    mov eax, dword ptr [eax + 36]
    mov dword ptr [ebx + 36], eax
    inc dword ptr [esi + 76]
    mov eax, dword ptr [esi + 16]
    mov eax, dword ptr [eax + 24]
    mov dword ptr [edi + 12], eax
    mov eax, dword ptr [esi + 16]
    mov dword ptr [eax + 24], edi
    push dword ptr [edi + 8]
    mov ecx, esi
    push dword ptr [esi + 16]
    call sub_100997EC
    test eax, eax
    jl L12
L11:
    xor eax, eax
L12:
    pop edi
    pop ebx
L13:
    pop esi
    pop ebp
    ret 8
FUN_1009ab7f ENDP
END
