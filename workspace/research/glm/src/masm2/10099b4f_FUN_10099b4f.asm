.686
.MODEL FLAT, C
EXTRN sub_100995D6:PROC
EXTRN sub_10099BF3:PROC
EXTRN sub_10099BF4:PROC
EXTRN sub_10099BFA:PROC
EXTRN sub_10099C06:PROC
EXTRN sub_10099C0A:PROC
EXTRN sub_10099C2F:PROC
EXTRN sub_10099C33:PROC
EXTRN sub_10099C3F:PROC
EXTRN sub_10099C4F:PROC
.CODE
FUN_10099b4f PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ebx
    push push esi
    mov mov esi, dword ptr [ebp + 8]
    push push edi
    xor xor edi, edi
    test test esi, esi
    mov mov ebx, ecx
    je L2
    cmp cmp dword ptr [esi + 4], 1
    jne L3
    push push dword ptr [esi + 8]
    mov mov ecx, ebx
    call L0
L0:
    mov mov esi, dword ptr [esi + 12]
    add add edi, eax
    test test esi, esi
    jne L1
    test test esi, esi
    jne L4
    mov mov eax, edi
    jmp sub_10099C0A
    mov mov eax, dword ptr [esi + 4]
    sub sub eax, 6
    je sub_10099C06
    dec dec eax
    dec dec eax
    je sub_10099BFA
    dec dec eax
    je sub_10099BF4
L2:
    dec dec eax
    dec dec eax
L3:
    je sub_10099BF3
    push push 01010F7B0h
    push push 0
    push push 0
    push push ebx
    call sub_100995D6
    add add esp, 16
    xor xor eax, eax
    jmp sub_10099C33
    push push dword ptr [esi + 32]
    jmp sub_10099C2F
    mov mov eax, dword ptr [esi + 28]
    imul imul eax, dword ptr [esi + 24]
    jmp sub_10099C3F
    push push dword ptr [esi + 16]
    mov mov ecx, ebx
    call L5
L5:
    imul imul eax, dword ptr [esi + 20]
    jmp sub_10099C4F
    push push dword ptr [esi + 24]
    mov mov ecx, ebx
    call L6
L6:
    add add eax, edi
    pop pop edi
    pop pop esi
    pop pop ebx
    pop pop ebp
    ret ret 4
FUN_10099b4f ENDP
END
