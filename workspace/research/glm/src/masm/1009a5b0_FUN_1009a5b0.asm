.686
.MODEL FLAT, C
EXTRN sub_1006507B:PROC
EXTRN sub_100650AE:PROC
EXTRN sub_100828C5:PROC
EXTRN sub_10083171:PROC
.CODE
FUN_1009a5b0 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push 36
    call sub_1006507B
    test eax, eax
    je L0
    mov ecx, eax
    call sub_10083171
    mov esi, eax
    jmp L1
L0:
    xor esi, esi
L1:
    test esi, esi
    je L5
    mov ecx, dword ptr [ebp + 8]
    and dword ptr [esi + 16], 0
    test ecx, ecx
    je L2
    mov eax, dword ptr [ecx]
    call dword ptr [eax + 4]
    test eax, eax
    mov dword ptr [esi + 20], eax
    je L5
L2:
    push 20
    call sub_100650AE
    test eax, eax
    je L3
    push 010114734h
    push 0
    push esi
    mov ecx, eax
    call sub_100828C5
    jmp L4
L3:
    xor eax, eax
L4:
    test eax, eax
    jne L6
L5:
    xor eax, eax
L6:
    pop esi
    pop ebp
    ret 4
FUN_1009a5b0 ENDP
END
