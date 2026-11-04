.686
.MODEL FLAT, C
EXTRN sub_100FCC53:PROC
EXTRN sub_100FF022:PROC
EXTRN sub_100FF026:PROC
EXTRN sub_100FF02F:PROC
EXTRN sub_100FF039:PROC
EXTRN sub_100FF043:PROC
EXTRN sub_100FF05B:PROC
EXTRN sub_100FF063:PROC
EXTRN sub_100FF065:PROC
EXTRN sub_100FF072:PROC
EXTRN sub_100FF089:PROC
EXTRN sub_100FF09A:PROC
EXTRN sub_100FF09E:PROC
EXTRN sub_100FF0A5:PROC
EXTRN sub_100FF0AA:PROC
EXTRN sub_100FF0AC:PROC
EXTRN sub_100FF0AE:PROC
EXTRN sub_100FF0B3:PROC
EXTRN sub_100FF0BB:PROC
EXTRN sub_100FF0D0:PROC
EXTRN sub_100FF0D2:PROC
EXTRN sub_100FF0D6:PROC
EXTRN sub_100FF0E9:PROC
EXTRN sub_100FF0ED:PROC
EXTRN sub_100FF0F7:PROC
EXTRN sub_100FF159:PROC
EXTRN sub_100FF18C:PROC
EXTRN sub_100FF191:PROC
EXTRN sub_100FF193:PROC
EXTRN sub_100FF1A0:PROC
EXTRN sub_100FF1B6:PROC
EXTRN sub_100FF1B7:PROC
EXTRN sub_100FF1C0:PROC
EXTRN sub_100FF1C4:PROC
EXTRN sub_100FF1EB:PROC
EXTRN sub_100FF1EE:PROC
EXTRN sub_100FF1FB:PROC
EXTRN sub_100FF236:PROC
EXTRN sub_100FF244:PROC
.CODE
__expandtime PROC
    push push ebp
    mov mov ebp, esp
    movsx movsx eax, al
    cmp cmp eax, 90
    push push esi
    mov mov esi, dword ptr [ebp + 12]
    push push edi
    mov mov edi, ecx
    jg L8
    je L17
    cmp cmp eax, 77
    jg L6
    je L5
    sub sub eax, 37
    je L4
    sub sub eax, 28
    je L3
    dec dec eax
    je L2
    sub sub eax, 6
    je L1
    dec dec eax
    jne sub_100FF039
    mov mov eax, dword ptr [esi + 8]
    cdq cdq
    push push 12
    pop pop ecx
    idiv idiv ecx
    mov mov eax, edx
    test test eax, eax
    jne L20
    push push ecx
    pop pop eax
    jmp L22
L0:
    push push dword ptr [ebp + 20]
    mov mov eax, dword ptr [esi + 8]
    push push 2
    jmp L7
    mov mov edx, dword ptr [esi + 16]
    mov mov esi, dword ptr [ebp + 16]
    mov mov edx, dword ptr [esi + edx*4 + 104]
    jmp sub_100FF063
    mov mov edx, dword ptr [esi + 24]
    mov mov esi, dword ptr [ebp + 16]
    mov mov edx, dword ptr [esi + edx*4 + 28]
    jmp sub_100FF072
    mov mov eax, dword ptr [edi]
    mov mov byte ptr [eax], 37
    inc inc dword ptr [edi]
    dec dec dword ptr [ebx]
    jmp sub_100FF089
    push push dword ptr [ebp + 20]
    mov mov eax, dword ptr [esi + 4]
    push push 2
    jmp L9
    sub sub eax, 83
    je L14
    dec dec eax
    dec dec eax
    je L13
    dec dec eax
    dec dec eax
    je L12
    dec dec eax
    je L10
    dec dec eax
    jne sub_100FF0AE
    mov mov eax, dword ptr [esi + 20]
    cdq cdq
    push push 100
L6:
    pop pop ecx
    idiv idiv ecx
    push push dword ptr [ebp + 20]
    push push 4
    add add eax, 19
    imul imul eax, eax, 100
    add add eax, edx
    pop pop edx
    mov mov ecx, ebx
    call L0
    pop pop ecx
    jmp sub_100FF0D2
    push push dword ptr [ebp + 16]
    push push ebx
    push push edi
    push push esi
    push push 2
    push push dword ptr [ebp + 8]
    call sub_100FF0E9
    add add esp, 24
    test test eax, eax
    jne sub_100FF0ED
    xor xor eax, eax
    jmp sub_100FF0F7
    mov mov eax, dword ptr [esi + 24]
    test test eax, eax
    jne L16
    push push 6
    pop pop ecx
    jmp L18
    lea lea ecx, [eax - 1]
    jmp L19
    mov mov ecx, dword ptr [esi + 24]
    cmp cmp dword ptr [esi + 28], ecx
    jge L21
    xor xor eax, eax
    jmp sub_100FF089
    mov mov eax, dword ptr [esi + 28]
    push push 7
    cdq cdq
    pop pop esi
    idiv idiv esi
    cmp cmp edx, ecx
    jl sub_100FF09A
    jmp sub_100FF09E
    push push dword ptr [ebp + 20]
    mov mov eax, dword ptr [esi]
    push push 2
    jmp L15
    cmp cmp eax, 109
    jg sub_100FF0BB
    je sub_100FF0B3
    sub sub eax, 97
    je sub_100FF0AA
    dec dec eax
    je sub_100FF09E
    dec dec eax
    je sub_100FF065
    dec dec eax
    je sub_100FF05B
    sub sub eax, 6
    jne sub_100FF159
    push push dword ptr [ebp + 20]
    mov mov eax, dword ptr [esi + 28]
    inc inc eax
    push push 3
    jmp L23
    push push dword ptr [ebp + 20]
    mov mov eax, dword ptr [esi + 12]
    push push 2
    jmp L24
    cmp cmp dword ptr [ebp + 20], 0
    push push dword ptr [ebp + 16]
    push push ebx
L10:
    push push edi
    push push esi
    je sub_100FF0D0
    push push 1
    push push dword ptr [ebp + 8]
    call sub_100FF191
    add add esp, 24
L11:
    test test eax, eax
    je sub_100FF026
    cmp cmp dword ptr [ebx], 0
    je sub_100FF02F
    mov mov eax, dword ptr [edi]
    mov mov byte ptr [eax], 32
    inc inc dword ptr [edi]
    dec dec dword ptr [ebx]
    jmp sub_100FF022
    push push 0
    jmp sub_100FF0D6
    mov mov edx, dword ptr [esi + 16]
    mov mov esi, dword ptr [ebp + 16]
    mov mov edx, dword ptr [esi + edx*4 + 56]
    jmp sub_100FF1B6
    mov mov edx, dword ptr [esi + 24]
    mov mov esi, dword ptr [ebp + 16]
    mov mov edx, dword ptr [esi + edx*4]
    jmp sub_100FF1C4
    mov mov eax, dword ptr [esi + 16]
    inc inc eax
    push push dword ptr [ebp + 20]
    push push 2
    jmp sub_100FF043
    sub sub eax, 112
    je sub_100FF1C0
    sub sub eax, 7
    je sub_100FF1B7
    dec dec eax
    je sub_100FF1A0
    dec dec eax
    je sub_100FF193
    dec dec eax
    jne sub_100FF1EE
    call sub_100FCC53
    xor xor edx, edx
    cmp cmp dword ptr [esi + 32], edx
    setne setne dl
    mov mov edx, dword ptr [edx*4 + 0101A4E40h]
    jmp sub_100FF1FB
    push push dword ptr [ebp + 20]
    mov mov eax, dword ptr [esi + 20]
L17:
    cdq cdq
L18:
    push push 100
    pop pop ecx
    idiv idiv ecx
L19:
    mov mov eax, edx
    jmp sub_100FF18C
    cmp cmp dword ptr [ebp + 20], 0
    push push dword ptr [ebp + 16]
    push push ebx
    push push edi
    push push esi
    je sub_100FF1EB
L20:
    push push 1
    jmp sub_100FF0A5
L22:
    push push 0
    jmp sub_100FF0AC
L23:
    push push dword ptr [ebp + 20]
    mov mov eax, dword ptr [esi + 24]
    xor xor edx, edx
    inc inc edx
    jmp sub_100FF0A5
    cmp cmp dword ptr [esi + 8], 11
    mov mov edx, dword ptr [ebp + 16]
    jg sub_100FF236
    mov mov edx, dword ptr [edx + 098h]
    jmp sub_100FF244
    mov mov edx, dword ptr [edx + 09Ch]
    mov mov ecx, edi
    mov mov eax, ebx
    call L11
    xor xor eax, eax
    inc inc eax
    pop pop edi
    pop pop esi
    pop pop ebp
    ret ret
__expandtime ENDP
END
