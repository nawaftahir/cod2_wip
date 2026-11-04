.686
.MODEL FLAT, C
EXTRN sub_10063C2B:PROC
EXTRN sub_10063D03:PROC
EXTRN sub_10063D0F:PROC
EXTRN sub_10063F33:PROC
EXTRN sub_100641DE:PROC
EXTRN sub_100641EA:PROC
EXTRN sub_100641F8:PROC
EXTRN sub_10064202:PROC
EXTRN sub_10064209:PROC
EXTRN sub_1006420E:PROC
EXTRN sub_10064226:PROC
EXTRN sub_10064250:PROC
EXTRN sub_100642C4:PROC
EXTRN sub_100642CA:PROC
EXTRN sub_100642D6:PROC
EXTRN sub_100642FD:PROC
EXTRN sub_1006430A:PROC
EXTRN sub_1006431B:PROC
EXTRN sub_10064371:PROC
EXTRN sub_1006438B:PROC
EXTRN sub_100643AF:PROC
EXTRN sub_10067CFC:PROC
EXTRN sub_100686EB:PROC
EXTRN sub_100F79B5:PROC
EXTRN sub_100F79F2:PROC
EXTRN EXTRN fp_1010C040:DWORD:DWORD
.CODE
FUN_10063fd8 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 0218h
    push push esi
    mov mov esi, ecx
    mov mov eax, dword ptr [esi + 0298h]
    mov mov ecx, dword ptr [esi + 026Ch]
    push push edi
    lea lea edi, [esi + 0278h]
    push push edi
    or or eax, 12
    push push eax
    call sub_100686EB
    xor xor ecx, ecx
    cmp cmp eax, ecx
    jl sub_10064202
    mov mov eax, dword ptr [edi]
    sub sub eax, 10
    push push ebx
    push push 1
    pop pop ebx
    je L1
    dec dec eax
    je L0
    push push 01010C5E8h
    push push esi
    call sub_10063F33
    pop pop ecx
    pop pop ecx
    mov mov eax, 080004005h
    jmp sub_10064226
    mov mov dword ptr [ebp - 8], ebx
    jmp L2
    mov mov dword ptr [ebp - 8], ecx
    mov mov edx, dword ptr [esi + 0270h]
    cmp cmp edx, ecx
    mov mov eax, dword ptr [esi + 0280h]
    mov mov dword ptr [ebp - 4], eax
    jne L3
    mov mov eax, dword ptr [esi + 026Ch]
    cmp cmp dword ptr [eax + 24], ecx
    jne L4
    push push 01010C618h
    push push 05E1h
    push push edi
    jmp L7
    mov mov eax, dword ptr [esi + 0268h]
    test test eax, eax
    je L8
    mov mov eax, dword ptr [eax + 108]
    inc inc ecx
    test test eax, eax
L0:
    jne L6
L1:
    cmp cmp ecx, 32
    jb L9
    push push 01010C5F8h
    push push 05E2h
    lea lea eax, [esi + 0278h]
    push push eax
    lea lea eax, [esi + 24]
    push push eax
    call sub_10067CFC
    add add esp, 16
L2:
    mov mov dword ptr [esi + 72], ebx
    mov mov dword ptr [esi + 68], ebx
    jmp L5
    test test edx, edx
    jne sub_1006420E
    lea lea eax, [ebp - 16]
    push push eax
    lea lea eax, [ebp - 0114h]
    push push eax
    mov mov edi, 0104h
    push push edi
    push push dword ptr [ebp - 4]
    call dword ptr [fp_1010C040]
    mov mov ecx, dword ptr [ebp - 4]
    lea lea eax, [ebp - 0114h]
    mov mov bl, byte ptr [ecx]
    mov mov dl, bl
    cmp cmp bl, byte ptr [eax]
    jne sub_100641EA
    test test dl, dl
    je sub_100641EA
    mov mov bl, byte ptr [ecx + 1]
    mov mov dl, bl
    cmp cmp bl, byte ptr [eax + 1]
    jne sub_100641F8
    inc inc ecx
    inc inc ecx
    inc inc eax
L4:
    inc inc eax
    test test dl, dl
    jne sub_100641DE
    xor xor eax, eax
    jmp sub_10064209
    sbb sbb eax, eax
    sbb sbb eax, -1
    test test eax, eax
    je sub_10064250
    push push dword ptr [ebp - 4]
    mov mov eax, dword ptr [esi + 0268h]
    push push dword ptr [eax + 96]
    lea lea eax, [ebp - 0218h]
    push push 010194930h
L6:
    push push edi
    push push eax
    call sub_100F79B5
    add add esp, 20
    lea lea eax, [ebp - 16]
    push push eax
    lea lea eax, [ebp - 0114h]
    push push eax
    push push edi
    lea lea eax, [ebp - 0218h]
    push push eax
    call dword ptr [fp_1010C040]
    lea lea eax, [ebp - 0114h]
    xor xor ebx, ebx
    mov mov dword ptr [ebp - 4], eax
    inc inc ebx
    mov mov eax, dword ptr [esi + 0268h]
    test test eax, eax
L9:
    je sub_100642C4
    cmp cmp dword ptr [eax + 88], 0
    je sub_100642CA
    mov mov eax, dword ptr [eax + 100]
    mov mov dword ptr [ebp - 12], eax
    jmp sub_100642D6
    and and dword ptr [ebp - 12], 0
    push push 112
    call sub_100F79F2
    test test eax, eax
    pop pop ecx
    je sub_100642FD
    mov mov ecx, eax
    call sub_10063C2B
    mov mov edi, eax
    jmp sub_1006430A
    xor xor edi, edi
    test test edi, edi
    jne sub_1006431B
    mov mov eax, 08007000Eh
    jmp sub_10064371
    push push dword ptr [ebp - 12]
    lea lea eax, [esi + 24]
    push push dword ptr [ebp - 8]
    mov mov ecx, edi
    push push dword ptr [esi + 0270h]
    push push eax
    lea lea eax, [esi + 0278h]
    push push eax
    push push esi
    push push 0
    push push dword ptr [ebp - 4]
    call sub_10063D0F
    test test eax, eax
    mov mov dword ptr [ebp - 8], eax
    jge sub_1006438B
    push push ebx
    mov mov ecx, edi
    mov mov dword ptr [esi + 72], ebx
    mov mov dword ptr [esi + 68], ebx
    call sub_10063D03
    mov mov eax, dword ptr [ebp - 8]
    jmp sub_100643AF
    mov mov eax, dword ptr [esi + 0268h]
    mov mov dword ptr [edi + 108], eax
    mov mov dword ptr [esi + 0268h], edi
    xor xor eax, eax
    pop pop ebx
    pop pop edi
    pop pop esi
    leave leave
    ret ret
FUN_10063fd8 ENDP
END
