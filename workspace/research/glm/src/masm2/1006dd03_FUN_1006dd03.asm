.686
.MODEL FLAT, C
EXTRN sub_10067D57:PROC
EXTRN sub_1006DC75:PROC
EXTRN sub_100F61DC:PROC
.CODE
FUN_1006dd03 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 0100h
    lea lea eax, [ebp + 24]
    push push eax
    push push dword ptr [ebp + 20]
    lea lea eax, [ebp - 0100h]
    push push 0100h
    push push eax
    call sub_100F61DC
    mov mov edx, dword ptr [ebp + 8]
    add add esp, 16
    lea lea eax, [ebp - 0100h]
    push push eax
    push push 010193358h
    push push dword ptr [ebp + 16]
    mov mov ecx, edx
    push push dword ptr [ebp + 12]
    mov mov byte ptr [ebp - 1], 0
    call sub_1006DC75
    push push eax
    mov mov eax, dword ptr [edx]
    add add eax, 24
    push push eax
    call sub_10067D57
    add add esp, 20
    xor xor eax, eax
    leave leave
    ret ret
FUN_1006dd03 ENDP
END
