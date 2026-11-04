.686
.MODEL FLAT, C
EXTRN sub_1006507B:PROC
EXTRN sub_100650AE:PROC
EXTRN sub_100828C5:PROC
EXTRN sub_10083171:PROC
EXTRN sub_1009A616:PROC
EXTRN sub_1009A62D:PROC
EXTRN sub_1009A644:PROC
EXTRN sub_1009A649:PROC
EXTRN sub_1009A65C:PROC
EXTRN sub_1009A668:PROC
.CODE
FUN_1009a5b0 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push esi
    push push 36
    call sub_1006507B
    test test eax, eax
    je L0
    mov mov ecx, eax
    call sub_10083171
    mov mov esi, eax
    jmp L1
    xor xor esi, esi
    test test esi, esi
    je sub_1009A62D
    mov mov ecx, dword ptr [ebp + 8]
    and and dword ptr [esi + 16], 0
    test test ecx, ecx
    je sub_1009A616
L0:
    mov mov eax, dword ptr [ecx]
    call call dword ptr [eax + 4]
    test test eax, eax
    mov mov dword ptr [esi + 20], eax
    je sub_1009A644
    push push 20
    call sub_100650AE
    test test eax, eax
    je sub_1009A649
    push push 010114734h
    push push 0
    push push esi
    mov mov ecx, eax
    call sub_100828C5
    jmp sub_1009A65C
    xor xor eax, eax
    test test eax, eax
    jne sub_1009A668
    xor xor eax, eax
    pop pop esi
    pop pop ebp
    ret ret 4
FUN_1009a5b0 ENDP
END
