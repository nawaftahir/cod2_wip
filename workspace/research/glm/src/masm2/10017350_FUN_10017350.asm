.686
.MODEL FLAT, C
EXTRN sub_1001711A:PROC
EXTRN sub_1001739C:PROC
EXTRN sub_100173BD:PROC
EXTRN sub_10061D0D:PROC
.CODE
FUN_10017350 PROC
    push push esi
    xor xor esi, esi
    test test ebx, ebx
    jle sub_1001739C
    jmp L0
    lea lea esp, [esp]
    mov mov eax, dword ptr [edi + esi*8]
    push push 0
    call sub_1001711A
    mov mov ecx, dword ptr [edi + esi*8 + 4]
    mov mov dword ptr [ecx], eax
    mov mov edx, dword ptr [edi + esi*8 + 4]
    mov mov eax, dword ptr [edx]
    add add esp, 4
    test test eax, eax
    jne sub_100173BD
    mov mov eax, dword ptr [edi + esi*8]
    push push eax
    push push 010194340h
    push push 0
    call sub_10061D0D
    add add esp, 12
FUN_10017350 ENDP
END
