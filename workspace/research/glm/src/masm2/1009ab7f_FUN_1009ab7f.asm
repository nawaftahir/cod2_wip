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
EXTRN sub_1009ACCF:PROC
EXTRN sub_1009ACDA:PROC
EXTRN sub_1009ACED:PROC
EXTRN sub_1009AD33:PROC
EXTRN sub_1009AD58:PROC
EXTRN sub_1009AD61:PROC
EXTRN sub_1009AD6C:PROC
EXTRN sub_1009AD76:PROC
EXTRN sub_1009ADBC:PROC
EXTRN sub_1009AE03:PROC
.CODE
FUN_1009ab7f PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push esi
    mov mov esi, ecx
    mov mov eax, dword ptr [esi + 16]
    test test eax, eax
    jne L0
    push push 010114A14h
    push push eax
    push push eax
    push push esi
    call sub_1009959C
    add add esp, 16
    mov mov eax, 080004005h
    jmp sub_1009ACED
    push push ebx
    mov mov ebx, dword ptr [ebp + 8]
    push push edi
    mov mov edi, dword ptr [ebx + 20]
    add add edi, 16
    push push eax
    push push edi
    mov mov ecx, esi
L0:
    call sub_1009981F
    jmp L1
    mov mov ecx, dword ptr [eax + 8]
    cmp cmp dword ptr [ecx + 44], 0
    jne L3
    cmp cmp dword ptr [ebx + 16], 2
    jne L4
    cmp cmp dword ptr [ecx + 16], 2
    jne L5
    mov mov eax, dword ptr [eax + 12]
    test test eax, eax
    jne L2
    mov mov eax, dword ptr [esi + 16]
    mov mov ecx, dword ptr [eax + 32]
    test test ecx, ecx
    je L6
    cmp cmp dword ptr [eax + 16], 3
    jne L7
    cmp cmp dword ptr [ecx + 16], 2
    jne L8
    push push ecx
    push push edi
    mov mov ecx, esi
    call sub_1009985C
    test test eax, eax
    je L9
    push push dword ptr [edi + 8]
    push push 0101149ECh
    push push 0BDCh
    push push edi
    push push esi
    call sub_1009956F
    add add esp, 20
    mov mov eax, 080004005h
L2:
    jmp sub_1009AD61
    cmp cmp dword ptr [ebp + 12], 0
    je sub_1009ACDA
    push push dword ptr [eax + 8]
    push push ebx
    call sub_100828A3
    test test eax, eax
    jne sub_1009AD76
    push push dword ptr [edi + 8]
    push push 0101149D4h
    push push 0BBBh
    jmp sub_1009ACCF
    push push 20
    call sub_1006513A
    xor xor edi, edi
    cmp cmp eax, edi
    je sub_1009AD33
    push push 010114734h
    push push edi
    push push edi
    mov mov ecx, eax
    call sub_10082952
    mov mov edi, eax
    test test edi, edi
    je sub_1009AD58
    push push ebx
    call sub_10082902
    test test eax, eax
    mov mov dword ptr [edi + 8], eax
    jne sub_1009AD6C
L5:
    mov mov eax, 08007000Eh
    jmp sub_1009ADBC
    mov mov ecx, dword ptr [esi + 16]
    mov mov ecx, dword ptr [ecx + 20]
    mov mov dword ptr [eax + 32], ecx
    mov mov eax, dword ptr [edi + 8]
    mov mov eax, dword ptr [eax + 32]
    mov mov dword ptr [ebx + 32], eax
    mov mov ecx, dword ptr [esi + 76]
    mov mov eax, dword ptr [edi + 8]
    mov mov dword ptr [eax + 36], ecx
    mov mov eax, dword ptr [edi + 8]
    mov mov eax, dword ptr [eax + 36]
    mov mov dword ptr [ebx + 36], eax
    inc inc dword ptr [esi + 76]
    mov mov eax, dword ptr [esi + 16]
    mov mov eax, dword ptr [eax + 24]
    mov mov dword ptr [edi + 12], eax
L6:
    mov mov eax, dword ptr [esi + 16]
    mov mov dword ptr [eax + 24], edi
L7:
    push push dword ptr [edi + 8]
    mov mov ecx, esi
    push push dword ptr [esi + 16]
    call sub_100997EC
    test test eax, eax
    jl sub_1009AE03
    xor xor eax, eax
L9:
    pop pop edi
    pop pop ebx
    pop pop esi
    pop pop ebp
    ret ret 8
FUN_1009ab7f ENDP
END
