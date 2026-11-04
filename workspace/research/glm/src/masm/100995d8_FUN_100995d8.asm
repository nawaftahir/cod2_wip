.686
.MODEL FLAT, C
EXTRN sub_100995A1:PROC
.CODE
FUN_100995d8 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    xor eax, eax
    cmp dword ptr [ebp + 8], eax
    push esi
    mov esi, ecx
    jne L1
    cmp dword ptr [esi + 64], eax
    jne L0
    push 010114710h
    push eax
    push eax
    push esi
    call sub_100995A1
    add esp, 16
L0:
    xor eax, eax
    inc eax
    mov dword ptr [esi + 64], eax
    mov dword ptr [esi + 68], eax
L1:
    mov eax, dword ptr [ebp + 8]
    pop esi
    pop ebp
    ret 4
FUN_100995d8 ENDP
END
