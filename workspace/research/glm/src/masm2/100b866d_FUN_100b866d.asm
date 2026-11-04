.686
.MODEL FLAT, C
EXTRN sub_1008B168:PROC
EXTRN sub_100B8735:PROC
EXTRN sub_100B873D:PROC
EXTRN sub_100B8749:PROC
EXTRN sub_100B874F:PROC
EXTRN sub_100B8755:PROC
EXTRN sub_100B8759:PROC
EXTRN sub_100B876D:PROC
EXTRN sub_100B877D:PROC
EXTRN sub_100B8785:PROC
EXTRN sub_100B8787:PROC
EXTRN sub_100B8789:PROC
EXTRN sub_100B87BA:PROC
EXTRN sub_100C7B5B:PROC
EXTRN sub_100C7B97:PROC
.CODE
FUN_100b866d PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    mov mov edx, dword ptr [ecx + 16]
    push push esi
    mov mov esi, dword ptr [ebp + 8]
    mov mov eax, dword ptr [esi + 4]
    mov mov eax, dword ptr [edx + eax*4]
    mov mov eax, dword ptr [eax + 4]
    test test ah, 1
    je L0
    push push 1
    call sub_100C7B5B
    jmp sub_100B874F
    mov mov edx, eax
    and and edx, 0200h
    je L4
    test test al, al
    jns L5
    push push 9
    jmp L1
    test test edx, edx
    je L6
    push push 2
    jmp L2
L0:
    test test al, 16
    je L7
    push push 3
    jmp L3
    push push edi
    mov mov edx, 02020h
    mov mov edi, eax
    and and edi, edx
    cmp cmp edi, edx
L1:
    jne L8
    push push 5
    call sub_100C7B97
    jmp sub_100B8787
    mov mov edx, 040020h
L3:
    mov mov edi, eax
    and and edi, edx
L4:
    cmp cmp edi, edx
    jne sub_100B8749
L5:
    push push 6
    jmp sub_100B8735
    test test al, 32
    je sub_100B8759
    push push 4
    jmp sub_100B873D
    test test al, 1
    je sub_100B876D
L6:
    test test al, 2
    je sub_100B877D
    push push 7
    jmp sub_100B8749
    test test al, 2
    je sub_100B8785
    test test al, 4
    je sub_100B8789
L7:
    push push 8
    jmp sub_100B8755
    test test eax, 010000h
    je sub_100B87BA
    mov mov eax, dword ptr [esi + 72]
    mov mov edx, dword ptr [ecx + 24]
    mov mov eax, dword ptr [edx + eax*4]
    push push 010117E64h
    push push 01194h
    push push dword ptr [eax + 60]
    push push ecx
    call sub_1008B168
    add add esp, 16
    mov mov eax, 080004005h
    pop pop edi
    pop pop esi
    pop pop ebp
    ret ret 4
FUN_100b866d ENDP
END
