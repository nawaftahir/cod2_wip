.686
.MODEL FLAT, C
EXTRN sub_10067D57:PROC
EXTRN sub_1006DC75:PROC
EXTRN sub_100F61DC:PROC
.CODE
FUN_1006dd03 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 000000100h
    lea eax, [ebp + 24]
    push eax
    push dword ptr [ebp + 20]
    lea eax, [ebp - 000000100h]
    push 000000100h
    push eax
    call sub_100F61DC
    mov edx, dword ptr [ebp + 8]
    add esp, 16
    lea eax, [ebp - 000000100h]
    push eax
    push 010193358h
    push dword ptr [ebp + 16]
    mov ecx, edx
    push dword ptr [ebp + 12]
    mov byte ptr [ebp - 1], 0
    call sub_1006DC75
    push eax
    mov eax, dword ptr [edx]
    add eax, 24
    push eax
    call sub_10067D57
    add esp, 20
    xor eax, eax
    leave
    ret
FUN_1006dd03 ENDP
END
