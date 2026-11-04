.686
.MODEL FLAT, C
EXTRN sub_1001711A:PROC
EXTRN sub_1001739C:PROC
EXTRN sub_100173BD:PROC
EXTRN sub_10061D0D:PROC
.CODE
FUN_10017350 PROC
    push esi
    xor esi, esi
    test ebx, ebx
    jle sub_1001739C
    jmp L0
    lea esp, [esp]
L0:
    mov eax, dword ptr [edi + esi*8]
    push 0
    call sub_1001711A
    mov ecx, dword ptr [edi + esi*8 + 4]
    mov dword ptr [ecx], eax
    mov edx, dword ptr [edi + esi*8 + 4]
    mov eax, dword ptr [edx]
    add esp, 4
    test eax, eax
    jne sub_100173BD
    mov eax, dword ptr [edi + esi*8]
    push eax
    push 010194340h
    push 0
    call sub_10061D0D
    add esp, 12
FUN_10017350 ENDP
END
