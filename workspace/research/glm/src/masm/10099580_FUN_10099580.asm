.686
.MODEL FLAT, C
EXTRN sub_10067C87:PROC
EXTRN sub_100F61DD:PROC
.CODE
FUN_10099580 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 000000100h
    push esi
    lea eax, [ebp + 24]
    push eax
    push dword ptr [ebp + 20]
    lea eax, [ebp - 000000100h]
    push 000000100h
    push eax
    call sub_100F61DD
    mov esi, dword ptr [ebp + 8]
    lea eax, [ebp - 000000100h]
    push eax
    mov eax, dword ptr [esi + 4]
    push 010193358h
    push dword ptr [ebp + 16]
    add eax, 24
    push dword ptr [ebp + 12]
    mov byte ptr [ebp - 1], 0
    push eax
    call sub_10067C87
    add esp, 36
    xor eax, eax
    inc eax
    mov dword ptr [esi + 64], eax
    mov dword ptr [esi + 68], eax
    pop esi
    leave
    ret
FUN_10099580 ENDP
END
