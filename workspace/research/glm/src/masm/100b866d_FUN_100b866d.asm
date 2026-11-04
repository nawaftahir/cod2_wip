.686
.MODEL FLAT, C
EXTRN sub_1008B168:PROC
EXTRN sub_100C7B5B:PROC
EXTRN sub_100C7B97:PROC
.CODE
FUN_100b866d PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov edx, dword ptr [ecx + 16]
    push esi
    mov esi, dword ptr [ebp + 8]
    mov eax, dword ptr [esi + 4]
    mov eax, dword ptr [edx + eax*4]
    mov eax, dword ptr [eax + 4]
    test ah, 1
    je L1
    push 1
L0:
    call sub_100C7B5B
    jmp L13
L1:
    mov edx, eax
    and edx, 000000200h
    je L2
    test al, al
    jns L2
    push 9
    jmp L0
L2:
    test edx, edx
    je L3
    push 2
    jmp L0
L3:
    test al, 16
    je L4
    push 3
    jmp L0
L4:
    push edi
    mov edx, 000002020h
    mov edi, eax
    and edi, edx
    cmp edi, edx
    jne L6
    push 5
L5:
    call sub_100C7B97
    jmp L12
L6:
    mov edx, 000040020h
    mov edi, eax
    and edi, edx
    cmp edi, edx
    jne L7
    push 6
    jmp L5
L7:
    test al, 32
    je L8
    push 4
    jmp L5
L8:
    test al, 1
    je L9
    test al, 2
    je L10
    push 7
    jmp L5
L9:
    test al, 2
    je L10
    test al, 4
    je L10
    push 8
    jmp L5
L10:
    test eax, 000010000h
    je L11
    mov eax, dword ptr [esi + 72]
    mov edx, dword ptr [ecx + 24]
    mov eax, dword ptr [edx + eax*4]
    push 010117E64h
    push 000001194h
    push dword ptr [eax + 60]
    push ecx
    call sub_1008B168
    add esp, 16
L11:
    mov eax, 080004005h
L12:
    pop edi
L13:
    pop esi
    pop ebp
    ret 4
FUN_100b866d ENDP
END
