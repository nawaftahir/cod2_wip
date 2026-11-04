.686
.MODEL FLAT, C
EXTRN sub_100995A1:PROC
EXTRN sub_10099610:PROC
EXTRN sub_10099614:PROC
.CODE
FUN_100995d8 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    xor xor eax, eax
    cmp cmp dword ptr [ebp + 8], eax
    push push esi
    mov mov esi, ecx
    jne sub_10099614
    cmp cmp dword ptr [esi + 64], eax
    jne sub_10099610
    push push 010114710h
    push push eax
    push push eax
    push push esi
    call sub_100995A1
    add add esp, 16
    xor xor eax, eax
    inc inc eax
    mov mov dword ptr [esi + 64], eax
    mov mov dword ptr [esi + 68], eax
    mov mov eax, dword ptr [ebp + 8]
    pop pop esi
    pop pop ebp
    ret ret 4
FUN_100995d8 ENDP
END
