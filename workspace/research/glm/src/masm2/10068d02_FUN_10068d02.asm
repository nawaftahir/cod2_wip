.686
.MODEL FLAT, C
EXTRN sub_10067C78:PROC
EXTRN sub_10067D6A:PROC
EXTRN sub_10068D85:PROC
EXTRN sub_10068DB1:PROC
.CODE
FUN_10068d02 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    mov mov eax, dword ptr [ebp + 16]
    and and eax, 0FFFFh
    dec dec eax
    je L1
    dec dec eax
    je L0
    sub sub eax, 3
    je L2
    dec dec eax
    jne sub_10068D85
    mov mov eax, dword ptr [ebp + 20]
    push push esi
    push push dword ptr [ebp + 24]
    mov mov esi, dword ptr [ebp + 28]
    push push 010193358h
    add add eax, 01388h
    push push eax
    push push dword ptr [esi + 48]
    push push dword ptr [esi]
    call sub_10067C78
    add add esp, 20
    mov mov dword ptr [esi + 76], 1
    pop pop esi
    jmp sub_10068DB1
    push push dword ptr [ebp + 24]
    mov mov eax, dword ptr [ebp + 20]
    push push 010193358h
    add add eax, 01388h
L1:
    push push eax
    mov mov eax, dword ptr [ebp + 28]
    push push dword ptr [eax + 48]
    push push dword ptr [eax]
    call sub_10067D6A
    add add esp, 20
    xor xor eax, eax
    pop pop ebp
    ret ret 24
FUN_10068d02 ENDP
END
