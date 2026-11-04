.686
.MODEL FLAT, C
EXTRN sub_100C41C4:PROC
.CODE
FUN_100a5849 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    mov ebx, dword ptr [ebp + 20]
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    push ebx
    push dword ptr [ebp + 16]
    mov esi, ecx
    push dword ptr [ebp + 12]
    push edi
    call sub_100C41C4
    test eax, eax
    jl L1
    push dword ptr [edi + 108]
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x54]
    cmp eax, 17
    jne L0
    mov dword ptr [ebx], 1
L0:
    xor eax, eax
L1:
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 16
FUN_100a5849 ENDP
END
