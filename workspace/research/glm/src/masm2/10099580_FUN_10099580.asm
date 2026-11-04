.686
.MODEL FLAT, C
EXTRN sub_10067C87:PROC
EXTRN sub_100F61DD:PROC
.CODE
FUN_10099580 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 0100h
    push push esi
    lea lea eax, [ebp + 24]
    push push eax
    push push dword ptr [ebp + 20]
    lea lea eax, [ebp - 0100h]
    push push 0100h
    push push eax
    call sub_100F61DD
    mov mov esi, dword ptr [ebp + 8]
    lea lea eax, [ebp - 0100h]
    push push eax
    mov mov eax, dword ptr [esi + 4]
    push push 010193358h
    push push dword ptr [ebp + 16]
    add add eax, 24
    push push dword ptr [ebp + 12]
    mov mov byte ptr [ebp - 1], 0
    push push eax
    call sub_10067C87
    add add esp, 36
    xor xor eax, eax
    inc inc eax
    mov mov dword ptr [esi + 64], eax
    mov mov dword ptr [esi + 68], eax
    pop pop esi
    leave leave
    ret ret
FUN_10099580 ENDP
END
